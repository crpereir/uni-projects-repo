package com.example.helloworld

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.Image
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxHeight
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.verticalScroll
import androidx.compose.material3.Button
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Surface
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.MutableState
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.modifier.ModifierLocalReadScope
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.example.helloworld.ui.theme.HelloWorldTheme
import com.example.helloworld.ui.theme.Purple80
import com.example.helloworld.ui.theme.PurpleGrey40

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            HelloWorldTheme {
                Surface(modifier = Modifier.fillMaxSize()) {
                    val counterState = remember { mutableStateOf(0) } // Inicializa o contador a 0
                    app(counterState)
                }
            }
        }
    }
}



@Preview
@Composable
fun app(counterState: MutableState<Int>) {
    Column(
        verticalArrangement = Arrangement.Center,
        horizontalAlignment = Alignment.CenterHorizontally,
        modifier = Modifier.fillMaxSize()
    ) {
        center()
        Text(
            text = "Counter = ${counterState.value}", // Mostra o valor do contador
            style = TextStyle(fontSize = 24.sp),
            modifier = Modifier.padding(16.dp)
        )
        Row(
            verticalAlignment = Alignment.CenterVertically,
            horizontalArrangement = Arrangement.Center
        ) {
            button(counterState)
        }
    }
}



@Composable
fun center() {
    HelloWorldTheme {
        Row(verticalAlignment = Alignment.Bottom,
            horizontalArrangement = Arrangement.Center) {}
    }
}


@Composable
fun button(counterState: MutableState<Int>) {

    Button(onClick = { counterState.value++ }) { // Incrementa o counter
        Text(fontSize = 30.sp, text = "+", color = Color.White)
    }
    Button(onClick = { if(counterState.value > 0)
                            counterState.value--
                       else counterState.value = 0}) { // Decrementa o counter
        Text(fontSize = 30.sp, text = "-", color = Color.White)
    }
}


