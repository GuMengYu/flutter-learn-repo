import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HeroPageB extends StatelessWidget {
  const HeroPageB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.topCenter,
        child: Column(children: [
          InkWell(
            child: Hero(
              child: Image.asset(
                "assets/images/wallhaven-j3e3ry.png",
              ),
              tag: 'avatar',
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
