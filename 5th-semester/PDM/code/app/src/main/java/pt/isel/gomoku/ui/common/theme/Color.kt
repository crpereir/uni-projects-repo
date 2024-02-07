package pt.isel.gomoku.ui.common.theme

import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color

val Purple80 = Color(0xFFD0BCFF)
val PurpleGrey80 = Color(0xFFCCC2DC)
val Pink80 = Color(0xFFEFB8C8)

val Purple40 = Color(0xFF6650a4)
val PurpleGrey40 = Color(0xFF625b71)
val Pink40 = Color(0xFF7D5260)

val NOT_WIN_GRADIENT_BRUSH = Brush.linearGradient(
    listOf(
        Color(107, 0, 0),
        Color(157, 0, 0)
    )
)

val WINNING_GRADIENT_BRUSH = Brush.linearGradient(
    listOf(
        Color(0, 107, 0),
        Color(0, 157, 0)
    )
)

val LIGHT_BROWN = Color(231, 207, 174, 255)
val DARK_BROWN = Color(83, 65, 59, 255)
val BROWN = Color(173, 153, 137, 255)
val BACKGROUND = Color(241, 225, 205, 255)