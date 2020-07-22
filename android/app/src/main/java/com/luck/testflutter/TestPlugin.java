package com.luck.testflutter;

import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;

public class TestPlugin implements MethodCallHandler {

    private static final String CHANNEL = "test_plugin";

    public static void registerMethod(BinaryMessenger mBinaryMessenger){
        final MethodChannel channel = new MethodChannel(mBinaryMessenger, CHANNEL); //这里对应dart端的 MethodChannel
        channel.setMethodCallHandler(new TestPlugin());
    }

    @Override
    public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {

        switch (methodCall.method){
            case "getPlatformVersion":
                result.success("Android " + android.os.Build.VERSION.RELEASE);
                break;
            case "add":

                Integer x = methodCall.argument("x");
                Integer y = methodCall.argument("y");
                if (x != null && y != null) {
                    result.success(x + y);
                } else {
                    result.error("1", "不能为空", null);
                }
                break;
            default:
                result.notImplemented();
                break;
        }
    }
}
