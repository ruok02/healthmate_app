package com.example.healthmate_app

import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val CHANNEL = "com.example.healthmate/healthconnect"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "readHeartRate" -> {
                    // 추후 실제 Health Connect 연동 코드로 대체
                    result.success("심박수: 72 bpm (예시)")
                }
                "readBloodGlucose" -> {
                    result.success("혈당: 110 mg/dL (예시)")
                }
                "readBloodPressure" -> {
                    result.success("혈압: 120/80 mmHg (예시)")
                }
                "readWeight" -> {
                    result.success("체중: 75.0 kg (예시)")
                }
                else -> {
                    result.notImplemented()
                }
            }
        }
    }
}
