import 'package:flutter/material.dart';

class EventBusPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _EventBusPage();
  }
}

class _EventBusPage extends State<EventBusPage> {
  int count = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    eventBus.on('test', (arg) {
      increase();
    });
  }

  void increase() {
    setState(() {
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dialog'),
      ),
      body: Center(
          child: Column(
        children: [
          Text("Counter is ${count}"),
          ElevatedButton(
              onPressed: () {
                eventBus.emit('test', 'this is event bus args');
              },
              child: Text('emit'))
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          eventBus.on('test', (arg) {
            print('on callback');
          });
        },
        child: Icon(Icons.event),
      ),
    );
  }
}

typedef void EventCallback(arg);

class EventBus {
  EventBus._internal();

  // 保存单例
  static EventBus _singleton = EventBus._internal();

  factory EventBus() => _singleton;

  final _emap = Map<Object, List<EventCallback>?>();

  void on(eventName, EventCallback event) {
    _emap[eventName] ??= <EventCallback>[];
    _emap[eventName]!.add(event);
  }

  void off(eventName, [EventCallback? f]) {
    var list = _emap[eventName];

    if (eventName == null || list == null) return;

    if (f == null) {
      _emap[eventName] = null;
    } else {
      list.remove(f);
    }
  }

  void emit(eventName, [arg]) {
    var list = _emap[eventName];

    if (list == null) return;

    int len = list.length - 1;

    for (var i = len; i > -1; i--) {
      list[i](arg);
    }
  }
}

var eventBus = EventBus();
