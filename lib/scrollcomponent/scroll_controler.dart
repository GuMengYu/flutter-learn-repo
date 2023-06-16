import 'package:flutter/material.dart';

class ScrollControler extends StatefulWidget {
  const ScrollControler({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ScrollControlerState();
}

class _ScrollControlerState extends State<ScrollControler> {
  final ScrollController _controller = ScrollController();
  bool isShowScrollTopButton = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.addListener(() {
      print(_controller.offset); //打印滚动位置
      if (_controller.offset < 1000 && isShowScrollTopButton) {
        setState(() {
          isShowScrollTopButton = false;
        });
      } else if (_controller.offset >= 1000 && !isShowScrollTopButton) {
        setState(() {
          isShowScrollTopButton = true;
        });
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Scroll Controler')),
      body: Scrollbar(
          controller: _controller,
          child: ListView.builder(
              controller: _controller,
              itemCount: 100,
              itemExtent: 50.0,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('$index'),
                );
              })),
      floatingActionButton: isShowScrollTopButton
          ? FloatingActionButton(
              child: Icon(Icons.arrow_upward),
              onPressed: () {
                _controller.animateTo(0,
                    duration: Duration(milliseconds: 550), curve: Curves.ease);
              },
            )
          : null,
    );
  }
}
