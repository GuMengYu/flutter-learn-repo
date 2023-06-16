import 'package:flutter/material.dart';

class StackPage extends StatelessWidget {
  const StackPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('层叠布局')),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Stack(
              alignment: Alignment.center,
              fit: StackFit.expand,
              children: [
                Container(
                  child: const Text('hello world'),
                  color: Colors.amber[100],
                ),
                const Positioned(
                  top: 18,
                  child: Text('Your Dad'),
                ),
                const Positioned(
                  left: 18,
                  child: Text('I am Yo'),
                ),
              ],
            ),
          ),
          Expanded(
              flex: 1,
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  SizedBox(
                      height: 200,
                      width: 200,
                      child: Container(
                        color: Colors.amber,
                      )),
                  SizedBox(
                      height: 100,
                      width: 100,
                      child: Container(
                        color: Colors.red,
                      )),
                  SizedBox(
                      height: 50,
                      width: 50,
                      child: Container(
                        color: Colors.blue,
                      )),
                ],
              ))
        ],
      ),
    );
  }
}
