// 父widget管理状态

import 'package:flutter/material.dart';

class ParentWidget extends StatefulWidget {
  const ParentWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ParentWidgetState();
  }
}

class _ParentWidgetState extends State<ParentWidget> {
  bool boxActive = false;

  void _handleTapChange(bool newVal) {
    setState(() {
      boxActive = newVal;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TapboxC(
        active: boxActive,
        onChanged: _handleTapChange,
      ),
    );
  }
}

class TapboxB extends StatelessWidget {
  const TapboxB({
    super.key,
    this.active = false,
    required this.onChanged,
  });

  final bool active;
  final ValueChanged<bool> onChanged;
  void _handleTap() {
    onChanged(!active);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.elliptical(12, 24)),
          color: active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
        child: Center(
          child: Text(
            active ? 'Active' : 'Inactive',
            style: const TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class TapboxC extends StatefulWidget {
  const TapboxC({
    super.key,
    this.active = false,
    required this.onChanged,
  });
  final bool active;
  final ValueChanged<bool> onChanged;
  @override
  State<StatefulWidget> createState() => _TapboxCState();
}

class _TapboxCState extends State<TapboxC> {
  bool _highlight = false;

  void _handleTapDown(TapDownDetails details) {
    print('tap down');
    setState(() {
      _highlight = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    print('tap up');

    setState(() {
      _highlight = false;
    });
  }

  void _handleTapCancel() {
    print('tap cancel');

    setState(() {
      _highlight = false;
    });
  }

  void _handleTap() {
    print('tap');

    widget.onChanged(!widget.active);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleTapCancel,
      onTap: _handleTap,
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
            color: widget.active ? Colors.amber : Colors.blue,
            border: _highlight
                ? Border.all(color: Colors.teal[700]!, width: 10)
                : null),
        child: Center(
            child: Text(
          widget.active ? 'Active' : 'Inactive',
          style: const TextStyle(fontSize: 32, color: Colors.white),
        )),
      ),
    );
  }
}
