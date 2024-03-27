package pt.isel.gomoku.domain.games

/**
 * Represents a position in [Board].
 * @param row the row on the [Board].
 * @param column the column on the [Board].
 */
class Intersection(val row: Int, val column: Int) {

    init {
        require(row >= 0 && column >= 0)
    }

    val backslash: Int
        get() = -column + row

    val slash: Int
        get() = column + row

    override fun equals(other: Any?): Boolean {
        if (other !is Intersection) return false
        return this.row == other.row && this.column == other.column
    }

    override fun hashCode(): Int {
        var result = row
        result = 31 * result + column
        return result
    }
}
