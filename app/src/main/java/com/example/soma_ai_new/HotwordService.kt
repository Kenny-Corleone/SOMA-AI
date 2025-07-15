package com.example.soma_ai_new

import android.app.Service
import android.content.Intent
import android.os.IBinder
import dagger.hilt.android.AndroidEntryPoint

@AndroidEntryPoint
class HotwordService : Service() {
    override fun onBind(intent: Intent?): IBinder? = null
    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        // TODO: Инициализация Porcupine и прослушка hotword
        return START_STICKY
    }
    override fun onDestroy() {
        super.onDestroy()
        // TODO: Освобождение ресурсов Porcupine
    }
}