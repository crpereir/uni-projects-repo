package pt.isel.gomoku.presentation.domain.utils

import org.junit.Test
import pt.isel.gomoku.domain.utils.Page
import kotlin.test.assertFalse
import kotlin.test.assertTrue

class PageTests {

    @Test
    fun `isPossibleGoForward returns true if it's possible go forward`() {
        // Arrange
        // Act
        // Assert
        assertTrue((Page.FIRST).isPossibleGoForward())
    }

    @Test
    fun `isPossibleGoForward returns false if it's not possible go forward`() {
        // Arrange
        // Act
        // Assert
        assertFalse((Page.LAST).isPossibleGoForward())
    }

    @Test
    fun `isPossibleGoBack returns true if it's possible go forward`() {
        // Arrange
        // Act
        // Assert
        assertTrue((Page.LAST).isPossibleGoBack())
    }

    @Test
    fun `isPossibleGoBack returns false if it's not possible go forward`() {
        // Arrange
        // Act
        // Assert
        assertFalse((Page.FIRST).isPossibleGoBack())
    }
}