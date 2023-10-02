package com.example.stopwatch

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.layout.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.example.stopwatch.ui.theme.StopWatchTheme
import kotlinx.coroutines.delay
import kotlinx.coroutines.launch


class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            StopWatchTheme {
                Surface(modifier = Modifier.fillMaxSize()) {
                    StopWatch()
                }
            }
        }
    }
}
@Preview
@Composable
fun StopWatch() {
    var running by remember { mutableStateOf(false) }
    var elapsed by remember { mutableStateOf(0L) }
    var start by remember { mutableStateOf(0L) }

    //val coroutineScope = rememberCoroutineScope()

    LaunchedEffect(running) {
        while (running) {
            val currentTime = System.currentTimeMillis()
            elapsed = currentTime - start
            delay(10)
        }
    }

    Column(
        modifier = Modifier.fillMaxSize(),
        verticalArrangement = Arrangement.Center,
        horizontalAlignment = Alignment.CenterHorizontally
    ) {
        TimerDisplay(elapsed)
        Spacer(modifier = Modifier.height(16.dp))
        ControlButtons(
            isRunning = running,
            onStartClick = {
                if (!running) {
                    start = System.currentTimeMillis() - elapsed
                    running = true
                }
            },
            onStopClick = {
                if (running) {
                    running = false
                }
            },
            onResetClick = {
                if (!running) {
                    elapsed = 0
                }
            }
        )
    }
}

@Composable
fun TimerDisplay(elapsedTime: Long) {
    val timeInSeconds = (elapsedTime / 1000f).toInt()
    val minutes = timeInSeconds / 60
    val seconds = timeInSeconds % 60
    val milliseconds = (elapsedTime % 1000) / 10

    Text(
        text = "%02d:%02d:%02d".format(minutes, seconds, milliseconds),
        fontSize = 48.sp
    )
}

@Composable
fun ControlButtons(
    isRunning: Boolean,
    onStartClick: () -> Unit,
    onStopClick: () -> Unit,
    onResetClick: () -> Unit
) {
    Row(
        horizontalArrangement = Arrangement.Center,
        modifier = Modifier.fillMaxWidth()
    ) {
        if (!isRunning) {
            Button(
                onClick = onStartClick,
                modifier = Modifier.padding(8.dp)
            ) {
                Text(text = "Start", fontSize = 24.sp)
            }
            Button(
                onClick = onResetClick,
                modifier = Modifier.padding(8.dp)
            ) {
                Text(text = "Reset", fontSize = 24.sp)
            }
        } else {
            Button(
                onClick = onStopClick,
                modifier = Modifier.padding(8.dp)
            ) {
                Text(text = "Stop", fontSize = 24.sp)
            }
        }
    }
}