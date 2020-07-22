package com.luck.testflutter;

import android.os.Bundle;
import android.os.PersistableBundle;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;


public class MainActivity extends FlutterActivity {
    private static final String CHANNEL = "test_plugin";

    @Override
    public void configureFlutterEngine(FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);

        TestPlugin.registerMethod(flutterEngine.getDartExecutor().getBinaryMessenger());

    }
}
