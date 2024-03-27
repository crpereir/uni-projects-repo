package pt.isel.gomoku.ui.common.utils

import androidx.annotation.StringRes
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.width
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.outlined.Warning
import androidx.compose.material3.AlertDialog
import androidx.compose.material3.Button
import androidx.compose.material3.ButtonDefaults
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.Icon
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.platform.testTag
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import pt.isel.gomoku.ui.common.theme.BACKGROUND
import pt.isel.gomoku.ui.common.theme.BROWN
import pt.isel.gomoku.ui.common.theme.DARK_BROWN
import pt.isel.gomoku.ui.common.theme.GomokuTheme
import pt.isel.gomoku.ui.common.theme.homeFamily
import pt.isel.gomoku.ui.common.theme.letter

const val TEST_TAG_ERROR = "TEST_TAG_ERROR"
const val TEST_TAG_ERROR_ALERT_FIRST_BUTTON = "TEST_TAG_ERROR_ALERT_FIRST_BUTTON"
const val TEST_TAG_ERROR_ALERT_SECOND_BUTTON = "TEST_TAG_ERROR_ALERT_SECOND_BUTTON"

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun CustomErrorScreenView(
    title: String,
    message: String,
    @StringRes firstButtonText: Int,
    @StringRes secondButtonText: Int? = null,
    onFirstButtonClick: () -> Unit = { },
    onSecondButtonClick: () -> Unit = { }
) {
    GomokuTheme {
        Scaffold(
            modifier = Modifier
                .testTag(TEST_TAG_ERROR)
                .fillMaxSize(),
            containerColor = BACKGROUND,
        ) { innerPadding ->
            Column(
                modifier = Modifier
                    .padding(innerPadding)
            ) {
                ErrorAlertImpl(
                    title = title,
                    message = message,
                    firstButtonText = stringResource(id = firstButtonText),
                    secondButtonText = secondButtonText?.let { stringResource(id = it) },
                    onFirstButtonClick = onFirstButtonClick,
                    onSecondButtonClick = onSecondButtonClick
                )
            }
        }
    }
}

@Composable
fun CustomErrorPopUp(
    title: String,
    message: String,
    @StringRes firstButtonText: Int,
    @StringRes secondButtonText: Int? = null,
    onFirstButtonClick: () -> Unit = { },
    onSecondButtonClick: () -> Unit = { }
) {
    ErrorAlertImpl(
        title = title,
        message = message,
        firstButtonText = stringResource(id = firstButtonText),
        secondButtonText = secondButtonText?.let { stringResource(id = it) },
        onFirstButtonClick = onFirstButtonClick,
        onSecondButtonClick = onSecondButtonClick
    )
}

@Composable
private fun ErrorAlertImpl(
    title: String,
    message: String,
    firstButtonText: String,
    secondButtonText: String? = null,
    onFirstButtonClick: () -> Unit = { },
    onSecondButtonClick: () -> Unit = { }
) {
    AlertDialog(
        onDismissRequest = { },
        confirmButton = {
            Column(
                modifier = Modifier
                    .fillMaxWidth(0.5f)
                    .padding(8.dp),
                horizontalAlignment = Alignment.CenterHorizontally,
            ) {
                Button(
                    onClick = onFirstButtonClick,
                    modifier = Modifier.testTag(TEST_TAG_ERROR_ALERT_FIRST_BUTTON),
                    colors = ButtonDefaults.buttonColors(BROWN)
                ) {
                    Text(text = firstButtonText, fontFamily = letter, fontSize = 20.sp)
                }

                if (secondButtonText != null) {
                    Spacer(modifier = Modifier.width(8.dp))

                    Button(
                        onClick = onSecondButtonClick,
                        modifier = Modifier.testTag(TEST_TAG_ERROR_ALERT_SECOND_BUTTON),
                        colors = ButtonDefaults.buttonColors(BROWN)
                    ) {
                        Text(text = secondButtonText, fontFamily = letter, fontSize = 20.sp)
                    }
                }
            }
        },
        title = {
            Text(
                text = title,
                fontFamily = homeFamily,
                fontSize = 15.sp,
                color = Color.White
            )
        },
        text = {
            Box(
                modifier = Modifier.fillMaxWidth(),
                contentAlignment = Alignment.Center
            ) {
                Text(
                    text = message,
                    textAlign = TextAlign.Center,
                    fontFamily = letter,
                    color = Color.White,
                    fontSize = 25.sp
                )
            }
        },
        icon = {
            Icon(
                imageVector = Icons.Outlined.Warning,
                contentDescription = "Warning",
                tint = Color.White
            )
        },
        containerColor = DARK_BROWN
    )
}

@Preview(showBackground = true)
@Composable
private fun ErrorAlertImplOneButtonPreview() {
    GomokuTheme {
        ErrorAlertImpl(
            title = "Error accessing the server",
            message = "Try again later, please",
            firstButtonText = "Retry",
            onFirstButtonClick = { },
        )
    }
}

@Preview(showBackground = true)
@Composable
private fun ErrorAlertImplTwoButtonsPreview() {
    GomokuTheme {
        ErrorAlertImpl(
            title = "Error accessing the server",
            message = "Try again later, please",
            firstButtonText = "Retry",
            secondButtonText = "Back",
            onFirstButtonClick = { },
            onSecondButtonClick = { }
        )
    }
}