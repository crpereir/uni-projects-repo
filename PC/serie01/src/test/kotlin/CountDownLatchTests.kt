package org.example


import kotlin.test.Test
import kotlin.test.*


class CountDownLatchTests {

    @Test
    fun `await does not block when count is zero`() {
        val latch = CountDownLatch(0)

        var isDone = false
        val thread = Thread {
            latch.await()
            isDone = true
        }
        thread.start()
        thread.join()
        assertTrue(isDone)
    }

    @Test
    fun `countDown releases all waiting threads when count reaches zero`() {
        val latch = CountDownLatch(1)

        var isDone1 = false
        var isDone2 = false

        val thread1 = Thread {
            latch.await()
            isDone1 = true
        }
        val thread2 = Thread {
            latch.await()
            isDone2 = true
        }
        thread1.start()
        thread2.start()

        assertFalse(isDone1)
        assertFalse(isDone2)

        latch.countDown()
        thread1.join()
        thread2.join()

        assertTrue(isDone1)
        assertTrue(isDone2)
    }

    @Test
    fun `pressure test`() {
        val testDurationMillis = 10_000L // 10 seconds
        val latchCount = 1_000_000
        val latch = CountDownLatch(latchCount)
        val countdownThreads = List(100) {
            Thread {
                while (true) {
                    latch.countDown()
                }
            }
        }

        val awaitThreads = List(100) {
            Thread {
                while (true) {
                    latch.await()
                }
            }
        }
        countdownThreads.forEach(Thread::start)
        awaitThreads.forEach(Thread::start)

        val startTime = System.currentTimeMillis()
        while (System.currentTimeMillis() - startTime < testDurationMillis) {
            latch.countDown()
        }

        countdownThreads.forEach(Thread::interrupt)
        awaitThreads.forEach(Thread::interrupt)
    }
}