import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScrollPage extends StatelessWidget {
  const ScrollPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('容器组件')),
      body: Center(
          child: Column(children: [
        ElevatedButton(
            onPressed: () {
              context.push('/scroll/single');
            },
            child: const Text('SingleChildScrollView')),
        ElevatedButton(
            onPressed: () {
              context.push('/scroll/list');
            },
            child: const Text('ListView')),
        ElevatedButton(
            onPressed: () {
              context.push('/scroll/infinite');
            },
            child: const Text('无限滚动列表')),
        ElevatedButton(
            onPressed: () {
              context.push('/scroll/scrollcontroller');
            },
            child: const Text('Scroll Controller')),
        ElevatedButton(
            onPressed: () {
              context.push('/scroll/scrolllistener');
            },
            child: const Text('Scroll Listener')),
        ElevatedButton(
            onPressed: () {
              context.push('/scroll/animated');
            },
            child: const Text('Animated List')),
        ElevatedButton(
            onPressed: () {
              context.push('/scroll/grid');
            },
            child: const Text('Grid View')),
        ElevatedButton(
            onPressed: () {
              context.push('/scroll/page');
            },
            child: const Text('Page View')),
        ElevatedButton(
            onPressed: () {
              context.push('/scroll/tab');
            },
            child: const Text('TabBarView')),
        ElevatedButton(
            onPressed: () {
              context.push('/scroll/custom');
            },
            child: const Text('CustomScrollView')),
        ElevatedButton(
            onPressed: () {
              context.push('/scroll/customsliver');
            },
            child: const Text('CustomSliver'))
      ])),
    );
  }
}
