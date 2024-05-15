package org.example

import kotlin.test.Test
import kotlin.test.assertEquals

class ExchangerTests {

    @Test
    fun `two threads can exchange values`() {
        val exchanger = Exchanger<Int>()
        val thread1Value = 1
        val thread2Value = 2

        val thread1 = Thread {
            var receivedValue = exchanger.exchange(thread1Value)
            while (receivedValue == null){
                receivedValue = exchanger.exchange(thread1Value)
            }
            assertEquals(thread2Value, receivedValue)
        }

        val thread2 = Thread {
            val receivedValue = exchanger.exchange(thread2Value)
            assertEquals(thread1Value, receivedValue)
        }

        thread1.start()
        thread2.start()

        thread1.join()
        thread2.join()
    }

    @Test
    fun `a thread cannot exchange a value when no other thread is available`() {
        val exchanger = Exchanger<Int>()
        val threadValue = 1

        val thread = Thread {
            try {
                exchanger.exchange(threadValue)
            } catch (e: IllegalStateException) {
                //return e
            }
        }

        thread.start()
        thread.join()
    }
}
