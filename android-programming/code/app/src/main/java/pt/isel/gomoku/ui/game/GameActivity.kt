package pt.isel.gomoku.ui.game

import android.app.Activity
import android.content.Intent
import android.os.Bundle
import android.os.Parcel
import android.os.Parcelable
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.viewModels
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import androidx.lifecycle.lifecycleScope
import com.google.gson.Gson
import com.google.gson.reflect.TypeToken
import kotlinx.coroutines.launch
import kotlinx.parcelize.Parceler
import kotlinx.parcelize.Parcelize
import pt.isel.gomoku.APPDependencyProvider
import pt.isel.gomoku.domain.games.Monitor
import pt.isel.gomoku.domain.infra.Action
import pt.isel.gomoku.domain.infra.Entity
import pt.isel.gomoku.domain.infra.Link
import pt.isel.gomoku.domain.infra.Siren
import pt.isel.gomoku.domain.states.GameState.GaveUp
import pt.isel.gomoku.domain.states.GameState.Playing
import pt.isel.gomoku.domain.states.GameState.Waiting
import pt.isel.gomoku.domain.states.LoadState.Companion.initial
import pt.isel.gomoku.domain.states.LoadState.Initial
import pt.isel.gomoku.domain.states.LoadState.Loading
import pt.isel.gomoku.domain.variants.OpeningRules
import pt.isel.gomoku.domain.variants.PlayingRules
import pt.isel.gomoku.domain.variants.Variant
import pt.isel.gomoku.ui.common.utils.PopUpError

/**
 * Activity that represents the game screen.
 */
class GameActivity : ComponentActivity() {

    private val dependencies by lazy { application as APPDependencyProvider }
    private val viewModel by viewModels<GameViewModel> {
        GameViewModel.factory(
            dependencies.gamesService,
            dependencies.userInfoRepository,
            getSirenExtra()?.toSiren()
                ?: throw IllegalStateException("Unexpected error getting monitor."),
            getVariantExtra()?.toVariant()
                ?: throw IllegalStateException("Unexpected error getting variant."),
        )
    }

    /**
     * Navigates to the game screen.
     */
    companion object {
        fun navigateTo(origin: Activity, siren: Siren<Monitor?>, variant: Variant) {
            with(origin) {
                val intent = Intent(this, GameActivity::class.java)
                intent.putExtra(SIREN_EXTRA, SirenExtra(siren))
                intent.putExtra(VARIANT_EXTRA, VariantExtra(variant))
                startActivity(intent)
            }
        }
    }

    /**
     * Creates the activity.
     */
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        /**
         * Observes the load state of the game.
         */
        lifecycleScope.launch {
            viewModel.loadState.collect {
                if (it is Initial)
                    viewModel.setup()
                else if (it is GaveUp)
                    finish()
            }
        }

        setContent {
            val loadState by viewModel.loadState.collectAsState(initial = initial())
            when (loadState) {
                is Initial, is Loading, is GaveUp -> {
                    GameScreenLoading()
                }

                is Waiting ->
                    if (!viewModel.isGamePresent()) {
                        WaitingForPlayerScreen(
                            onStopWaitingRequested = { viewModel.stopWaitingForPlayer() }
                        )
                    } else {
                        GameScreen(
                            boardDim = viewModel.getBoardDim(),
                            onBackRequested = { finish() },
                            game = viewModel.currentGame(),
                            myTurn = false,
                            didIWin = viewModel.didIWin(),
                            onPlayRequested = { _, _ -> },
                            onGiveUpRequested = { viewModel.giveUp() }
                        )
                    }

                is Playing -> GameScreen(
                    game = viewModel.currentGame(),
                    myTurn = true,
                    didIWin = viewModel.didIWin(),
                    boardDim = viewModel.getBoardDim(),
                    onBackRequested = { finish() },
                    onPlayRequested = { row, column -> viewModel.play(row, column) },
                    onGiveUpRequested = { viewModel.giveUp() }
                )

                else ->
                    throw IllegalStateException("Invalid state in activity -> $loadState")
            }

            viewModel.playError?.let { error ->
                PopUpError(
                    error = error,
                    onDismissRequested = { viewModel.clearError() }
                )
            }

            loadState.exceptionOrNull()?.let { exception ->
                PopUpError(
                    error = exception,
                    onDismissRequested = { finish() }
                )
            }
        }
    }

    @Suppress("DEPRECATION")
    private fun getSirenExtra(): SirenExtra? =
        if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.TIRAMISU)
            intent.getParcelableExtra(SIREN_EXTRA, SirenExtra::class.java)
        else
            intent.getParcelableExtra(SIREN_EXTRA)

    @Suppress("DEPRECATION")
    private fun getVariantExtra(): VariantExtra? =
        if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.TIRAMISU)
            intent.getParcelableExtra(VARIANT_EXTRA, VariantExtra::class.java)
        else
            intent.getParcelableExtra(VARIANT_EXTRA)
}

const val SIREN_EXTRA = "GameActivity.extra.Siren"
const val VARIANT_EXTRA = "GameActivity.extra.Variant"

@Parcelize
data class VariantExtra(
    val variantId: Int,
    val boardDim: Int,
    val openingRules: OpeningRules,
    val playingRules: PlayingRules
) : Parcelable {

    constructor(variant: Variant) : this(
        variant.variantId,
        variant.boardDim,
        variant.openingRules,
        variant.playingRules,
    )
}


private fun VariantExtra.toVariant(): Variant =
    Variant(variantId, boardDim, openingRules, playingRules)

@Parcelize
data class SirenExtra(
    val clazz: List<String>,
    val properties: Monitor?,
    val links: List<Link>,
    val entities: List<Entity<*>>,
    val actions: List<Action>

) : Parcelable {

    constructor(siren: Siren<Monitor?>) : this(
        siren.clazz,
        siren.properties,
        siren.links,
        siren.entities,
        siren.actions
    )

    companion object : Parceler<SirenExtra> {
        override fun SirenExtra.write(parcel: Parcel, flags: Int) {
            parcel.writeString(Gson().toJson(clazz))
            parcel.writeString(Gson().toJson(properties))
            parcel.writeString(Gson().toJson(links))
            parcel.writeString(Gson().toJson(entities))
            parcel.writeString(Gson().toJson(actions))
        }

        override fun create(parcel: Parcel): SirenExtra {
            val typeClazz = object : TypeToken<List<String>>() {}.type
            val clazz = Gson().fromJson<List<String>>(parcel.readString(), typeClazz)

            val typeProperties = object : TypeToken<Monitor?>() {}.type
            val properties = Gson().fromJson<Monitor?>(parcel.readString(), typeProperties)

            val typeLinks = object : TypeToken<List<Link>>() {}.type
            val links = Gson().fromJson<List<Link>>(parcel.readString(), typeLinks)

            val typeEntities = object : TypeToken<List<Entity<*>>>() {}.type
            val entities = Gson().fromJson<List<Entity<*>>>(parcel.readString(), typeEntities)

            val typeActions = object : TypeToken<List<Action>>() {}.type
            val actions = Gson().fromJson<List<Action>>(parcel.readString(), typeActions)

            return SirenExtra(clazz, properties, links, entities, actions)
        }
    }
}

private fun SirenExtra.toSiren(): Siren<Monitor?> =
    Siren(clazz, properties, links, entities, actions)
