import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testflutter/model/test_plugin.dart';


class ButtonDemoPage extends StatefulWidget {
  @override
  _ButtonDemoPage createState() => _ButtonDemoPage();

}


class _ButtonDemoPage extends State<ButtonDemoPage> {

  static const MethodChannel _channel = const MethodChannel('test_plugin');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');

    return version;
  }

  static Future<int> requestNativeAdd(int x, int y) async {
    int result = await _channel.invokeMethod('add', {"x": x, "y": y});
    return result;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        child: Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text("测试1"),
                onPressed: (){
                  platformVersion.then((value) => print(value));
                },
              ),
              RaisedButton(
                child: Text("测试2"),
                onPressed: (){
                  requestNativeAdd(222, 333).then((value) => print(value));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}