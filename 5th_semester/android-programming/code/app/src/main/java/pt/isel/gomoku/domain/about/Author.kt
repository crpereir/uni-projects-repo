package pt.isel.gomoku.domain.about

/**
 * Represents a author.
 * @property name of author.
 * @property number of author.
 * @property email of author.
 */
data class Author(val name: String, val number: String, val email: String) {

    init {
        require(name.isNotBlank() && number.isNotBlank() && email.isNotBlank())
    }
}
