package pt.isel.gomoku.domain.utils

/**
 * Represents the navigation between pages.
 * [PREVIOUS] - Navigate to the previous page.
 * [NEXT] - Navigate to the next page.
 * [FIRST] - Navigate to the first page.
 * [LAST] - Navigate to the last page.
 */
enum class PageNavigation {
    PREVIOUS, NEXT, FIRST, LAST;

    override fun toString() = this.name.lowercase()
}
