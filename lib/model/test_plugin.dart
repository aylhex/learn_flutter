import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class TestPlugin {

  static const MethodChannel _channel = const MethodChannel('test_plugin');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<int> requestNativeAdd(int x, int y) async {
    int result = await _channel.invokeMethod('add', {"x": x, "y": y});
    return result;
  }

}