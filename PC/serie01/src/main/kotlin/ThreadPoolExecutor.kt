package org.example


import java.util.concurrent.BlockingQueue
import java.util.concurrent.RejectedExecutionException
import java.util.concurrent.locks.ReentrantLock
import kotlin.concurrent.withLock
import kotlin.time.Duration

class ThreadPoolExecutor(
    private val maxThreadPoolSize: Int,
    private val keepAliveTime: Duration,
) {

    private val lock = ReentrantLock()
    private val condition = lock.newCondition()
    private val workers = mutableListOf<Thread>()
    private val tasks = BlockingMessageQueue<Runnable>(maxThreadPoolSize)
    private var shutDown = false

    init {
        require(maxThreadPoolSize > 0) { "maxThreadPoolSize must be greater than 0" }
    }

    @Throws(RejectedExecutionException::class)
    fun execute(runnable: Runnable): Unit {
        tasks.tryEnqueue(runnable, Duration.INFINITE)

        if (shutDown) throw RejectedExecutionException("ThreadPoolExecutor is shutdown")
        lock.withLock {
            for (t in workers) {
                if (!t.isAlive) {
                    t.run { runnable.run() }
                    return
                }
            }
            if (workers.size < maxThreadPoolSize) {
                val newWorkerThread = Thread {
                    runnable.run()
                }
                workers.add(newWorkerThread)
                newWorkerThread.start()
            } else {
                tasks.add(runnable)
            }
        }
    }

    fun shutdown(): Unit {
        lock.withLock {
            shutDown = true
        }
    }

    @Throws(InterruptedException::class)
    fun awaitTermination(timeout: Duration): Boolean {
        lock.withLock {
            if (!shutDown) {
                return false
            }

            val timeoutNanos = timeout.inWholeMilliseconds
            val startNanos = System.nanoTime()

            while (workers.isNotEmpty()) {
                if (System.nanoTime() - startNanos >= timeoutNanos) {
                    return false
                }
                try {
                    /*if (!(condition.awaitNanos(timeoutNanos - (System.nanoTime() - startNanos)))) {
                        return false
                    }*/
                } catch (ie: InterruptedException) {
                    throw ie
                }
            }
            return true
        }
    }
}