import 'package:flutter/material.dart';

class WillpopscopePage extends StatefulWidget {
  const WillpopscopePage({Key? key}) : super(key: key);

  @override
  _WillpopscopeState createState() => _WillpopscopeState();
}

class _WillpopscopeState extends State<WillpopscopePage> {
  DateTime? lastPressedAt;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('导航返回拦截demo'),
      ),
      body: WillPopScope(
          child: Container(
            child: Text('1秒内连续按两次返回键推出'),
            alignment: Alignment.center,
          ),
          onWillPop: () async {
            if (lastPressedAt == null ||
                DateTime.now().difference(lastPressedAt!) >
                    Duration(seconds: 1)) {
              lastPressedAt = DateTime.now();
              return false;
            } else {
              return true;
            }
          }),
    );
  }
}
