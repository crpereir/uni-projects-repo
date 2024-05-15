package pt.isel.gomoku.domain.services.local

import java.net.URI

/**
 * Represents all URIs of API.
 */
object Uris {

    const val PREFIX = "http://localhost:8080/api"

    object Home {
        const val HOME = "$PREFIX/"

        fun home() = URI(HOME)
    }

    object Users {
        const val CREATE = "$PREFIX/users"
        const val TOKEN = "$PREFIX/users/token"
        const val RANKING = "$PREFIX/users/ranking"
        const val GET_BY_ID = "$PREFIX/users/{id}"
        const val STATISTICS = "$PREFIX/users/{id}/statistics"
        const val LOGOUT = "$PREFIX/logout"
        const val USER_HOME = "$PREFIX/me"
    }

    object System {
        const val ABOUT = "$PREFIX/system"

        fun about() = URI(ABOUT)
    }

    object Games {
        const val VARIANTS = "$PREFIX/games/variants"
        const val START = "$PREFIX/games"
        const val STATUS_MONITOR = "$PREFIX/games/{id}/monitor"
        const val DELETE_MONITOR = "$PREFIX/games/{id}/monitor"
        const val GET_BY_ID = "$PREFIX/games/{id}"
        const val PLAY = "$PREFIX/games/{id}/play/row/{row}/column/{column}"
        const val GIVE_UP = "$PREFIX/games/{id}/giveup"

    }

    fun create(template: String, vararg varAndValue: Pair<String, String>): String {
        var url = template
        varAndValue.forEach { variable ->
            url = url.replace("{${variable.first}}", variable.second)
        }
        return url
    }
}