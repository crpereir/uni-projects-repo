package pt.isel.gomoku.http.dto

/**
 * The DTO used to represent errors obtained from the remote service.
 */
data class ProblemDto(
    val type: String,
    val title: String?,
    val detail: String?,
    val instance: String?,
)
