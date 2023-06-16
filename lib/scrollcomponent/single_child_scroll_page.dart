import 'package:flutter/material.dart';

class SingleChildScrollPage extends StatelessWidget {
  const SingleChildScrollPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String str = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';

    return Scaffold(
      appBar: AppBar(
        title: Text('SingleChildScrollView'),
      ),
      body: Scrollbar(
          child: NotificationListener<ScrollEndNotification>(
        onNotification: (notification) {
          print(notification.runtimeType);
          return true;
        },
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Center(
            child: Column(
                children: str
                    .split("")
                    .map((c) => Text(c, textScaleFactor: 2))
                    .toList()),
          ),
        ),
      )),
    );
  }
}
