package com.example.crowdtally

import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Text
import androidx.compose.material3.TopAppBar
import androidx.compose.runtime.Composable
import androidx.compose.runtime.MutableState
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.saveable.Saver
import androidx.compose.runtime.saveable.rememberSaveable
import androidx.compose.runtime.setValue
import androidx.compose.ui.Modifier


sealed interface CrowdTallyState {
    data class Counting(val count: Int, val limit: Int, val modifier: Modifier = Modifier) :
        CrowdTallyState

    data class Configuring(
        val count: Int,
        val limit: Int,
        val newLimit: String,
        val modifier: Modifier = Modifier
    ) : CrowdTallyState

    companion object {
        val Saver: Saver<MutableState<CrowdTallyState>, List<Any>> = Saver(
            save = { toSave ->
                toSave.value.let { state ->
                    when (state) {
                        is Counting -> listOf(state.count, state.limit)
                        is Configuring -> listOf(state.count, state.limit, state.newLimit)
                    }
                }
            },
            restore = { saved ->
                if (saved.isNotEmpty())
                    mutableStateOf(Counting(saved[0] as Int, saved[1] as Int))
                else
                    mutableStateOf(
                        Configuring(
                            saved[0] as Int,
                            saved[1] as Int,
                            saved[2] as String
                        )
                    )
            }
        )
    }
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun CrowdTallyScreen() {
    Scaffold(
        modifier = Modifier.fillMaxSize(),
        topBar = { TopAppBar(title = { Text(text = "CrowdTally") }) }
    ) { padding ->
        var state: CrowdTallyState by rememberSaveable(saver = CrowdTallyState.Saver) {
            mutableStateOf(CrowdTallyState.Counting(0, LIMIT))
        }

        when (val currentState = state) {
            is CrowdTallyState.Counting -> CountingView(
                count = currentState.count,
                limit = currentState.limit,
                onIncrement = {
                    if (currentState.count < currentState.limit) {
                        state = CrowdTallyState.Counting(currentState.count + 1, currentState.limit)
                    }
                },
                onDecrement = {
                    if (currentState.count > 0) {
                        state = CrowdTallyState.Counting(currentState.count - 1, currentState.limit)
                    }
                },
                onStartConfiguring = {
                    state = CrowdTallyState.Configuring(currentState.count, currentState.limit, "")
                },
                modifier = Modifier.padding(padding),
            )

            else -> ConfiguringView(
                newLimit = (currentState as CrowdTallyState.Configuring).newLimit,
                onNewLimitChanged = { newLimit ->
                    state = CrowdTallyState.Configuring(
                        currentState.count,
                        currentState.limit,
                        newLimit,
                        currentState.modifier
                    )
                },
                onConfirm = {
                    state = CrowdTallyState.Counting(
                        currentState.count,
                        currentState.newLimit.toIntOrNull() ?: LIMIT
                    )
                },
                onCancel = {
                    state = CrowdTallyState.Counting(currentState.count, currentState.limit)
                },
                modifier = Modifier.padding(padding)
            )
        }
    }
}

