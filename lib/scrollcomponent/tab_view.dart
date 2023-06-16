import 'package:flutter/material.dart';
import 'package:my_app/scrollcomponent/keep_alive_wrapper.dart';

class TabViewPage extends StatefulWidget {
  const TabViewPage({Key? key}) : super(key: key);

  @override
  _TabViewPageState createState() => _TabViewPageState();
}

class _TabViewPageState extends State<TabViewPage>
    with SingleTickerProviderStateMixin {
  final tabs = <String>["新闻", "历史", "图片"];

  // late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('TabBar View'),
          bottom: TabBar(
            tabs: tabs.map((e) => Text("${e}")).toList(),
          ),
        ),
        body: TabBarView(
          children: tabs
              .map((e) => KeepAliveWrapper(
                      child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      "$e",
                      textScaleFactor: 8,
                    ),
                  )))
              .toList(),
        ),
      ),
    );
  }

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   super.dispose();
  //   _tabController.dispose();
  // }
}
