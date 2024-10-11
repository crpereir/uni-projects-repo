package com.example.crowdtally

import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.Button
import androidx.compose.material3.Text
import androidx.compose.material3.TextField
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.platform.testTag
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp

const val COUNTING_TAG = "CountingView"
const val CONFIGURING_TAG = "ConfiguringView"

@Composable
fun CountingView(
    count: Int,
    limit: Int,
    onIncrement: () -> Unit,
    onDecrement: () -> Unit,
    onStartConfiguring: () -> Unit,
    modifier: Modifier = Modifier
) {
    Column(
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.Center,
        modifier = modifier.fillMaxSize().testTag(COUNTING_TAG)
    ) {
        Text(text = "Counter: $count")
        Text(text = "Limit: $limit")
        Spacer(modifier = Modifier.height(24.dp))

        Row {
            Button(onClick = { if (count > 0) onDecrement() }) { Text("-") }
            Spacer(modifier = Modifier.padding(8.dp))
            Button(onClick = {if (count < limit) onIncrement()}) { Text("+") }
        }
        Spacer(modifier = Modifier.height(24.dp))

        Button(onClick = onStartConfiguring) {
            Text("Change limit")
        }
    }
}

@Composable
fun ConfiguringView(
    newLimit: String,
    onNewLimitChanged: (String) -> Unit,
    onConfirm: () -> Unit,
    onCancel: () -> Unit,
    modifier: Modifier = Modifier
) {
    Column(
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.Center,
        modifier = modifier.fillMaxSize().testTag(CONFIGURING_TAG)
    ) {
        TextField(
            value = newLimit,
            onValueChange = onNewLimitChanged,
            label = { Text("New Limit") }
        )
        Spacer(modifier = Modifier.height(8.dp))

        Row {
            Button(onClick = onCancel) { Text("Cancel") }
            Spacer(modifier = Modifier.padding(8.dp))
            Button(onClick = onConfirm) { Text("Confirm") }
        }
    }
}

@Preview(showBackground = true)
@Composable
fun CountingViewPreview() {

}

@Preview(showBackground = true)
@Composable
fun ConfiguringViewPreview() {
}