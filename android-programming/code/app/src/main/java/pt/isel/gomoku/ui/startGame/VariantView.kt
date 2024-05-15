package pt.isel.gomoku.ui.startGame

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.ArrowForward
import androidx.compose.material3.Icon
import androidx.compose.material3.IconButton
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.platform.testTag
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import pt.isel.gomoku.R
import pt.isel.gomoku.domain.variants.OpeningRules
import pt.isel.gomoku.domain.variants.PlayingRules
import pt.isel.gomoku.domain.variants.Variant
import pt.isel.gomoku.ui.common.theme.BROWN
import pt.isel.gomoku.ui.common.theme.letter

/**
 * Displays one variant.
 * @param variant the [Variant] to be displayed.
 * @param onNextVariant the callback to be invoked when the user requests the next variant.
 */
@Composable
fun VariantView(variant: Variant?, onNextVariant: () -> Unit) {
    Column {
        variant?.let {
            Column(
                modifier = Modifier
                    .padding(8.dp)
                    .background(
                        color = BROWN,
                        shape = RoundedCornerShape(4.dp)
                    )
                    .padding(8.dp)
            ) {
                Text(
                    text = variant.playingRules.toString(),
                    fontFamily = letter,
                    modifier = Modifier.padding(8.dp)
                )
                Spacer(modifier = Modifier.height(5.dp))
                Text(
                    text = "${stringResource(id = R.string.board_size)} ${variant.boardDim}",
                    fontFamily = letter,
                    modifier = Modifier.padding(8.dp)
                )
                Spacer(modifier = Modifier.height(1.dp))
                Text(
                    text = "${stringResource(id = R.string.opening_rules)} ${variant.openingRules}",
                    fontFamily = letter,
                    modifier = Modifier.padding(8.dp)
                )

                IconButton(
                    onClick = onNextVariant,
                    modifier = Modifier
                        .align(Alignment.CenterHorizontally)
                        .padding(8.dp)
                        .testTag(TEST_TAG_START_NEXT_VARIANT_BUTTON)
                ) {
                    Icon(Icons.Default.ArrowForward, contentDescription = null)
                }
            }
        }
    }
}

@Preview
@Composable
fun VariantViewPreview() {
    VariantView(
        variant = Variant(1, 15, OpeningRules.NONE, PlayingRules.FREESTYLE),
        onNextVariant = { }
    )
}