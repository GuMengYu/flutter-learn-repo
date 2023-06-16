import 'package:flutter/material.dart';
import 'package:my_app/statemanage/ParentWidget.dart';

class Playground extends StatelessWidget {
  const Playground({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Playground')),
        body: const Center(child: ParentWidget()));
  }
}
