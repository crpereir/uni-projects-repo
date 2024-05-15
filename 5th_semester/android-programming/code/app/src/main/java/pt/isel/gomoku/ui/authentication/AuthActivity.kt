package pt.isel.gomoku.ui.authentication

import android.app.Activity
import android.content.Intent
import android.os.Bundle
import android.os.Parcelable
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.viewModels
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import androidx.lifecycle.lifecycleScope
import kotlinx.coroutines.launch
import kotlinx.parcelize.Parcelize
import pt.isel.gomoku.APPDependencyProvider
import pt.isel.gomoku.domain.infra.Action
import pt.isel.gomoku.domain.infra.Field
import pt.isel.gomoku.domain.infra.Link
import pt.isel.gomoku.domain.states.AuthState.LoginMode
import pt.isel.gomoku.domain.states.AuthState.SignUpMode
import pt.isel.gomoku.domain.states.Loading
import pt.isel.gomoku.domain.states.Saved
import pt.isel.gomoku.domain.states.Saving
import pt.isel.gomoku.domain.states.loginMode
import pt.isel.gomoku.ui.startGame.StartGameActivity
import pt.isel.gomoku.ui.common.utils.PopUpError

/**
 * The application's authentication activity, used to display the login and signup screens.
 * Navigation to this activity is done through the [AuthActivity.navigateTo] method.
 */
class AuthActivity : ComponentActivity() {

    private val dependencies by lazy { application as APPDependencyProvider }
    private val viewModel by viewModels<AuthViewModel> {
        AuthViewModel.factory(
            dependencies.usersService,
            dependencies.userInfoRepository,
            actionLogin = getActionExtra(ACTION_EXTRA_LOGIN)?.toAction(),
            actionSignUp = getActionExtra(ACTION_EXTRA_SIGNUP)?.toAction()
        )
    }

    companion object {
        fun navigateTo(
            origin: Activity,
            linkMe: Link?,
            actionLogin: Action?,
            actionSignUp: Action?
        ) {
            with(origin) {
                val intent = Intent(this, AuthActivity::class.java)
                linkMe?.let { intent.putExtra(LINK_EXTRA, LinkExtra(it)) }
                actionLogin?.let { intent.putExtra(ACTION_EXTRA_LOGIN, ActionExtra(it)) }
                actionSignUp?.let { intent.putExtra(ACTION_EXTRA_SIGNUP, ActionExtra(it)) }
                startActivity(intent)
            }
        }
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        lifecycleScope.launch {
            viewModel.ioState.collect {
                if (it is Saved && it.value.isSuccess) {
                    StartGameActivity.navigateTo(
                        this@AuthActivity,
                        getLinkExtra()?.toLink(),
                    )
                    //viewModel.reset()
                }
            }
        }

        setContent {
            val ioState by viewModel.ioState.collectAsState(initial = loginMode())
            when (ioState) {
                is LoginMode -> {
                    LogInScreenView(
                        onBackRequested = { finish() },
                        onLogInSubmitted = { identity, password ->
                            viewModel.login(identity, password)
                        },
                        onSignUpRequested = { viewModel.changeMode() },
                    )

                    (ioState as LoginMode).getLastError()?.let { error ->
                        PopUpError(error = error, onDismissRequested = { viewModel.cleanError() })
                    }
                }

                is SignUpMode -> {
                    SignUpScreenView(
                        onBackRequested = { viewModel.changeMode() },
                        onSignUpSubmitted = { username, email, password ->
                            viewModel.signup(username, email, password)
                        }
                    )

                    (ioState as SignUpMode).getLastError()?.let { error ->
                        PopUpError(error = error, onDismissRequested = { viewModel.cleanError() })
                    }
                }

                is Saved, Saving, Loading -> AuthScreenLoadingView()

                else -> throw IllegalStateException("Invalid state in activity -> $ioState")
            }
        }
    }

    @Suppress("DEPRECATION")
    private fun getLinkExtra(): LinkExtra? =
        if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.TIRAMISU)
            intent.getParcelableExtra(LINK_EXTRA, LinkExtra::class.java)
        else
            intent.getParcelableExtra(LINK_EXTRA)

    @Suppress("DEPRECATION")
    private fun getActionExtra(extraName: String): ActionExtra? =
        if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.TIRAMISU)
            intent.getParcelableExtra(extraName, ActionExtra::class.java)
        else
            intent.getParcelableExtra(extraName)
}

const val LINK_EXTRA = "StartGame.extra.Link"
const val ACTION_EXTRA_LOGIN = "StartGame.extra.Action.Login"
const val ACTION_EXTRA_SIGNUP = "StartGame.extra.Action.SignUp"

@Parcelize
data class LinkExtra(
    val rel: List<String>,
    val href: String,
    val authenticationType: List<String>
) : Parcelable {

    constructor(link: Link) : this(
        link.rel,
        link.href,
        link.authenticationType,
    )
}

@Parcelize
data class ActionExtra(
    val name: String,
    val title: String?,
    val href: String,
    val method: String,
    val authenticationType: List<String>,
    val type: String?,
    val fields: List<FieldExtra>
) : Parcelable {

    constructor(action: Action) : this(
        action.name,
        action.title,
        action.href,
        action.method,
        action.authenticationType,
        action.type,
        action.fields.map { FieldExtra(it) }
    )
}

@Parcelize
data class FieldExtra(
    val name: String,
    val type: String,
    val value: String?
) : Parcelable {

    constructor(field: Field) : this(
        field.name,
        field.type,
        field.value
    )
}

private fun LinkExtra.toLink(): Link =
    Link(rel, href, authenticationType)

private fun ActionExtra.toAction(): Action =
    Action(name, title, href, method, authenticationType, type, fields.map { it.toField() })

private fun FieldExtra.toField(): Field =
    Field(name, type, value)
