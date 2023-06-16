import 'package:flutter/material.dart';

class MyNotificationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyNotificationPageState();
  }
}

class _MyNotificationPageState extends State<MyNotificationPage> {
  String _msg = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('自定义通知')),
      body: NotificationListener<MyNotification>(
        onNotification: (notification) {
          print(notification);
          return false;
        },
        child: NotificationListener<MyNotification>(
          onNotification: (notification) {
            setState(() {
              _msg += notification.msg;
            });
            return true;
          },
          child: Center(
            child: Column(children: [
              Builder(builder: (context) {
                return ElevatedButton(
                    onPressed: () {
                      MyNotification('hello world').dispatch(context);
                    },
                    child: Text('Send Notifaciton'));
              }),
              Text('${_msg}'),
            ]),
          ),
        ),
      ),
    );
  }
}

class MyNotification extends Notification {
  MyNotification(this.msg);
  final String msg;
}
