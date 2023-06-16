import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LayoutTest extends StatelessWidget {
  const LayoutTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('布局')),
      body: Center(
          child: Column(children: [
        ElevatedButton(
            onPressed: () {
              context.push('/layouttest/flex');
            },
            child: const Text('flex 布局')),
        ElevatedButton(
            onPressed: () {
              context.push('/layouttest/wrap');
            },
            child: const Text('流式布局')),
        ElevatedButton(
            onPressed: () {
              context.push('/layouttest/stack');
            },
            child: const Text('层叠布局')),
        ElevatedButton(
            onPressed: () {
              context.push('/layouttest/layoutbuilder');
            },
            child: const Text('layoutbuilder')),
      ])),
    );
  }
}
