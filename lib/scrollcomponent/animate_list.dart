import 'package:flutter/material.dart';

class AnimateList extends StatefulWidget {
  const AnimateList({Key? key}) : super(key: key);

  @override
  _AnimateListState createState() => _AnimateListState();
}

class _AnimateListState extends State<AnimateList> {
  final globalKey = GlobalKey<AnimatedListState>();

  var data = <String>[];
  int counter = 5;
  @override
  void initState() {
    for (var i = 0; i < counter; i++) {
      data.add("${i + 1}");
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AnimatedList')),
      body: AnimatedList(
        initialItemCount: data.length,
        key: globalKey,
        itemBuilder: (context, index, animation) {
          print(animation);
          return FadeTransition(
            opacity: animation,
            child: buildItem(context, index),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          data.add("${++counter}");
          globalKey.currentState?.insertItem(data.length - 1);
          print('添加item ${counter}');
        },
      ),
    );
  }

  Widget buildItem(context, index) {
    String char = data[index];
    return ListTile(
      key: ValueKey(char),
      title: Text(char),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: () {
          onDelete(context, index);
        },
      ),
    );
  }

  onDelete(context, index) {
    setState(() {
      globalKey.currentState!.removeItem(
        index,
        (context, animation) {
          // 删除过程执行的是反向动画，animation.value 会从1变为0
          var item = buildItem(context, index);
          print('删除 ${data[index]}');
          data.removeAt(index);
          // 删除动画是一个合成动画：渐隐 + 收缩列表项
          return FadeTransition(
            opacity: CurvedAnimation(
              parent: animation,
              //让透明度变化的更快一些
              curve: const Interval(0.9, 1.0),
            ),
            // 不断缩小列表项的高度
            child: SizeTransition(
              sizeFactor: animation,
              axisAlignment: 0.0,
              child: item,
            ),
          );
        },
        duration: Duration(milliseconds: 1200), // 动画时间为 200 ms
      );
    });
  }
}
