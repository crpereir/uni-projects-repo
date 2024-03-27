package pt.isel.gomoku.presentation.infrastruture

import androidx.datastore.core.DataStore
import androidx.datastore.preferences.core.PreferenceDataStoreFactory
import androidx.datastore.preferences.core.Preferences
import kotlinx.coroutines.ExperimentalCoroutinesApi
import kotlinx.coroutines.test.TestScope
import kotlinx.coroutines.test.UnconfinedTestDispatcher
import kotlinx.coroutines.test.runTest
import kotlinx.datetime.Clock
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNull
import org.junit.Rule
import org.junit.Test
import org.junit.rules.TemporaryFolder
import pt.isel.gomoku.domain.users.UserInfo
import pt.isel.gomoku.infrastructure.UserInfoDataStore
import kotlin.time.Duration.Companion.hours

@OptIn(ExperimentalCoroutinesApi::class)
class UserInfoDataStoreTests {

    @get:Rule
    val tmpFolder: TemporaryFolder = TemporaryFolder.builder().assureDeletion().build()

    private val testDataStore: DataStore<Preferences> =
        PreferenceDataStoreFactory.create(
            scope = TestScope(UnconfinedTestDispatcher()),
            produceFile = { tmpFolder.newFile("test.preferences_pb") }
        )

    @Test
    fun `getUserInfo returns null if no user info is stored`(): Unit = runTest {
        // Arrange
        val sut = UserInfoDataStore(testDataStore)

        // Act
        val userInfo = sut.getUserInfo()

        // Assert
        assertNull(userInfo)
    }

    /*
    @Test
    fun `getUserInfo returns the previously stored value`(): Unit = runTest {
        // Arrange
        val sut = UserInfoDataStore(testDataStore)
        sut.updateUserInfo(
            UserInfo(
                "first test user",
                "first test token",
                Clock.System.now().plus(5.hours)
            )
        )

        val expected = UserInfo("test user", "test token", Clock.System.now().plus(5.hours))
        sut.updateUserInfo(expected)

        // Act
        val result = sut.getUserInfo()

        // Assert
        assertEquals(expected, result)
    }
     */
}