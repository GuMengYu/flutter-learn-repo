import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import ' components/BigCard.dart';
import 'main.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    var count = appState.count.toString();

    IconData icon;
    if (appState.fav) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('Home Page'),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                print('on taped');
              },
              child: BigCard(count: count),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisSize: MainAxisSize.min, // ← Add this.
              children: [
                ElevatedButton.icon(
                    onPressed: () {
                      appState.toggleFav();
                    },
                    icon: Icon(icon),
                    label: const Text('Like')),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    appState.countplus();
                  },
                  child: const Text('Next'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.star, color: Colors.green[500]),
                Icon(Icons.star, color: Colors.green[500]),
                Icon(Icons.star, color: Colors.green[500]),
                const Icon(Icons.star, color: Colors.black),
                const Icon(Icons.star, color: Colors.black),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                    child: Image.asset('assets/images/wallhaven-g732qe.jpg')),
                Expanded(
                    flex: 2,
                    child: Image.asset('assets/images/wallhaven-j3e3ry.png')),
                Expanded(
                    flex: 1,
                    child: Image.asset('assets/images/wallhaven-o3k21p.jpg')),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: const FloatingActionButton(
        onPressed: null,
        tooltip: 'Increment',
        child: Icon(Icons.abc_sharp),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
