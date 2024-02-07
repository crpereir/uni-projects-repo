package pt.isel.gomoku.ui.authentication

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import androidx.lifecycle.viewmodel.initializer
import androidx.lifecycle.viewmodel.viewModelFactory
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import pt.isel.gomoku.domain.infra.Action
import pt.isel.gomoku.domain.services.UsersService
import pt.isel.gomoku.domain.states.AuthState
import pt.isel.gomoku.domain.states.AuthState.LoginMode
import pt.isel.gomoku.domain.states.IOState
import pt.isel.gomoku.domain.states.Loading
import pt.isel.gomoku.domain.states.Saved
import pt.isel.gomoku.domain.states.Saving
import pt.isel.gomoku.domain.states.getOrNull
import pt.isel.gomoku.domain.states.loadSuccess
import pt.isel.gomoku.domain.states.loading
import pt.isel.gomoku.domain.states.loginMode
import pt.isel.gomoku.domain.states.saved
import pt.isel.gomoku.domain.states.saving
import pt.isel.gomoku.domain.states.signUpMode
import pt.isel.gomoku.domain.users.UserInfo
import pt.isel.gomoku.domain.users.UserInfoRepository

/**
 * The view model for the authentication screen.
 * @property usersService The service used to communicate with the server.
 * @property repository The repository used to store the user information.
 * @property actionLogin the action to login or null if not known.
 * @property actionSignUp the action to sign up or null if not known.
 */
class AuthViewModel(
    private val usersService: UsersService,
    private val repository: UserInfoRepository,
    private val actionLogin: Action?,
    private val actionSignUp: Action?,
) : ViewModel() {

    companion object {
        fun factory(
            usersService: UsersService,
            repository: UserInfoRepository,
            actionLogin: Action?,
            actionSignUp: Action?
        ) = viewModelFactory {
            initializer { AuthViewModel(usersService, repository, actionLogin, actionSignUp) }
        }
    }

    private val _ioStateFlow: MutableStateFlow<IOState<UserInfo?>> = MutableStateFlow(loginMode())

    /**
     * The flow of states the view model traverses.
     */
    val ioState: Flow<IOState<UserInfo?>>
        get() = _ioStateFlow.asStateFlow()


    /**
     * Performs the login process.
     * @param identity The user identity.
     * @param password The user password.
     */
    private suspend fun loginProcess(identity: String, password: String) {
        runCatching {
            checkLoginInput(identity, password)
            usersService.login(identity, password, actionLogin)
        }
            .onSuccess { sirenToken ->
                val token = requireNotNull(sirenToken.properties)
                runCatching {
                    usersService.me(
                        token = token.token,
                        link = usersService.getLinkRelations()
                            ?.let { sirenToken.getLink(it.USER_HOME) }
                    )
                }
                    .onSuccess { sirenUser ->
                        val user = requireNotNull(sirenUser.properties)

                        _ioStateFlow.value = loadSuccess(
                            UserInfo(
                                username = user.username,
                                token = token.token,
                                tokenExpiration = token.expiration
                            )
                        )
                        updateUserInfo()
                    }
                    .onFailure { error -> _ioStateFlow.value = loginMode(error) }
            }
            .onFailure { error -> _ioStateFlow.value = loginMode(error) }
    }

    /**
     * Performs the signup process.
     * @param username The user username.
     * @param email The user email.
     * @param password The user password.
     * @throws IllegalStateException if the view model is already in the loading state.
     */
    fun signup(username: String, email: String, password: String) {
        if (_ioStateFlow.value is Loading)
            throw IllegalStateException("The view model is already in the loading state.")

        _ioStateFlow.value = loading()
        viewModelScope.launch {
            runCatching {
                checkSignUpInput(username, email, password)
                usersService.signUp(username, email, password, actionSignUp)
            }
                .onSuccess { loginProcess(username, password) }
                .onFailure { error -> _ioStateFlow.value = signUpMode(error) }
        }
    }

    /**
     * Performs the login process.
     * @param identity The user identity.
     * @param password The user password.
     * @throws IllegalStateException if the view model is already in the loading state.
     */
    fun login(identity: String, password: String) {
        if (_ioStateFlow.value is Loading)
            throw IllegalStateException("The view model is already in the loading state.")

        _ioStateFlow.value = loading()
        viewModelScope.launch {
            loginProcess(identity, password)
        }
    }

    /**
     * Updates the user information.
     * @throws IllegalStateException if the view model is in the saving state.
     */
    private suspend fun updateUserInfo() {
        if (_ioStateFlow.value is Saving)
            throw IllegalStateException("The view model is in the saving state.")
        val userInfo = requireNotNull(_ioStateFlow.value.getOrNull())
        _ioStateFlow.value = saving()
        val result = runCatching {
            repository.updateUserInfo(userInfo)
            userInfo
        }
        _ioStateFlow.value = saved(result)
    }

    /**
     * Resets the view model to the login mode state.
     * @throws IllegalStateException if the view model is not in the saved state.
     */
    fun reset() {
        if (_ioStateFlow.value !is Saved)
            throw IllegalStateException("The view model is not in the saved state.")
        _ioStateFlow.value = loginMode()
    }

    /**
     * Changes the view model mode.
     * @throws IllegalStateException if the view model is not in the loginMode or signUpMode state.
     */
    fun changeMode() {
        if (_ioStateFlow.value !is AuthState)
            throw IllegalStateException("The view model is not in the loginMode or signUpMode state.")

        if (_ioStateFlow.value is LoginMode) {
            _ioStateFlow.value = signUpMode()
        } else {
            _ioStateFlow.value = loginMode()
        }
    }

    /**
     * Cleans the last error.
     * @throws IllegalStateException if the view model is not in the loginMode or signUpMode state.
     */
    fun cleanError() {
        if (_ioStateFlow.value !is AuthState)
            throw IllegalStateException("The view model is not in the loginMode or signUpMode state.")

        if (_ioStateFlow.value is LoginMode) {
            _ioStateFlow.value = loginMode()
        } else {
            _ioStateFlow.value = signUpMode()
        }
    }
}