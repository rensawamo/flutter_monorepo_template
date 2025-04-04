package com.example.melos_template

import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        ScreenReaderPlugin.configure(context, flutterEngine)
        GeneratedPluginRegistrant.registerWith(flutterEngine)
    }
}
