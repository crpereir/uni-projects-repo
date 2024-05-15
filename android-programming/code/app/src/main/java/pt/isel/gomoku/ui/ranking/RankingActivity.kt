package pt.isel.gomoku.ui.ranking

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
import androidx.lifecycle.lifecycleScope
import kotlinx.coroutines.launch
import kotlinx.parcelize.Parcelize
import pt.isel.gomoku.APPDependencyProvider
import pt.isel.gomoku.R
import pt.isel.gomoku.domain.infra.Link
import pt.isel.gomoku.domain.services.GomokuError
import pt.isel.gomoku.domain.states.LoadState.Companion.initial
import pt.isel.gomoku.domain.states.LoadState.Initial
import pt.isel.gomoku.domain.states.LoadState.Loaded
import pt.isel.gomoku.domain.states.LoadState.Loading
import pt.isel.gomoku.domain.utils.PageNavigation.FIRST
import pt.isel.gomoku.domain.utils.PageNavigation.LAST
import pt.isel.gomoku.domain.utils.PageNavigation.NEXT
import pt.isel.gomoku.domain.utils.PageNavigation.PREVIOUS
import pt.isel.gomoku.ui.common.utils.CustomErrorScreenView

/**
 * The application's ranking activity, used to display information about the users current ranking.
 * Navigation to this activity is done through the [RankingActivity.navigateTo] method.
 */
class RankingActivity : ComponentActivity() {

    private val dependencies by lazy { application as APPDependencyProvider }
    private val viewModel by viewModels<RankingViewModel> {
        RankingViewModel.factory(
            service = dependencies.usersService,
            linkRanking = getLinkExtra()?.toLink()
        )
    }

    /**
     * Navigates to the ranking screen.
     */
    companion object {
        fun navigateTo(origin: Activity, link: Link?) {
            with(origin) {
                val intent = Intent(this, RankingActivity::class.java)
                link?.let { intent.putExtra(LINK_EXTRA, LinkExtra(it)) }
                startActivity(intent)
            }
        }
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        lifecycleScope.launch {
            viewModel.loadState.collect {
                if (it is Initial) {
                    viewModel.fetchRanking()
                }
            }
        }

        setContent {
            val loadState by viewModel.loadState.collectAsState(initial = initial())
            when (loadState) {
                is Initial, Loading ->
                    RankingScreenLoadingView()

                is Loaded -> {
                    loadState.getOrNull()?.let { ranking ->
                        RankingScreenLoadedView(
                            ranking = requireNotNull(ranking.properties?.ranking),
                            userSelected = viewModel.userSelected,
                            page = viewModel.getPage(),
                            onBackRequested = { finish() },
                            onRefreshRequested = { viewModel.fetchRanking() },
                            onFirstPageRequested = { viewModel.fetchRanking(FIRST) },
                            onLastPageRequested = { viewModel.fetchRanking(LAST) },
                            onPreviousPageRequested = { viewModel.fetchRanking(PREVIOUS) },
                            onNextPageRequested = { viewModel.fetchRanking(NEXT) },
                            onUserSelected = { userId -> viewModel.onUserSelected(userId) }
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
                            secondButtonText = R.string.error_retry_button_text,
                            onFirstButtonClick = { finish() },
                            onSecondButtonClick = { viewModel.fetchRanking() }
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

const val LINK_EXTRA = "RankingActivity.extra.Link"

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