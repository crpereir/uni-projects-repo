package pt.isel.gomoku.domain.users

/**
 * Contract to be supported by the user info repository.
 * The user repository is the authority for the user info application state.
 */
interface UserInfoRepository {
    /**
     * Gets the user info if it exists, null otherwise.
     */
    suspend fun getUserInfo(): UserInfo?

    /**
     * Updates the user info.
     */
    suspend fun updateUserInfo(userInfo: UserInfo)

    /**
     * Removes the user info.
     */
    suspend fun removeUserInfo()
}
