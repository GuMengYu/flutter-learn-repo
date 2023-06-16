import 'package:flutter/material.dart';

// class CustomScrollViewPage extends StatelessWidget {
//   CustomScrollViewPage({Key? key}) : super(key: key);

//   // SliverFixedExtentList 是一个 Sliver，它可以生成高度相同的列表项。
//   // 再次提醒，如果列表项高度相同，我们应该优先使用SliverFixedExtentList
//   // 和 SliverPrototypeExtentList，如果不同，使用 SliverList.
//   Widget listView = SliverFixedExtentList(
//     itemExtent: 56,
//     delegate: SliverChildBuilderDelegate(
//         (_, index) => ListTile(
//               title: Text("${index}"),
//             ),
//         childCount: 10),
//   );
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('组合可滚动组件')),
//       body: CustomScrollView(slivers: [listView, listView]),
//     );
//   }
// }

class CustomScrollViewPage extends StatelessWidget {
  CustomScrollViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: ThemeMode.dark,
      home: CustomScrollView(slivers: [
        SliverAppBar(
          pinned: true,
          expandedHeight: 128,
          flexibleSpace: FlexibleSpaceBar(
            title: const Text('Demo'),
            centerTitle: false,
            background: Image.asset(
              'assets/images/wallhaven-j3e3ry.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverPersistentHeader(
            pinned: true,
            delegate: SliverHeaderDelegate(
                child: Container(
                  color: Colors.blue.shade300,
                  child: Text('header 1'),
                  alignment: Alignment.centerLeft,
                ),
                minHeight: 56,
                maxHeight: 128)),
        SliverPadding(
          padding: const EdgeInsets.all(8.0),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 4),
            delegate: SliverChildBuilderDelegate((context, index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.cyan[100 * (index % 9)],
                child: Text(
                  'grid item $index',
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
              );
            }, childCount: 30),
          ),
        ),
        SliverPersistentHeader(
            pinned: true,
            delegate: SliverHeaderDelegate(
                child: Container(
                  color: Colors.blue.shade300,
                  child: Text('header 2'),
                  alignment: Alignment.centerLeft,
                ),
                minHeight: 56,
                maxHeight: 56)),
        SliverFixedExtentList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return Container(
                alignment: Alignment.center,
                color: Colors.lightBlue[100 * (index % 9)],
                child: Text(
                  'list item $index',
                  textScaleFactor: 0.2,
                ));
          }, childCount: 20),
          itemExtent: 56,
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 300,
            child: PageView(children: [
              Center(
                child: Image.asset('assets/images/wallhaven-g732qe.jpg'),
              ),
              Center(child: Image.asset('assets/images/wallhaven-o3k21p.jpg'))
            ]),
          ),
        )
      ]),
    );
  }
}

typedef SliverHeaderBuilder = Widget Function(
    BuildContext context, double shrinkOffset, bool overlapsContent);

class SliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  SliverHeaderDelegate(
      {required this.maxHeight, this.minHeight = 0, required Widget child})
      : builder = ((a, b, c) => child),
        assert(minHeight <= maxHeight && minHeight >= 0);
  SliverHeaderDelegate.fixedHeight({
    required double height,
    required Widget child,
  })  : builder = ((a, b, c) => child),
        maxHeight = height,
        minHeight = height;

//需要自定义builder时使用
  SliverHeaderDelegate.builder({
    required this.maxHeight,
    this.minHeight = 0,
    required this.builder,
  });

  final double maxHeight;
  final double minHeight;
  final SliverHeaderBuilder builder;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    Widget child = builder(context, shrinkOffset, overlapsContent);
    assert(() {
      if (child.key != null) {
        print('${child.key}: shrink: $shrinkOffset，overlaps:$overlapsContent');
      }
      return true;
    }());
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return oldDelegate.maxExtent != maxExtent ||
        oldDelegate.minExtent != minExtent;
  }
}
