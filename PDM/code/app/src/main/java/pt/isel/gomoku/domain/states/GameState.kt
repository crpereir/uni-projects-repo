package pt.isel.gomoku.domain.states

/**
 * Sum type that represents the state of a load operation plus states specific to the
 * [pt.isel.gomoku.ui.game.GameActivity].
 */
sealed class GameState<out T> : LoadState<T>() {

    /**
     * The state where user is waiting to play.
     */
    data class Waiting<T>(val value: Result<T>) : GameState<T>() {
        fun hasNothing() = value.getOrNull() == null
    }

    /**
     * The state where the user is allowed to play.
     */
    data class Playing<T>(val value: Result<T>) : GameState<T>()

    object GaveUp: GameState<Nothing>()

    /**
     * Returns the result of the load operation, if one is available.
     */
    override fun getOrNull(): T? = when (this) {
        is Playing -> value.getOrNull()
        is Waiting -> value.getOrNull()
        else -> null
    }

    /**
     * Returns the result of the load operation, if one is available, or throws
     * the exception that caused the load operation to fail. If the load operation
     * is still in progress, an [IllegalStateException] is thrown.
     */
    override fun getOrThrow(): T = when (this) {
        is Playing -> value.getOrThrow()
        is Waiting -> value.getOrThrow()
        else -> throw IllegalStateException("No value available")
    }

    /**
     * Returns the exception that caused the load operation to fail, if one is available.
     */
    override fun exceptionOrNull(): Throwable? = when (this) {
        is Playing -> value.exceptionOrNull()
        is Waiting -> value.exceptionOrNull()
        else -> null
    }

    companion object {

        /**
         * Returns a waiting state with the current value.
         */
        fun <T> waiting(value: Result<T>): Waiting<T> = Waiting(value)

        /**
         * Returns a waiting state with no value.
         * Used for when there is no game yet.
         */
        fun <T> waitingForNew(): Waiting<T?> = waiting(Result.success(null))

        /**
         * Returns a playing state with the current value.
         */
        fun <T> playing(value: Result<T>): Playing<T> = Playing(value)

        fun gaveUp(): GaveUp = GaveUp

    }
}