import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_app/SecondRoute.dart';

class Routes extends StatelessWidget {
  const Routes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Pages')),
        body: GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
            ),
            children: [
              ElevatedButton(
                  onPressed: () {
                    // Navigator.pushNamed(context, '/second_route')
                    context.push('/');
                  },
                  child: const Text('home')),
              ElevatedButton(
                  onPressed: () {
                    // Navigator.pushNamed(context, '/http')
                    context.push('/http');
                  },
                  child: const Text('Request Demo')),
              ElevatedButton(
                  onPressed: () {
                    // Navigator.pushNamed(context, '/gesture');
                    context.push('/layout');
                  },
                  child: const Text('Detail Demo')),
              ElevatedButton(
                  onPressed: () {
                    // Navigator.pushNamed(context, '/gesture');
                    context.push('/layout2');
                  },
                  child: const Text('布局约束')),
              ElevatedButton(
                  onPressed: () {
                    // Navigator.pushNamed(context, '/gesture');
                    context.push('/gesture');
                  },
                  child: const Text('手势检测')),
              ElevatedButton(
                  onPressed: () {
                    context.push('/playground');
                  },
                  child: const Text('playground')),
              ElevatedButton(
                  onPressed: () {
                    context.push('/catalog');
                  },
                  child: const Text('catalog')),
              ElevatedButton(
                  onPressed: () {
                    context.push('/statelife');
                  },
                  child: const Text('statelife')),
              ElevatedButton(
                  onPressed: () {
                    context.push('/basic_components');
                  },
                  child: const Text('basic components')),
              ElevatedButton(
                  onPressed: () {
                    context.push('/layouttest');
                  },
                  child: const Text('布局')),
              ElevatedButton(
                  onPressed: () {
                    context.push('/container');
                  },
                  child: const Text('容器组件')),
              ElevatedButton(
                  onPressed: () {
                    context.push('/scroll');
                  },
                  child: const Text('滚动组件')),
              ElevatedButton(
                  onPressed: () {
                    context.push('/timepicker');
                  },
                  child: const Text('TimePicker')),
              ElevatedButton(
                  onPressed: () {
                    context.push('/datepicker');
                  },
                  child: const Text('DatePicker')),
              ElevatedButton(
                  onPressed: () {
                    context.push('/function_c');
                  },
                  child: const Text('功能性组件')),
              ElevatedButton(
                  onPressed: () {
                    context.push('/event');
                  },
                  child: const Text('事件&通知')),
              ElevatedButton(
                  onPressed: () {
                    context.push('/animation');
                  },
                  child: const Text('Animation')),
              ElevatedButton(
                  onPressed: () {
                    context.push('/datepicker');
                  },
                  child: const Text('数据共享')),
              ElevatedButton(
                  onPressed: () {
                    context.push('/datepicker');
                  },
                  child: const Text('数据共享'))
            ]));
  }
}
