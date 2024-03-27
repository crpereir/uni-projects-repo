package pt.isel.gomoku.ui.startGame

import android.app.Activity
import android.content.Intent
import android.os.Bundle
import android.os.Parcelable
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
import kotlinx.parcelize.Parcelize
import pt.isel.gomoku.APPDependencyProvider
import pt.isel.gomoku.R
import pt.isel.gomoku.domain.infra.Action
import pt.isel.gomoku.domain.infra.Field
import pt.isel.gomoku.domain.infra.Link
import pt.isel.gomoku.domain.services.GomokuError
import pt.isel.gomoku.domain.states.LoadState
import pt.isel.gomoku.domain.states.LoadState.Companion.initial
import pt.isel.gomoku.domain.states.StartGameState
import pt.isel.gomoku.domain.states.getOrNull
import pt.isel.gomoku.domain.states.idle
import pt.isel.gomoku.ui.game.GameActivity
import pt.isel.gomoku.ui.common.utils.CustomErrorScreenView

/**
 * The application's start game activity.
 * Navigation to this activity is done through the [StartGameActivity.navigateTo] method.
 */
class StartGameActivity : ComponentActivity() {

    private val dependencies by lazy { application as APPDependencyProvider }
    private val viewModel by viewModels<StartGameViewModel> {
        StartGameViewModel.factory(
            dependencies.usersService,
            dependencies.gamesService,
            dependencies.userInfoRepository,
            linkMe = getLinkExtra()?.toLink()
        )
    }

    /**
     * Navigates to the start game screen.
     */
    companion object {
        fun navigateTo(
            origin: Activity,
            linkMe: Link?
        ) {
            with(origin) {
                val intent = Intent(this, StartGameActivity::class.java)
                linkMe?.let { intent.putExtra(LINK_EXTRA, LinkExtra(it)) }
                startActivity(intent)
            }
        }
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        lifecycleScope.launch {
            repeatOnLifecycle(Lifecycle.State.STARTED) {
                viewModel.loadState.collect {
                    if (it is LoadState.Initial) {
                        viewModel.fetchUserInfoAndVariants()
                    }

                    if (it is StartGameState.Ready) {
                        viewModel.reset()
                        viewModel.monitor.collectLatest { monitor ->
                            GameActivity.navigateTo(
                                this@StartGameActivity,
                                requireNotNull(monitor) { "Tried to start game with no monitor" },
                                requireNotNull(viewModel.variant) { "Tried to start game with no variant" }
                            )
                        }
                    }

                    if (it is StartGameState.LoggedOut) {
                        finish()
                    }
                }
            }
        }

        setContent {
            val loadState by viewModel.loadState.collectAsState(initial = initial())
            val userInfo by viewModel.userInfo.collectAsState(initial = idle())
            when (loadState) {
                is LoadState.Initial, LoadState.Loading, StartGameState.Ready, StartGameState.LoggedOut ->
                    StartGameScreenLoadingView()

                is LoadState.Loaded -> {
                    loadState.getOrNull()?.let {
                        StartGameScreenLoadedView(
                            username = requireNotNull(userInfo.getOrNull()?.username),
                            variantChosen = viewModel.variant,
                            onBackRequested = { finish() },
                            onLogOutRequested = { viewModel.logout() },
                            onStartGameRequested = { viewModel.startGame() },
                            onNextVariant = { viewModel.changeVariant() }
                        )
                    }

                    loadState.exceptionOrNull()?.let { exception ->
                        CustomErrorScreenView(
                            title = if (exception is GomokuError)
                                exception.title
                            else
                                stringResource(id = R.string.error_api_title),
                            message = if (exception is GomokuError)
                                exception.message
                            else
                                stringResource(id = R.string.error_could_not_reach_api),
                            firstButtonText = R.string.error_back_button_text,
                            secondButtonText = R.string.error_reload_button_text,
                            onFirstButtonClick = { finish() },
                            onSecondButtonClick = { viewModel.fetchUserInfoAndVariants() }
                        )
                    }
                }

                else -> throw IllegalStateException("Invalid state in activity -> $loadState")
            }
        }
    }

    @Suppress("DEPRECATION")
    private fun getLinkExtra(): LinkExtra? =
        if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.TIRAMISU)
            intent.getParcelableExtra(LINK_EXTRA, LinkExtra::class.java)
        else
            intent.getParcelableExtra(LINK_EXTRA)
}

const val LINK_EXTRA = "StartGame.extra.Link"

@Parcelize
data class LinkExtra(
    val rel: List<String>,
    val href: String,
    val authenticationType: List<String>
) : Parcelable {

    constructor(link: Link) : this(
        link.rel,
        link.href,
        link.authenticationType,
    )
}

private fun LinkExtra.toLink(): Link =
    Link(rel, href, authenticationType)
