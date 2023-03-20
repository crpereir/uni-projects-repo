
/**
 * @receiver The original man
 * @param direction
 */
fun Man.process(direction: Direction): Man {
    return Man(this.pos.delta(direction),direction)
}


/**
 * @receiver Actual position
 * @param direction
 */
fun Position.delta(direction: Direction) =
    Position(col + direction.colDif,line + direction.lineDif)


