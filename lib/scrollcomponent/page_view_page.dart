import 'package:flutter/material.dart';
import 'package:my_app/scrollcomponent/keep_alive_wrapper.dart';

class PageViewPage extends StatefulWidget {
  const PageViewPage({Key? key}) : super(key: key);

  @override
  _PageViewPageState createState() => _PageViewPageState();
}

class _PageViewPageState extends State<PageViewPage> {
  @override
  Widget build(BuildContext context) {
    var children = <Widget>[];
    // 生成 6 个 Tab 页
    for (int i = 0; i < 6; ++i) {
      children.add(KeepAliveWrapper(
        child: Page(text: '$i'),
        keepAlive: true,
      ));
    }
    return Scaffold(
      appBar: AppBar(title: const Text('page view')),
      body: PageView(
          pageSnapping: true,
          onPageChanged: (value) {
            print(value);
          },
          children: children),
      bottomNavigationBar:
          NavigationBar(onDestinationSelected: (index) {}, destinations: const [
        NavigationDestination(icon: Icon(Icons.home), label: "Home"),
        NavigationDestination(icon: Icon(Icons.wallet), label: "Translation"),
        NavigationDestination(icon: Icon(Icons.settings), label: "Setting"),
        NavigationDestination(icon: Icon(Icons.face), label: "Profile")
      ]),
    );
  }
}

class Page extends StatefulWidget {
  const Page({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<Page> {
  @override
  Widget build(BuildContext context) {
    print("build ${widget.text}");
    return Center(
      child: Text(
        widget.text,
        textScaleFactor: 5,
      ),
    );
  }
}
