import 'package:flutter/material.dart';

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  void _handleTap(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        padding: const EdgeInsets.all(8),
        child: ElevatedButton(
            onPressed: () => {_handleTap(context)},
            child: const Text('go back')),
      )),
    );
  }
}
