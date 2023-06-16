import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EventPage extends StatelessWidget {
  const EventPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('事件与通知')),
        body: Center(
            child: Column(children: [
          ElevatedButton(
              onPressed: () {
                context.push('/event/bus');
              },
              child: const Text('EventBus')),
          ElevatedButton(
              onPressed: () {
                context.push('/event/notification');
              },
              child: const Text('通知')),
        ])));
  }
}
