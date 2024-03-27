
package org.example

import org.junit.jupiter.api.Assertions.*
import org.junit.jupiter.api.Test
import java.time.Duration
import java.util.concurrent.Executors

class BlockingMessageQueueTest {
    @Test
    fun `test enqueue blocks when full`() {
        val queue = BlockingMessageQueue<Int>(1)
        queue.tryEnqueue(listOf(1), Duration.ofSeconds(1))

        val executor = Executors.newSingleThreadExecutor()
        val future = executor.submit<Boolean> { queue.tryEnqueue(listOf(2), Duration.ofMillis(100)) }

        assertFalse(future.get())
    }

    @Test
    fun `test dequeue blocks when empty`() {
        val queue = BlockingMessageQueue<Int>(1)

        val executor = Executors.newSingleThreadExecutor()
        val future = executor.submit<Int?> { queue.tryDequeue(Duration.ofMillis(100)) }

        assertNull(future.get())
    }

    @Test
    fun `test enqueue unblocks when not full`() {
        val queue = BlockingMessageQueue<Int>(1)
        queue.tryEnqueue(listOf(1), Duration.ofSeconds(1))

        val executor = Executors.newSingleThreadExecutor()
        executor.submit<Boolean> { queue.tryEnqueue(listOf(2), Duration.ofSeconds(1)) }

        queue.tryDequeue(Duration.ofSeconds(1))

        assertTrue(executor.shutdownNow().isEmpty())
    }

    @Test
    fun `test dequeue unblocks when not empty`() {
        val queue = BlockingMessageQueue<Int>(1)

        val executor = Executors.newSingleThreadExecutor()
        executor.submit<Int?> { queue.tryDequeue(Duration.ofSeconds(1)) }

        queue.tryEnqueue(listOf(1), Duration.ofSeconds(1))

        assertTrue(executor.shutdownNow().isEmpty())
    }
}