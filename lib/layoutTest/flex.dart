import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FlexPage extends StatelessWidget {
  const FlexPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flex 布局')),
      body: Center(
          child: Column(
        children: [
          Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(
                  flex: 1,
                  child: Container(
                    height: 100.0,
                    color: Colors.amber,
                  )),
              Expanded(
                  flex: 2,
                  child: Container(
                    height: 30.0,
                    color: Colors.cyan,
                  ))
            ],
          ),
          const Padding(padding: EdgeInsets.all(4)),
          Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(
                  flex: 1,
                  child: Container(
                    height: 30,
                    color: Colors.teal,
                  )),
              const Spacer(
                flex: 2,
              ),
              Expanded(
                  flex: 3,
                  child: Container(
                    height: 30,
                    color: Colors.lime,
                  ))
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: SizedBox(
              height: 100.0,
              child: Flex(
                direction: Axis.vertical,
                children: [
                  Expanded(
                      flex: 2,
                      child: Container(
                        height: 30.0,
                        color: Colors.orange,
                      )),
                  const Spacer(
                    flex: 1,
                  ),
                  Expanded(
                      flex: 1,
                      child: Container(
                        height: 30.0,
                        color: Colors.deepPurple,
                      )),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
