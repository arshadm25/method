import 'dart:async';
import 'package:flutter/services.dart';

typedef Future<dynamic> CallEventHandler(
    String uuid,
    );

class Methodchanneltest {
  static const MethodChannel _channel =
  const MethodChannel('methodchannel_test');


  CallEventHandler _onClicked = (String uuid) async { return; };

  /// Sets up [MessageHandler] for incoming messages.
  void init(
    CallEventHandler onClicked,
  ) {
    _onClicked = onClicked;
    this.initMessagesHandler();
  }

  void initMessagesHandler() {
    _channel.setMethodCallHandler(_handleMethod);
  }


  Future<void> displayNewActivity() async {

    return _channel.invokeMethod("startNewActivity",{});
  }

  Future<dynamic> _handleMethod(MethodCall call) async {
    try {
      print("ON METHOD CALL");
      switch (call.method) {
        case "CALL_TO_FLUTTER":
          return _onClicked("1234");
          break;
        default:
          print("unrecognized  " + call.method);
          throw UnsupportedError("Unrecognized JSON message");
      }
    } catch (ex) {
      print("PACKAGE ERROR");
      print(ex.toString());
    }
    return 1;
  }
}
