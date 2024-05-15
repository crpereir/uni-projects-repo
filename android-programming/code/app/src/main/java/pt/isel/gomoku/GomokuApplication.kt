package pt.isel.gomoku

import android.app.Application
import androidx.datastore.core.DataStore
import androidx.datastore.preferences.core.Preferences
import androidx.datastore.preferences.preferencesDataStore
import com.google.gson.Gson
import okhttp3.OkHttpClient
import pt.isel.gomoku.domain.services.GamesService
import pt.isel.gomoku.domain.services.HomeService
import pt.isel.gomoku.domain.services.UsersService
import pt.isel.gomoku.domain.users.UserInfoRepository
import pt.isel.gomoku.http.APIGamesService
import pt.isel.gomoku.http.APIHomeService
import pt.isel.gomoku.http.APIUsersService
import pt.isel.gomoku.infrastructure.UserInfoDataStore

/**
 * The contract to be supported by the application's class used to resolve dependencies.
 */
interface APPDependencyProvider {

    /**
     * The HTTP client used to perform HTTP requests.
     */
    val httpClient: OkHttpClient

    /**
     * The JSON serializer/deserializer used to convert JSON into DTOs.
     */
    val gson: Gson

    /**
     * The service to use users' operations.
     */
    val gamesService: GamesService

    /**
     * The service to use games' operations.
     */
    val usersService: UsersService

    /**
     * The service to use home' operations.
     */
    val homeService: HomeService

    /**
     * The repository with user information.
     */
    val userInfoRepository: UserInfoRepository
}

/**
 * The application's class used to resolve dependencies, acting as a Service Locator.
 * Dependencies are then injected manually by each Android Component (e.g Activity, Service, etc.).
 */
class GomokuApplication : Application(), APPDependencyProvider {

    private val apiBaseUrl = BuildConfig.API_BASE_URL

    private val dataStore: DataStore<Preferences> by preferencesDataStore(name = "user_info")

    override val httpClient: OkHttpClient =
        OkHttpClient.Builder()
            .callTimeout(10, java.util.concurrent.TimeUnit.SECONDS)
            .build()

    override val gson: Gson =
        Gson()

    override val usersService: UsersService =
        APIUsersService(httpClient, gson, apiBaseUrl)
        //LocalUsersService()

    override val gamesService: GamesService =
        APIGamesService(httpClient, gson, apiBaseUrl)
        //LocalGamesService()

    override val homeService: HomeService =
        APIHomeService(httpClient, gson, apiBaseUrl)
        //LocalHomeService()

    override val userInfoRepository: UserInfoRepository
        get() = UserInfoDataStore(dataStore)
}
