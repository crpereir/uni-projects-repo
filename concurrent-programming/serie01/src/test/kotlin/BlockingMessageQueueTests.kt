
package org.example
/*
import org.junit.jupiter.api.Assertions.*
import org.junit.jupiter.api.Test
import kotlin.time.Duration
import java.util.concurrent.Executors


class BlockingMessageQueueTest {

    @Test
    fun `test enqueue and dequeue`() {
        val queue = BlockingMessageQueue<Int>(5)
        val messages = listOf(1, 2, 3)

        val enqueueResult = queue.tryEnqueue(messages, Duration.ofSeconds(1))
        assertTrue(enqueueResult)

        val dequeueResult = queue.tryDequeue(Duration.ofSeconds(1))
        assertNotNull(dequeueResult)
        assertEquals(1, dequeueResult)
    }

    @Test
    fun `test enqueue with capacity overflow`() {
        val queue = BlockingMessageQueue<Int>(2)
        val messages = listOf(1, 2, 3)

        val enqueueResult = queue.tryEnqueue(messages, Duration.ofSeconds(1))
        assertFalse(enqueueResult)
    }

    @Test
    fun `test dequeue from empty queue`() {
        val queue = BlockingMessageQueue<Int>(5)

        val dequeueResult = queue.tryDequeue(Duration.ofSeconds(1))
        assertNull(dequeueResult)
    }

    @Test
    fun `test enqueue with timeout`() {
        val queue = BlockingMessageQueue<Int>(2)
        val messages = listOf(1, 2, 3)

        val enqueueResult = queue.tryEnqueue(messages, Duration.ofSeconds(1))
        assertFalse(enqueueResult)
    }

    @Test
    fun `test dequeue with timeout`() {
        val queue = BlockingMessageQueue<Int>(5)

        val dequeueResult = queue.tryDequeue(Duration.ofSeconds(1))
        assertNull(dequeueResult)
    }

    /*@Test
    fun `test enqueue and dequeue with multiple threads`() {
        val queue = BlockingMessageQueue<Int>(5)
        val messages = listOf(1, 2, 3)

        val executor = Executors.newFixedThreadPool(2)
        val enqueueTask = executor.submit {
            queue.tryEnqueue(messages, Duration.ofSeconds(1))
        }
        val dequeueTask = executor.submit {
            queue.tryDequeue(Duration.ofSeconds(1))
        }

        enqueueTask.get()
        val dequeueResult = dequeueTask.get()
        //assertNotNull(dequeueResult)
        assertEquals(1, dequeueResult)
    }*/
}*/