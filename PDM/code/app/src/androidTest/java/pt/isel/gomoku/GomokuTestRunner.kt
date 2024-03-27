package pt.isel.gomoku

import android.app.Application
import android.content.Context
import androidx.test.runner.AndroidJUnitRunner
import com.google.gson.Gson
import io.mockk.coEvery
import io.mockk.mockk
import kotlinx.datetime.Clock
import okhttp3.OkHttpClient
import pt.isel.gomoku.domain.services.GamesService
import pt.isel.gomoku.domain.services.HomeService
import pt.isel.gomoku.domain.services.UsersService
import pt.isel.gomoku.domain.services.local.LocalGamesService
import pt.isel.gomoku.domain.services.local.LocalHomeService
import pt.isel.gomoku.domain.services.local.LocalUsersService
import pt.isel.gomoku.domain.users.UserInfo
import pt.isel.gomoku.domain.users.UserInfoRepository
import kotlin.time.Duration.Companion.hours

/**
 * The service locator to be used in the instrumented tests.
 */
class GomokuTestApplication : APPDependencyProvider, Application() {

    private val testUserInfo = UserInfo("test", "test", Clock.System.now().plus(5.hours))

    override var userInfoRepository: UserInfoRepository =
        mockk {
            coEvery { getUserInfo() } returns testUserInfo
            coEvery { updateUserInfo(testUserInfo) } returns Unit
            coEvery { removeUserInfo() } returns Unit
        }

    override val httpClient: OkHttpClient
        get() = OkHttpClient.Builder()
            .callTimeout(10, java.util.concurrent.TimeUnit.SECONDS)
            .build()

    override val gson: Gson
        get() = Gson()

    override var gamesService: GamesService = LocalGamesService()

    override var usersService: UsersService = LocalUsersService()

    override var homeService: HomeService = LocalHomeService()
}

@Suppress("unused")
class GomokuTestRunner : AndroidJUnitRunner() {
    override fun newApplication(cl: ClassLoader, className: String, context: Context): Application {
        return super.newApplication(cl, GomokuTestApplication::class.java.name, context)
    }
}
