import 'package:flutter/material.dart';

class TapboxA extends StatefulWidget {
  const TapboxA({super.key});
  @override
  State<TapboxA> createState() => _TapboxAState();
}

class _TapboxAState extends State<TapboxA> {
  bool _active = false;
  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(24)),
              color: _active ? Colors.lightGreen : Colors.grey[600]),
          child: Center(
              child: Text(_active ? 'Active' : 'Inactive',
                  style:
                      const TextStyle(fontSize: 32.0, color: Colors.white)))),
    );
  }
}
