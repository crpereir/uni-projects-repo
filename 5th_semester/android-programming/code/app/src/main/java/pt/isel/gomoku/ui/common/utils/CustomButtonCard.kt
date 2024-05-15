package pt.isel.gomoku.ui.common.utils

import androidx.compose.foundation.Image
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.Card
import androidx.compose.material3.CardDefaults
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.platform.testTag
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import pt.isel.gomoku.R
import pt.isel.gomoku.ui.common.theme.letter

@Composable
fun CustomButtonCard(
    testTag: String,
    stringResourceId: Int,
    imageFraction: Float,
    onClick: () -> Unit,
    enabled: Boolean = true
) {
    Card(
        modifier = Modifier
            .testTag(testTag)
            .padding(16.dp)
            .clickable(onClick = onClick, enabled = enabled),
        colors = CardDefaults.cardColors(Color.Transparent),
    ) {
        Box {
            Image(
                painter = painterResource(id = R.drawable.button),
                contentDescription = null,
                modifier = Modifier.fillMaxWidth(imageFraction)
            )
            Text(
                text = stringResource(id = stringResourceId),
                fontFamily = letter,
                fontSize = 26.sp,
                modifier = Modifier
                    .height(40.dp)
                    .align(Alignment.Center),
                color = Color.Black
            )
        }
    }
}

@Preview
@Composable
fun CardPreview() {
    CustomButtonCard(
        testTag = TEST_TAG_ERROR_ALERT_FIRST_BUTTON,
        stringResourceId = R.string.app_name,
        imageFraction = 1f,
        onClick = {  }
    )
}
