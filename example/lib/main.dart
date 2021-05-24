import 'package:flutter/material.dart';
import 'package:methodchanneltest/methodchanneltest.dart';
import 'package:shared_preferences/shared_preferences.dart';
Methodchanneltest test = Methodchanneltest();

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    initializeAndSetValue();
    test.init((String uuid) async {
      _onClicked();
      return 1;
    });
  }

  initializeAndSetValue() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("TEST", "test value");
  }

  _onClicked() async {
    print("ON FLUTTER CALLED");
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.getString("TEST");
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: RaisedButton(
            onPressed: (){
              test.displayNewActivity();
            },
            child: Text('CALL NATIVE ACTIVITY'),
          ),
        ),
      ),
    );
  }
}
