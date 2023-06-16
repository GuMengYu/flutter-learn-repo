import 'dart:async';

import 'package:flutter/material.dart';

class Gesture extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return GestureState();
  }
}

class GestureState extends State<Gesture> with SingleTickerProviderStateMixin {
  void _onDoubleTap() {
    print('ono Double Tap');
  }

  double _top = 0.0;
  double _left = 0.0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('GestureDetector')),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: _top,
            left: _left,
            child: GestureDetector(
              child: CircleAvatar(child: Text("A")),
              //手指按下时会触发此回调
              onPanDown: (DragDownDetails e) {
                //打印手指按下的位置(相对于屏幕)
                print("用户手指按下：${e.globalPosition}");
              },
              //手指滑动时会触发此回调
              // onPanUpdate: (DragUpdateDetails e) {
              //   //用户手指滑动时，更新偏移，重新构建
              //   setState(() {
              //     _left += e.delta.dx;
              //     _top += e.delta.dy;
              //   });
              // },
              // onVerticalDragUpdate: (details) {
              //   setState(() {
              //     _top += details.delta.dy;
              //   });
              // },
              onHorizontalDragUpdate: (details) {
                setState(() {
                  _left += details.delta.dx;
                });
              },
              onPanEnd: (DragEndDetails e) {
                //打印滑动结束时在x、y轴上的速度
                print(e.velocity);
              },
            ),
          )
        ],
      ),
    );
  }
}
