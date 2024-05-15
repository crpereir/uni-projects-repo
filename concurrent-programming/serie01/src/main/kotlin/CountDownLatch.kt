package org.example

import java.util.concurrent.locks.ReentrantLock
import kotlin.concurrent.withLock


class CountDownLatch(private var count: Int) {
    private val lock = ReentrantLock()
    private val condition = lock.newCondition()

    fun await() {
        lock.withLock {
            while (count > 0) {
                condition.await()
            }
        }
    }

    fun countDown() {
        lock.withLock {
            if (count > 0) {
                count--
                if (count == 0) {
                    condition.signalAll()
                }
            }
        }
    }
}










