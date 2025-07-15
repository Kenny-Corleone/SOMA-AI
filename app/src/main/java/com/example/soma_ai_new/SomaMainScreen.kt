package com.example.soma_ai_new

import androidx.compose.foundation.layout.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp

@Composable
fun SomaMainScreen(viewModel: MainViewModel? = null) {
    // Если есть ViewModel, используем его состояние, иначе заглушка
    val state = if (viewModel != null) {
        viewModel.uiState.collectAsState().value
    } else {
        remember { SomaUiState(response = "Тестовый ответ", isLoading = false) }
    }
    Box(
        modifier = Modifier.fillMaxSize(),
        contentAlignment = Alignment.Center
    ) {
        Column(
            horizontalAlignment = Alignment.CenterHorizontally
        ) {
            Text("SOMA Voice Assistant", style = MaterialTheme.typography.headlineMedium)
            Spacer(Modifier.height(32.dp))
            if (state.isLoading) {
                CircularProgressIndicator()
                Spacer(Modifier.height(32.dp))
            }
            Text(state.response, style = MaterialTheme.typography.bodyLarge)
            Spacer(Modifier.height(32.dp))
            Button(onClick = {
                viewModel?.onVoiceInput("Привет, SOMA!")
            }) {
                Text("Сказать что-нибудь")
            }
        }
    }
} 