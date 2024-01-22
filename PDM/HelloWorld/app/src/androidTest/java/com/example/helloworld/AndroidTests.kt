package com.example.helloworld

import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.ui.test.*
import androidx.compose.ui.test.junit4.createComposeRule
import androidx.test.ext.junit.runners.AndroidJUnit4
import com.example.helloworld.ui.theme.HelloWorldTheme
import org.junit.Rule
import org.junit.Test
import org.junit.runner.RunWith

@RunWith(AndroidJUnit4::class)
class MainActivityTest {

    @get:Rule
    val composeTestRule = createComposeRule()

    @Test
    fun test_counter_increment() {
        composeTestRule.setContent {
            HelloWorldTheme {
                app(remember { mutableStateOf(0) })
            }
        }

        composeTestRule.onNodeWithText("+").performClick()
        composeTestRule.onNodeWithText("Counter = 1").assertIsDisplayed()
    }

    @Test
    fun test_counter_decrement() {
        composeTestRule.setContent {
            HelloWorldTheme {
                app(remember { mutableStateOf(1) })
            }
        }

        composeTestRule.onNodeWithText("-").performClick()
        composeTestRule.onNodeWithText("Counter = 0").assertIsDisplayed()
    }
}