package com.example.soma_ai_new

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.launch
import javax.inject.Inject

data class SomaUiState(
    val response: String = "",
    val isLoading: Boolean = false
)

@HiltViewModel
class MainViewModel @Inject constructor() : ViewModel() {
    private val _uiState = MutableStateFlow(SomaUiState())
    val uiState: StateFlow<SomaUiState> = _uiState

    fun onVoiceInput(text: String) {
        viewModelScope.launch {
            _uiState.value = _uiState.value.copy(isLoading = true)
            // Имитация обработки (можно добавить задержку или реальный запрос)
            _uiState.value = _uiState.value.copy(
                response = "AI: $text",
                isLoading = false
            )
        }
    }
} 