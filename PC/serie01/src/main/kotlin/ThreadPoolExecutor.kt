package org.example


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
    private val tasks = mutableListOf<Runnable>()
    private var shutDown = false

    init {
        require(maxThreadPoolSize > 0) { "maxThreadPoolSize must be greater than 0" }
    }

    @Throws(RejectedExecutionException::class)
    fun execute(runnable: Runnable): Unit {
        lock.withLock {
            if (shutDown) {
                throw RejectedExecutionException("ThreadPoolExecutor is shutdown")
            }

            // (1)
            if (workers.size < maxThreadPoolSize) {
                val worker = Thread {
                    while(true) {
                        val task: Runnable
                        lock.withLock {
                            if (tasks.isEmpty()) {
                                if (shutDown){
                                    workers.remove(Thread.currentThread())
                                }
                                try {
                                    if (keepAliveTime.isPositive()) {                  // (2) - CORRIGIR
                                        workers.remove(Thread.currentThread())
                                    }
                                } catch (ie: InterruptedException) {
                                    throw ie
                                }
                                if (tasks.isEmpty()){
                                    workers.remove(Thread.currentThread())
                                }
                            }
                            task = tasks.removeAt(0)
                        }
                        task.run()
                    }
                }
                workers.add(worker)
                worker.start()
            } else {
                tasks.add(runnable)
                condition.signal()
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