package pt.isel.gomoku.domain.services.local

import pt.isel.gomoku.domain.games.Game
import pt.isel.gomoku.domain.games.Monitor
import pt.isel.gomoku.domain.infra.Action
import pt.isel.gomoku.domain.infra.Entity
import pt.isel.gomoku.domain.infra.Link
import pt.isel.gomoku.domain.infra.Siren
import java.util.UUID
import kotlin.random.Random
import kotlin.time.Duration.Companion.seconds

/**
 * Creates a new [Siren].
 */
fun <T> siren(
    props: T? = null,
    clazz: List<String> = emptyList(),
    links: List<Link> = emptyList(),
    entities: List<Entity<*>> = emptyList(),
    actions: List<Action> = emptyList()
): Siren<T> = Siren(clazz, props, links, entities, actions)

/**
 * Creates a new [Siren] with no [Class], [Link]s, [Entity]s or [Action]s.
 */
fun <T> emptySiren(props: T? = null) =
    siren(props)

/**
 * Creates a new siren with either a monitor or a new game, depending on [wantMonitor].
 * If true, Siren with Monitor will be created. If false, Siren with null will be created.
 * If not indicated or null, it will be randomized.
 */
fun genNewGameOrMonitor(gameId: UUID, wantMonitor: Boolean? = null): Siren<Monitor?> {
    val isMonitor = wantMonitor ?: Random.nextBoolean()
    val siren: Siren<Monitor?> = if (isMonitor) {
        genMonitorSiren(gameId)
    } else {
        genNoMonitorSiren(gameId)
    }
    return siren
}

/**
 * Creates a new siren with [Monitor], including respective [Link] and [Action].
 */
fun genMonitorSiren(uuid: UUID): Siren<Monitor?> = siren(
    props = genMonitor(),
    links = genMonitorLink(uuid),
    actions = genDeleteMonitorAction(uuid)
)

/**
 * Creates a [Monitor].
 */
private fun genMonitor() = Monitor(Monitor.Status.WAITING_FOR_OTHER_PLAYER, 5.seconds.toString())

/**
 * Creates a new siren with game, including respective [Link] and [Action]s.
 */
fun genNoMonitorSiren(uuid: UUID): Siren<Monitor?> = siren(
    props = null,
    links = genGameLink(uuid),
    actions = genGameActions(uuid)
)

/**
 * Creates a new start game action.
 */
fun genStartGameAction() = listOf(
    Action(
        name = "start-game",
        title = "Start game",
        href = Uris.create(Uris.Games.START),
        method = "POST",
        authenticationType = listOf("BEARER"),
        fields = emptyList(),
        type = null
    )
)

/**
 * Creates a new monitor link to check status.
 */
fun genMonitorLink(uuid: UUID) = listOf(
    Link(
        href = Uris.create(Uris.Games.STATUS_MONITOR, "id" to uuid.toString()),
        rel = listOf("self"),
        authenticationType = listOf("BEARER")
    )
)

/**
 * Creates a new delete monitor action.
 */
fun genDeleteMonitorAction(uuid: UUID) = listOf(
    Action(
        name = "cancel",
        title = "cancel",
        href = Uris.create(Uris.Games.DELETE_MONITOR, "id" to uuid.toString()),
        method = "DELETE",
        authenticationType = listOf("BEARER"),
        fields = emptyList(),
        type = null
    )
)

/**
 * Creates a link to check game.
 */
fun genGameLink(uuid: UUID) = listOf(
    Link(
        href = Uris.create(Uris.Games.GET_BY_ID, "id" to uuid.toString()),
        rel = listOf("self"),
        authenticationType = listOf("BEARER")
    )
)

/**
 * Creates actions to play and give up.
 */
fun genGameActions(uuid: UUID) = listOf(
    Action(
        name = "play",
        title = "play",
        href = Uris.create(Uris.Games.PLAY, "id" to uuid.toString()),
        method = "PUT",
        authenticationType = listOf("BEARER"),
        fields = emptyList(),
        type = null
    ),
    Action(
        name = "give-up",
        title = "give up",
        href = Uris.create(Uris.Games.GIVE_UP, "id" to uuid.toString()),
        method = "PUT",
        authenticationType = listOf("BEARER"),
        fields = emptyList(),
        type = null
    )
)

/**
 * Creates a siren with new state of game.
 */
fun genGameSiren(game: Game, gameId: UUID) = siren(
    props = game,
    links = genGameLink(gameId),
    actions = genGameActions(gameId)
)