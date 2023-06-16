import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FunctionComponents extends StatelessWidget {
  const FunctionComponents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('功能性组件')),
        body: Center(
            child: Column(children: [
          ElevatedButton(
              onPressed: () {
                context.push('/function_c/willpop');
              },
              child: const Text('导航返回拦截')),
          ElevatedButton(
              onPressed: () {
                context.push('/function_c/futurebuilder');
              },
              child: const Text('Future Builder')),
          ElevatedButton(
              onPressed: () {
                context.push('/function_c/dialog');
              },
              child: const Text('Dialog')),
          ElevatedButton(
              onPressed: () {
                context.push('/function_c/inherited');
              },
              child: const Text('Inhreited Widget'))
        ])));
  }
}
