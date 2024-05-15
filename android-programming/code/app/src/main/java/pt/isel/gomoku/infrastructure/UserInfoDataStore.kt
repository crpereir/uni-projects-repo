package pt.isel.gomoku.infrastructure

import androidx.datastore.core.DataStore
import androidx.datastore.preferences.core.Preferences
import androidx.datastore.preferences.core.edit
import androidx.datastore.preferences.core.stringPreferencesKey
import kotlinx.coroutines.flow.first
import kotlinx.datetime.Instant
import pt.isel.gomoku.domain.users.UserInfo
import pt.isel.gomoku.domain.users.UserInfoRepository

private const val USER_USERNAME_KEY = "Username"
private const val USER_TOKEN_KEY = "Token"
private const val TOKEN_EXPIRATION = "Expiration"

/**
 * A user information repository implementation supported in DataStore.
 */
class UserInfoDataStore(private val store: DataStore<Preferences>) : UserInfoRepository {

    private val usernameKey = stringPreferencesKey(USER_USERNAME_KEY)
    private val tokenKey = stringPreferencesKey(USER_TOKEN_KEY)
    private val tokenExpirationKey = stringPreferencesKey(TOKEN_EXPIRATION)

    /**
     * Gets the user information.
     */
    override suspend fun getUserInfo(): UserInfo? {
        val preferences = store.data.first()
        val username = preferences[usernameKey]
        val token = preferences[tokenKey]
        val tokenExpiration = preferences[tokenExpirationKey]
        return if (username != null && token != null && tokenExpiration != null)
            UserInfo(username, token, Instant.parse(tokenExpiration))
        else
            null
    }

    /**
     * Updates the user information.
     */
    override suspend fun updateUserInfo(userInfo: UserInfo) {
        store.edit { preferences ->
            preferences[usernameKey] = userInfo.username
            preferences[tokenKey] = userInfo.token
            preferences[tokenExpirationKey] = userInfo.tokenExpiration.toString()
        }
    }

    /**
     * Removes the user information.
     */
    override suspend fun removeUserInfo() {
        store.edit { preferences ->
            preferences.remove(usernameKey)
            preferences.remove(tokenKey)
            preferences.remove(tokenExpirationKey)
        }
    }
}
