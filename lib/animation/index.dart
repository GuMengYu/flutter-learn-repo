import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AnimationPage extends StatelessWidget {
  const AnimationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('动画')),
        body: Center(
            child: Column(children: [
          ElevatedButton(
              onPressed: () {
                context.push('/animation/basic');
              },
              child: const Text('基本动画')),
          ElevatedButton(
              onPressed: () {
                context.push('/animation/router');
              },
              child: const Text('路由过渡动画')),
          ElevatedButton(
              onPressed: () {
                context.push('/animation/hero/a');
              },
              child: const Text('Hero动画')),
          ElevatedButton(
              onPressed: () {
                context.push('/animation/stage');
              },
              child: const Text('交织动画（动画序列）')),
        ])));
  }
}
