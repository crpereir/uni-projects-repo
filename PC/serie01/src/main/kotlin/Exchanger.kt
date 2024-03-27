package org.example

import java.util.concurrent.atomic.AtomicReference
import java.util.concurrent.locks.ReentrantLock
import kotlin.concurrent.withLock


class Exchanger<T> {
    private val semaphore = Semaphore(1)
    private val value = AtomicReference<T>()

    fun exchange(myValue: T): T {
        semaphore.acquire()
        val oldValue = value.getAndSet(myValue)
        semaphore.release()
        return oldValue
    }
}

class Semaphore(private var permits: Int) {
    private val lock = ReentrantLock()
    private val condition = lock.newCondition()

    fun acquire() {
        lock.withLock {
            while (permits <= 0) {
                condition.await()
            }
            permits--
        }
    }

    fun release() {
        lock.withLock {
            permits++
            condition.signal()
        }
    }


    fun availablePermits(): Int {
        synchronized(lock) {
            return permits
        }
    }
}

