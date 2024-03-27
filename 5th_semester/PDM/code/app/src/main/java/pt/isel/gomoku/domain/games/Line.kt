package pt.isel.gomoku.domain.games

/**
 * Represents the types of lines that can be made to win.
 * [ROW] - Win with pieces in a row.
 * [COLUMN] - Win with pieces in a column.
 * [BACKSLASH] - Win with pieces in a backslash.
 * [SLASH] - Win with pieces in a slash.
 */
enum class Line {
    ROW, COLUMN, BACKSLASH, SLASH
}
