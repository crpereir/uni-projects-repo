package org.example

import java.time.Duration
import java.util.LinkedList
import java.util.concurrent.TimeUnit
import java.util.concurrent.locks.ReentrantLock
import kotlin.concurrent.withLock

class BlockingMessageQueue<T>(private val capacity: Int) {
    private val lock = ReentrantLock()
    private val notFull = lock.newCondition()
    private val notEmpty = lock.newCondition()
    private val queue = LinkedList<T>()

    @Throws(InterruptedException::class)
    fun tryEnqueue(messages: List<T>, timeout: Duration): Boolean {
        // fast-path
        if(queue.size + messages.size <= capacity) {
            lock.withLock {
                queue.addAll(messages)
                notEmpty.signal()
            }
            return true
        }

        // wait-path
        try {
            var nanos = timeout.toNanos()
            while (true) {
                lock.withLock {
                    nanos = notFull.awaitNanos(nanos)
                    if (queue.size + messages.size <= capacity) {
                        queue.addAll(messages)
                        notEmpty.signal()
                        return true
                    }
                    if (nanos <= 0) return false
                }
            }
        } catch (e: InterruptedException) {
            throw e
        }
    }

    @Throws(InterruptedException::class)
    fun tryDequeue(timeout: Duration): T? {
        // fast-path
        if(queue.isNotEmpty()) {
            lock.withLock {
                val message = queue.removeFirst()
                notFull.signal()
                return message
            }
        }

        // wait-path
        try {
            var nanos = timeout.toNanos()
            while (true) {
                lock.withLock {
                    nanos = notEmpty.awaitNanos(nanos)
                    if (queue.isNotEmpty()) {
                        val message = queue.removeFirst()
                        notFull.signal()
                        return message
                    }
                    if (nanos <= 0) return null
                }
            }
        } catch (e: InterruptedException) {
            throw e
        }

    }
}