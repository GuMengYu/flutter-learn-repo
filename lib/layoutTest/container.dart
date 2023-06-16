import 'package:flutter/material.dart';

class ContainerPage extends StatelessWidget {
  const ContainerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget avatar = Image.asset(
      'assets/images/wallhaven-j3e3ry.png',
      width: 60.0,
    );
    return Scaffold(
      appBar: AppBar(title: Text('容器组件')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('你好'),
            duration: Duration(seconds: 2),
            behavior: SnackBarBehavior.floating,
          ));
        },
        child: Icon(Icons.navigation),
      ),
      body: Center(
          child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(24),
            child: Container(
              color: Colors.red[300],
              child: Text('Padding 24'),
            ),
          ),
          DecoratedBox(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.orange, Colors.pink]),
                borderRadius: BorderRadius.circular(3.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(2.0, 2.0),
                    blurRadius: 4.0,
                  )
                ]),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 80, vertical: 18),
              child: Text('Login'),
            ),
          ),
          Container(
            color: Colors.black,
            alignment: Alignment.topCenter,
            transform: Matrix4.skewX(0.3),
            child: Container(
              padding: EdgeInsets.all(10),
              child: Text('transform skewX'),
              color: Colors.yellow,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 50,
              color: Colors.red,
              child: Transform.translate(
                offset: Offset(-20, 20),
                child: Text('translate'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 50,
              color: Colors.red,
              child: Transform.rotate(
                angle: 45,
                child: Text('rotate'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 50,
              color: Colors.red,
              child: Transform.scale(
                scale: 1.5,
                child: Text('scale'),
              ),
            ),
          ),
          Wrap(
            direction: Axis.horizontal,
            spacing: 4.0,
            children: [
              avatar,
              ClipOval(
                child: avatar,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: avatar,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    widthFactor: 0.5,
                    child: avatar,
                  ),
                  Text('哎嘿 你好')
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipRect(
                    child: Align(
                      alignment: Alignment.topLeft,
                      widthFactor: 0.5,
                      child: avatar,
                    ),
                  ),
                  Text('哎嘿 你好')
                ],
              )
            ],
          )
        ],
      )),
    );
  }
}
