import 'package:flutter/material.dart';

class StateLifecycleTest extends StatefulWidget {
  const StateLifecycleTest({super.key});

  @override
  State<StateLifecycleTest> createState() => _StateLifecycleTestState();
}

class _StateLifecycleTestState extends State<StateLifecycleTest> {
  bool show = true;

  void removeCounter() {
    print('remove counter');
    setState(() {
      show = false;
    });
    print('$show');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('StateLifecycleTest')),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          show ? const CounterWidget() : const Text(''),
          OutlinedButton.icon(
              icon: Icon(Icons.remove_circle),
              onPressed: () {
                removeCounter();
              },
              label: const Text('remove counter'))
        ],
      )),
    );
  }
}

class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CounterState();
  }
}

class _CounterState extends State<CounterWidget> {
  int _counter = 0;
  @override
  void initState() {
    print('initState');
    _counter = 2;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return Center(
        child: FloatingActionButton(
      child: Text('$_counter'),
      onPressed: () {
        setState(() {
          _counter++;
        });
      },
    ));
  }

  @override
  void didUpdateWidget(covariant CounterWidget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget ");
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print('deactivate');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print('dispose');
  }

  @override
  void reassemble() {
    super.reassemble();
    print("reassemble");
  }

  @override
  void didChangeDependencies() {
    print('didChangeDependencies');
  }
}
