package pt.isel.gomoku.ui.about

import androidx.compose.foundation.BorderStroke
import androidx.compose.foundation.Image
import androidx.compose.foundation.border
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.Card
import androidx.compose.material3.CardDefaults
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.platform.testTag
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import pt.isel.gomoku.R
import pt.isel.gomoku.domain.about.Author
import pt.isel.gomoku.ui.common.topbars.NavigationHandlers
import pt.isel.gomoku.ui.common.theme.BACKGROUND
import pt.isel.gomoku.ui.common.theme.DARK_BROWN
import pt.isel.gomoku.ui.common.theme.GomokuTheme
import pt.isel.gomoku.ui.common.theme.letter
import pt.isel.gomoku.ui.common.topbars.AboutTopBar
import pt.isel.gomoku.ui.common.utils.CustomButtonCard

/**
 * Tags used to identify the components of the AboutScreen in automated tests.
 */
const val TEST_TAG_ABOUT_SCREEN = "TEST_TAG_ABOUT_SCREEN"
const val TEST_TAG_SEND_EMAIL_BUTTON = "TEST_TAG_SEND_EMAIL_BUTTON"

/**
 * Root composable for the about screen, the one that displays information about the authors of app.
 * @param authors the list of authors to be displayed.
 * @param onBackRequested the callback to be invoked when the user requests to go back to the
 * previous screen.
 * @param onSendEmailRequested the callback to be invoked when the user requests to send an email.
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun AboutScreen(
    authors: List<Author>,
    onBackRequested: () -> Unit,
    onSendEmailRequested: () -> Unit
) {
    GomokuTheme {
        Scaffold(
            modifier = Modifier
                .fillMaxSize()
                .testTag(TEST_TAG_ABOUT_SCREEN),
            topBar = {
                AboutTopBar(NavigationHandlers(onBackRequested = onBackRequested))
            },
            containerColor = BACKGROUND
        ) { innerPadding ->
            LazyColumn(
                verticalArrangement = Arrangement.Center,
                horizontalAlignment = Alignment.CenterHorizontally,
                modifier = Modifier
                    .padding(innerPadding)
                    .fillMaxSize()
            ) {
                items(authors) { author ->
                    Card(
                        modifier = Modifier
                            .height(125.dp)
                            .width(350.dp)
                            .border(BorderStroke(4.dp, DARK_BROWN), RoundedCornerShape(16.dp)),
                        colors = CardDefaults.cardColors(DARK_BROWN)

                    ) {
                        Column(
                            modifier = Modifier.fillMaxWidth(),
                            horizontalAlignment = Alignment.CenterHorizontally,
                            verticalArrangement = Arrangement.Center
                        ) {
                            Row {
                                Image(
                                    painter = painterResource(id = R.drawable.user),
                                    contentDescription = null,
                                    modifier = Modifier
                                        .padding(16.dp)
                                        .width(80.dp)
                                        .height(150.dp)
                                )
                                Column {
                                    Text(
                                        author.name,
                                        fontSize = 28.sp,
                                        fontFamily = letter,
                                        color = Color.White
                                    )
                                    Text(
                                        author.number,
                                        fontSize = 28.sp,
                                        fontFamily = letter,
                                        color = Color.White
                                    )
                                }
                            }
                        }
                    }
                    Spacer(modifier = Modifier.height(50.dp))
                }

                item {
                    CustomButtonCard(
                        testTag = TEST_TAG_SEND_EMAIL_BUTTON,
                        stringResourceId = R.string.send_email,
                        imageFraction = 0.40f,
                        onClick = onSendEmailRequested
                    )
                }
            }
        }
    }
}

@Preview(showBackground = true)
@Composable
fun AboutScreenPreview() {
    AboutScreen(
        authors = listOf(
            Author("João Bonacho    ", "49437", "a49437@alunos.isel.pt"),
            Author("Carolina Pereira", "49470", "a49470@alunos.isel.pt"),
            Author("André Gonçalves", "49464", "a49464@alunos.isel.pt")
        ),
        onBackRequested = { },
        onSendEmailRequested = { },
    )
}