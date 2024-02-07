package pt.isel.gomoku.presentation.http

import org.junit.Rule
import pt.isel.gomoku.presentation.utils.MockWebServerRule

class APIHomeServiceTests {

    @get:Rule
    val rule = MockWebServerRule()
}