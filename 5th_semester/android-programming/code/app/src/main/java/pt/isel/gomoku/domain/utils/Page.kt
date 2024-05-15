package pt.isel.gomoku.domain.utils

/**
 * Represents a Page.
 * [SINGLE] - Single page where all the elements fit.
 * [FIRST] - First page of a list of elements.
 * [MIDDLE] - Middle page of a list of elements.
 * [LAST] - Last page of a list of elements.
 */
enum class Page {
    SINGLE, FIRST, MIDDLE, LAST;

    /**
     * Check if it is possible to move to the next page, i.e., if there is a next page.
     */
    fun isPossibleGoForward() = this == MIDDLE || this == FIRST

    /**
     * Check if it is possible to move to the previous page, i.e., if there is a previous page.
     */
    fun isPossibleGoBack() = this == MIDDLE || this == LAST
}