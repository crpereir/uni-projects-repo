package pt.isel.gomoku.domain.states

/**
 * Sum type that represents the state of a load operation.
 */
sealed class LoadState<out T> {
    /**
     * The initial state, i.e. the state while the initial operation is in progress.
     */
    object Initial : LoadState<Nothing>()

    /**
     * The idle state, i.e. the state before the load operation is started.
     */
    object Idle : LoadState<Nothing>()

    /**
     * The loading state, i.e. the state while the load operation is in progress.
     */
    object Loading : LoadState<Nothing>()

    /**
     * The loaded state, i.e. the state after the load operation has finished.
     * @param value the result of the load operation.
     */
    data class Loaded<T>(val value: Result<T>) : LoadState<T>()

    /**
     * Returns the result of the load operation, if one is available.
     */
    open fun getOrNull(): T? = when (this) {
        is Loaded -> value.getOrNull()
        else -> null
    }

    /**
     * Returns the result of the load operation, if one is available, or throws
     * the exception that caused the load operation to fail. If the load operation
     * is still in progress, an [IllegalStateException] is thrown.
     */
    open fun getOrThrow(): T = when (this) {
        is Loaded -> value.getOrThrow()
        else -> throw IllegalStateException("No value available")
    }

    /**
     * Returns the exception that caused the load operation to fail, if one is available.
     */
    open fun exceptionOrNull(): Throwable? = when (this) {
        is Loaded -> value.exceptionOrNull()
        else -> null
    }

    companion object {
        /**
         * Returns a new [LoadState] in the initial state.
         */
        fun initial(): Initial = Initial

        /**
         * Returns a new [LoadState] in the idle state.
         */
        fun idle(): Idle = Idle

        /**
         * Returns a new [LoadState] in the loading state.
         */
        fun loading(): Loading = Loading

        /**
         * Returns a new [LoadState] in the loaded state.
         */
        fun <T> loaded(value: Result<T>): Loaded<T> = Loaded(value)

        /**
         * Returns a new [LoadState] in the loaded state with a successful result.
         */
        fun <T> success(value: T): Loaded<T> = loaded(Result.success(value))

        /**
         * Returns a new [LoadState] in the loaded state with a failed result.
         */
        fun <T> failure(error: Throwable): Loaded<T> = loaded(Result.failure(error))
    }
}


