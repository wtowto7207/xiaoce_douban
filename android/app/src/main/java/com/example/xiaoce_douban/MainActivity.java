package com.example.xiaoce_douban;

import android.os.Bundle;
import android.widget.Toast;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    GeneratedPluginRegistrant.registerWith(this);

    new MethodChannel(getFlutterView(),"flutter.doubanmovie/toast").setMethodCallHandler(new MethodChannel.MethodCallHandler() {
        @Override
        public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
            if ("toast".equals(methodCall.method)){
                if (methodCall.hasArgument("content")){
                    Toast.makeText(getBaseContext(),methodCall.argument("content"),Toast.LENGTH_SHORT).show();
                    result.success("success");
                }else {
                    result.error("-1","toast fail","content is null");
                }
            }else {
                result.notImplemented();
            }
        }
    });
  }
}
