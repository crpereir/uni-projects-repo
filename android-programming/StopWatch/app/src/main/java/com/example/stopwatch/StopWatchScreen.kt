package com.example.stopwatch

import androidx.compose.foundation.layout.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.runtime.getValue
import androidx.compose.runtime.saveable.Saver
import androidx.compose.runtime.saveable.rememberSaveable
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import kotlinx.coroutines.delay

sealed interface StopwatchState {
    object Initial : StopwatchState
    data class Running(
        val elapsedTime: Long,
        val startTime: Long,
        val modifier: Modifier = Modifier
    ) : StopwatchState

    data class Paused(val elapsedTime: Long, val modifier: Modifier = Modifier) : StopwatchState

    companion object {
        val Saver: Saver<MutableState<StopwatchState>, List<Any>> = Saver(
            save = { toSave ->
                toSave.value.let { state ->
                    when (state) {
                        is Initial -> listOf<Any>()
                        is Running -> listOf(state.elapsedTime, state.startTime)
                        is Paused -> listOf(state.elapsedTime)
                    }
                }
            },
            restore = { saved ->
                when (saved.size) {
                    0 -> mutableStateOf(Initial)
                    1 -> mutableStateOf(Paused(saved[0] as Long))
                    else -> mutableStateOf(Paused(saved[0] as Long))
                }
            }
        )
    }
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun StopWatchScreen() {
    Scaffold(
        topBar = { TopAppBar(title = { Text("Stopwatch") }) }
    ) { padding ->
        var state: StopwatchState by rememberSaveable(saver = StopwatchState.Saver) {
            mutableStateOf(StopwatchState.Initial)
        }

        Box(
            modifier = Modifier
                .fillMaxSize()
                .padding(padding),
            contentAlignment = Alignment.Center
        ) {
            when (val currentState = state) {
                is StopwatchState.Initial -> InitialStopwatch(
                    onStart = { state = StopwatchState.Running(0L, System.currentTimeMillis()) }
                )

                is StopwatchState.Running -> RunningStopwatch(
                    elapsedTime = currentState.elapsedTime,
                    startTime = currentState.startTime,
                    onPause = { elapsedTime -> state = StopwatchState.Paused(elapsedTime) },
                    onReset = { state = StopwatchState.Paused(0L) },
                    modifier = Modifier.fillMaxSize()
                )

                is StopwatchState.Paused -> PausedStopwatch(
                    elapsedTime = currentState.elapsedTime,
                    onResume = {
                        state = StopwatchState.Running(
                            currentState.elapsedTime,
                            System.currentTimeMillis()
                        )
                    },
                    onReset = { state = StopwatchState.Paused(0L) },
                    modifier = Modifier.fillMaxSize()
                )
            }
        }
    }
}

@Composable
fun InitialStopwatch(onStart: () -> Unit) {
    Button(onClick = onStart) {
        Text("Start")
    }
}

@Composable
fun RunningStopwatch(
    elapsedTime: Long,
    startTime: Long,
    onPause: (Long) -> Unit,
    onReset: () -> Unit,
    modifier: Modifier = Modifier
) {
    var currentTime by remember { mutableStateOf(elapsedTime) }
    var isRunning by remember { mutableStateOf(true) }

    LaunchedEffect(key1 = startTime, key2 = isRunning) {
        while (isRunning) {
            delay(10)
            currentTime = elapsedTime + (System.currentTimeMillis() - startTime)
        }
    }

    Column(modifier = modifier.padding(16.dp), horizontalAlignment = Alignment.CenterHorizontally) {
        Text(text = formatTime(currentTime), style = MaterialTheme.typography.headlineMedium)
        Spacer(modifier = Modifier.height(16.dp))
        Row {
            Button(onClick = {
                isRunning = !isRunning
                if (!isRunning) {
                    onPause(currentTime)
                }
            }) {
                Text(if (isRunning) "Pause" else "Resume")
            }
            Spacer(modifier = Modifier.width(8.dp))
            Button(onClick = {
                isRunning = false
                onReset()
                currentTime = 0 // Reset currentTime to 0
            }) {
                Text("Reset")
            }
        }
    }
}

@Composable
fun PausedStopwatch(
    elapsedTime: Long,
    onResume: () -> Unit,
    onReset: () -> Unit,
    modifier: Modifier = Modifier
) {
    Column(modifier = modifier.padding(16.dp), horizontalAlignment = Alignment.CenterHorizontally) {
        Text(text = formatTime(elapsedTime), style = MaterialTheme.typography.headlineMedium)
        Spacer(modifier = Modifier.height(16.dp))
        Row {
            Button(onClick = onResume) {
                Text("Resume")
            }
            Spacer(modifier = Modifier.width(8.dp))
            Button(onClick = onReset) {
                Text("Reset")
            }
        }
    }
}

fun formatTime(elapsedTime: Long): String {
    val totalSeconds = elapsedTime / 1000
    val minutes = totalSeconds / 60
    val seconds = totalSeconds % 60
    val milliseconds = (elapsedTime % 1000) / 10
    return String.format("%02d:%02d:%02d", minutes, seconds, milliseconds)
}