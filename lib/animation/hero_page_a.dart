import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HeroPageA extends StatelessWidget {
  const HeroPageA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('路由A'),
      ),
      body: Container(
        alignment: Alignment.centerLeft,
        child: Column(children: [
          InkWell(
            child: Hero(
              tag: 'avatar',
              child: ClipOval(
                child: Image.asset(
                  "assets/images/wallhaven-o3k21p.jpg",
                  width: 100.0,
                  height: 100.0,
                ),
              ),
            ),
            onTap: () {
              context.push('/animation/hero/b');
            },
          )
        ]),
      ),
    );
  }
}
