import 'package:flutter/material.dart';

class ScaleAnimationRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ScaleAnimationRoute();
  }
}

class _ScaleAnimationRoute extends State<ScaleAnimationRoute>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;
  late CurvedAnimation curve;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 5));
    curve = CurvedAnimation(parent: controller, curve: Curves.bounceIn);
    animation = Tween(begin: 0.0, end: 300.0).animate(curve);

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('简单的缩放动画'),
      ),
      // body: Center(
      //     child: AnimatedBuilder(
      //   animation: animation,
      //   child: Image.asset('assets/images/wallhaven-o3k21p.jpg'),
      //   builder: (context, child) {
      //     return Center(
      //       child: SizedBox(
      //         height: animation.value,
      //         width: animation.value,
      //         child: child,
      //       ),
      //     );
      //   },
      // )),
      body: GrowTranstion(
        animation: animation,
        child: Image.asset('assets/images/wallhaven-o3k21p.jpg'),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }
}

class AnimateImage extends AnimatedWidget {
  const AnimateImage({Key? key, required Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;

    return Image.asset(
      'assets/images/wallhaven-o3k21p.jpg',
      width: animation.value,
      height: animation.value,
    );
  }
}

class GrowTranstion extends StatelessWidget {
  const GrowTranstion(
      {super.key, required this.animation, required this.child});

  final Widget child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: AnimatedBuilder(
      child: child,
      animation: animation,
      builder: (context, child) {
        return SizedBox(
          height: animation.value,
          width: animation.value,
          child: child,
        );
      },
    ));
  }
}
