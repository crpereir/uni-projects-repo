package pt.isel.gomoku.ui.authentication

import android.annotation.SuppressLint
import androidx.compose.foundation.Image
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.text.KeyboardOptions
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.OutlinedTextField
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.saveable.rememberSaveable
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.platform.testTag
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.text.input.KeyboardType
import androidx.compose.ui.text.input.PasswordVisualTransformation
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import pt.isel.gomoku.R
import pt.isel.gomoku.ui.common.theme.BACKGROUND
import pt.isel.gomoku.ui.common.theme.GomokuTheme
import pt.isel.gomoku.ui.common.theme.letter
import pt.isel.gomoku.ui.common.topbars.AuthTopBar
import pt.isel.gomoku.ui.common.topbars.NavigationHandlers
import pt.isel.gomoku.ui.common.utils.CustomButtonCard

/**
 * Tags used to identify the components of the LogInScreen in automated tests.
 */
const val TEST_TAG_LOGIN_SCREEN = "TEST_TAG_LOGIN_SCREEN"
const val TEST_TAG_LOGIN_BUTTON = "TEST_TAG_LOGIN_BUTTON"
const val TEST_TAG_LOGIN_IDENTITY = "TEST_TAG_LOGIN_IDENTITY"
const val TEST_TAG_LOGIN_PASSWORD = "TEST_TAG_LOGIN_PASSWORD"

/**
 * Root composable for the login screen, the one that displays the login form.
 * @param onBackRequested the callback to be invoked when the user requests to go back to the
 * previous screen.
 * @param onSignUpRequested the callback to be invoked when the user requests to sign up.
 * @param onLogInSubmitted the callback to be invoked when the user submits the form.
 */
@SuppressLint("UnusedMaterial3ScaffoldPaddingParameter")
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun LogInScreenView(
    onBackRequested: () -> Unit,
    onSignUpRequested: () -> Unit,
    onLogInSubmitted: (String, String) -> Unit
) {
    GomokuTheme {
        Scaffold(
            modifier = Modifier
                .testTag(TEST_TAG_LOGIN_SCREEN)
                .fillMaxSize(),
            topBar = {
                AuthTopBar(
                    navigation = NavigationHandlers(
                        onBackRequested = onBackRequested,
                        onSignUpRequested = onSignUpRequested
                    )
                )
            },
            containerColor = BACKGROUND
        ) {
            LazyColumn(
                modifier = Modifier
                    .padding(20.dp)
                    .fillMaxSize(),
                verticalArrangement = Arrangement.Center,
                horizontalAlignment = Alignment.CenterHorizontally,
            ) {
                item {
                    var username by rememberSaveable { mutableStateOf("") }
                    var password by rememberSaveable { mutableStateOf("") }

                    Text(
                        text = stringResource(id = R.string.insert_info),
                        fontSize = 25.sp,
                        fontFamily = letter
                    )

                    Spacer(modifier = Modifier.height(20.dp))

                    Row {
                        Image(
                            painter = painterResource(id = R.drawable.user),
                            contentDescription = null,
                            modifier = Modifier
                                .width(40.dp)
                                .height(60.dp)
                                .padding(5.dp)
                        )
                        OutlinedTextField(
                            value = username,
                            onValueChange = { username = it },
                            label = {
                                Text(
                                    text = stringResource(id = R.string.identity),
                                    fontSize = 10.sp,
                                    color = Color.Gray
                                )
                            },
                            shape = CircleShape,
                            modifier = Modifier
                                .fillMaxWidth()
                                .height(56.dp)
                                .testTag(TEST_TAG_LOGIN_IDENTITY),
                            textStyle = TextStyle(fontSize = 14.sp, color = Color.Black)
                        )
                    }


                    Spacer(modifier = Modifier.height(20.dp))

                    Row {
                        Image(
                            painter = painterResource(id = R.drawable.password),
                            contentDescription = null,
                            modifier = Modifier
                                .width(40.dp)
                                .height(60.dp)
                                .padding(5.dp)
                        )

                        OutlinedTextField(
                            value = password,
                            onValueChange = { password = it },
                            label = {
                                Text(
                                    text = stringResource(id = R.string.password),
                                    fontSize = 10.sp,
                                    color = Color.Gray
                                )
                            },
                            shape = CircleShape,
                            visualTransformation = PasswordVisualTransformation(),
                            keyboardOptions = KeyboardOptions(keyboardType = KeyboardType.Password),
                            modifier = Modifier
                                .fillMaxWidth()
                                .height(56.dp)
                                .testTag(TEST_TAG_LOGIN_PASSWORD),
                            textStyle = TextStyle(fontSize = 14.sp, color = Color.Black)
                        )

                    }

                    Spacer(modifier = Modifier.height(20.dp))

                    Row {
                        CustomButtonCard(
                            testTag = TEST_TAG_LOGIN_BUTTON,
                            stringResourceId = R.string.login,
                            imageFraction = 0.35f,
                            onClick = { onLogInSubmitted(username, password) }
                        )
                    }
                }
            }
        }
    }
}

@Preview(showBackground = true)
@Composable
fun LogInScreenPreview() {
    LogInScreenView({}, {}, { _, _ -> })
}