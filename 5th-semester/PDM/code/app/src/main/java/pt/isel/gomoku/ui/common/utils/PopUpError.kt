package pt.isel.gomoku.ui.common.utils

import androidx.compose.runtime.Composable
import androidx.compose.ui.res.stringResource
import pt.isel.gomoku.R
import pt.isel.gomoku.domain.services.GomokuError

@Composable
fun PopUpError(error: Throwable?, onDismissRequested: () -> Unit) {
    CustomErrorPopUp(
        title = if (error is GomokuError)
            error.title
        else
            stringResource(id = R.string.error_api_title),
        message = if (error is GomokuError)
            error.message
        else
            stringResource(id = R.string.error_could_not_reach_api),
        firstButtonText = R.string.error_ok_button_text,
        onFirstButtonClick = onDismissRequested
    )
}