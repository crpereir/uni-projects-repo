package pt.isel.gomoku.presentation.domain.author

import org.junit.Test
import pt.isel.gomoku.domain.about.Author

class AuthorTests {

    @Test
    fun `create author with valid arguments succeeds`() {
        // Arrange
        // Act
        // Assert
        Author("user", "123", "userEmail")
    }

    @Test(expected = IllegalArgumentException::class)
    fun `create author with invalid arguments fails`() {
        // Arrange
        // Act
        // Assert
        Author("", "", "")
    }
}