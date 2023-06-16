import 'package:flutter/material.dart';

class ScrollListener extends StatefulWidget {
  const ScrollListener({Key? key}) : super(key: key);

  @override
  _ScrollListenerState createState() => _ScrollListenerState();
}

class _ScrollListenerState extends State<ScrollListener> {
  var _progress = '0%';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Scroll Listener')),
      body: Scrollbar(
        child: NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification notification) {
            double progress = notification.metrics.pixels /
                notification.metrics.maxScrollExtent;

            setState(() {
              _progress = "${(progress * 100).toInt()}%";
            });
            print("BottomEdge: ${notification.metrics.extentAfter == 0}");
            return false;
          },
          child: Stack(alignment: Alignment.center, children: [
            ListView.builder(
              itemCount: 80,
              itemExtent: 50.0,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("$index"),
                );
              },
            ),
            CircleAvatar(
              //显示进度百分比
              radius: 30.0,
              child: Text('${_progress}'),
              backgroundColor: Colors.black54,
            )
          ]),
        ),
      ),
    );
  }
}
