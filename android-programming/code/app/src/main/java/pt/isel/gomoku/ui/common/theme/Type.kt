package pt.isel.gomoku.ui.common.theme

import androidx.compose.material3.Typography
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.text.font.Font
import androidx.compose.ui.text.font.FontFamily
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.sp
import pt.isel.gomoku.R

// Set of Material typography styles to start with
val Typography = Typography(
    bodyLarge = TextStyle(
        fontFamily = FontFamily.Default,
        fontWeight = FontWeight.Normal,
        fontSize = 24.sp,
        lineHeight = 24.sp,
        letterSpacing = 0.5.sp
    )
    /* Other default text styles to override
    titleLarge = TextStyle(
        fontFamily = FontFamily.Default,
        fontWeight = FontWeight.Normal,
        fontSize = 22.sp,
        lineHeight = 28.sp,
        letterSpacing = 0.sp
    ),
    labelSmall = TextStyle(
        fontFamily = FontFamily.Default,
        fontWeight = FontWeight.Medium,
        fontSize = 11.sp,
        lineHeight = 16.sp,
        letterSpacing = 0.5.sp
    )
    */
)

val kumbhSansFamily = FontFamily(
    Font(R.font.kumbh_sans_light, FontWeight.Light),
    Font(R.font.kumbh_sans, FontWeight.Normal)
)

val blockheadFamily = FontFamily(
    Font(R.font.blockhead, FontWeight.Light),
    Font(R.font.blockhead, FontWeight.Normal)
)

val blockheadBlackFamily = FontFamily(
    Font(R.font.blockhead_black, FontWeight.Light),
    Font(R.font.blockhead_black, FontWeight.Normal)
)

val blockheadBoldFamiy = FontFamily(
    Font(R.font.blockhead_bold, FontWeight.Light),
    Font(R.font.blockhead_bold, FontWeight.Normal)
)

val homeFamily = FontFamily(
    Font(R.font.homeletter, FontWeight.Light),
    Font(R.font.homeletter, FontWeight.Normal)
)

val letter = FontFamily(
    Font(R.font.letter, FontWeight.Light),
    Font(R.font.letter, FontWeight.Normal)
)