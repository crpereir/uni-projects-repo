package pt.isel.gomoku.ui.common.topbars

/**
 * Represents callback functions in top bar navigation's.
 * _Null_ means it is not available on the top bar
 * @property onBackRequested navigates to the previous screen.
 * @property onInfoRequested navigates to the info screen.
 * @property onRefreshRequested refresh the current page content.
 * @property onLogOutRequested logout the user.
 * @property onSignUpRequested navigates to the sign up screen.
 */
data class NavigationHandlers(
    val onBackRequested: (() -> Unit)? = null,
    val onInfoRequested: (() -> Unit)? = null,
    val onRefreshRequested: (() -> Unit)? = null,
    val onLogOutRequested: (() -> Unit)? = null,
    val onSignUpRequested: (() -> Unit)? = null,
)
