package pt.isel.gomoku.ui.home

import android.app.Activity
import android.content.Intent
import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.viewModels
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import androidx.compose.ui.res.stringResource
import androidx.lifecycle.Lifecycle
import androidx.lifecycle.lifecycleScope
import androidx.lifecycle.repeatOnLifecycle
import kotlinx.coroutines.flow.collectLatest
import kotlinx.coroutines.launch
import kotlinx.datetime.Clock
import kotlinx.datetime.Instant
import pt.isel.gomoku.APPDependencyProvider
import pt.isel.gomoku.R
import pt.isel.gomoku.domain.infra.Action
import pt.isel.gomoku.domain.infra.Link
import pt.isel.gomoku.domain.states.HomeState
import pt.isel.gomoku.domain.states.Idle
import pt.isel.gomoku.domain.states.LoadState
import pt.isel.gomoku.domain.states.Loaded
import pt.isel.gomoku.domain.states.exceptionOrNull
import pt.isel.gomoku.domain.states.getOrNull
import pt.isel.gomoku.domain.states.idle
import pt.isel.gomoku.domain.users.UserInfo
import pt.isel.gomoku.ui.about.AboutActivity
import pt.isel.gomoku.ui.authentication.AuthActivity
import pt.isel.gomoku.ui.common.utils.CustomErrorScreenView
import pt.isel.gomoku.ui.ranking.RankingActivity
import pt.isel.gomoku.ui.startGame.StartGameActivity

/**
 * The application's home activity.
 * Navigation to this activity is done through the [HomeActivity.navigateTo] method.
 */
class HomeActivity : ComponentActivity() {

    private val dependencies by lazy { application as APPDependencyProvider }
    private val viewModel by viewModels<HomeViewModel> {
        HomeViewModel.factory(dependencies.homeService, dependencies.userInfoRepository)
    }

    /**
     * Navigates to the home screen.
     */
    companion object {
        fun navigateTo(origin: Activity) {
            val intent = Intent(origin, HomeActivity::class.java)
            origin.startActivity(intent)
        }
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        lifecycleScope.launch {
            repeatOnLifecycle(Lifecycle.State.STARTED) {
                viewModel.homeState.collectLatest { home ->
                    if (home is HomeState.PlayGameReady) {
                        viewModel.userInfo.collectLatest { userInfo ->
                            if (userInfo is Loaded && userInfo.value.isSuccess) {
                                doPlayGameNavigation(
                                    userInfo = userInfo.getOrNull(),
                                    linkMe = home.linkMe,
                                    actionLogin = home.actionLogin,
                                    actionSignUp = home.actionSignUp,
                                )
                                viewModel.reset()
                            }
                        }
                    }
                    if (home is HomeState.RankingReady) {
                        RankingActivity.navigateTo(this@HomeActivity, home.link)
                        viewModel.reset()
                    }
                }
            }
        }

        setContent {
            val userInfo by viewModel.userInfo.collectAsState(initial = idle())
            val homeState by viewModel.homeState.collectAsState(initial = LoadState.idle())
            HomeScreen(
                onInfoRequested = { AboutActivity.navigateTo(this) },
                onPlayGameRequested = {
                    viewModel.fetchHome(NavigateTo.PlAYGAME)
                    viewModel.fetchUserInfo()
                },
                onRankingRequested = {
                    viewModel.fetchHome(NavigateTo.RANKING)
                },
                onPlayGameEnabled = userInfo is Idle && homeState is LoadState.Idle,
                onRankingEnabled = homeState is LoadState.Idle
            )

            userInfo.exceptionOrNull()?.let {
                CustomErrorScreenView(
                    title = stringResource(id = R.string.failed_to_read_preferences_error_dialog_title),
                    message = stringResource(id = R.string.failed_to_read_preferences_error_dialog_text),
                    firstButtonText = R.string.error_retry_button_text,
                    onFirstButtonClick = { viewModel.fetchUserInfo() },
                )
            }

            homeState.exceptionOrNull()?.let {
                CustomErrorScreenView(
                    title = stringResource(id = R.string.error_api_title),
                    message = stringResource(id = R.string.error_could_not_reach_api),
                    firstButtonText = R.string.error_retry_button_text,
                    onFirstButtonClick = { viewModel.reset() },
                )
            }
        }
    }

    /**
     * Navigates to the appropriate activity, depending on whether the user information has already
     * been provided and is valid or not.
     * @param userInfo the user information.
     * @param linkMe the link to obtain the "me" resource to pass to another activity or null.
     * @param actionLogin the action to "login" to pass to another activity or null.
     * @param actionSignUp the action to "signup" to pass to another activity or null.
     */
    private fun doPlayGameNavigation(
        userInfo: UserInfo?,
        linkMe: Link?,
        actionLogin: Action?,
        actionSignUp: Action?
    ) {
        if (userInfo != null && isTokenValid(userInfo.tokenExpiration)) {
            StartGameActivity.navigateTo(this, linkMe)
        } else {
            AuthActivity.navigateTo(this, linkMe, actionLogin, actionSignUp)
        }
    }

    /**
     * Checks if the token is valid, i.e., if it has not yet expired.
     */
    private fun isTokenValid(tokenExpiration: Instant): Boolean =
        tokenExpiration >= Clock.System.now()
}
