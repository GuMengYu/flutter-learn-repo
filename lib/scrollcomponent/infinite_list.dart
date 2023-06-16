import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class InfiniteList extends StatefulWidget {
  const InfiniteList({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _InfiniteListState();
}

class _InfiniteListState extends State<InfiniteList> {
  static const loadingTag = "###loading###";
  var _words = <String>[loadingTag];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _retrieveData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('无限滚动列表')),
        body: Column(
          children: [
            ListTile(
              title: Text('人员列表'),
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  print('build item ${index}');
                  if (_words[index] == loadingTag) {
                    if (_words.length - 1 < 100) {
                      _retrieveData();
                      return Container(
                        padding: const EdgeInsets.all(16.0),
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: 24.0,
                          height: 24.0,
                          child: CircularProgressIndicator(strokeWidth: 2.0),
                        ),
                      );
                    } else {
                      //已经加载了100条数据，不再获取数据。
                      return Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          "没有更多了",
                          style: TextStyle(color: Colors.grey),
                        ),
                      );
                    }
                  }
                  //显示单词列表项
                  return ListTile(title: Text(_words[index]));
                },
                itemCount: _words.length,
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(height: .0);
                },
              ),
            ),
          ],
        ));
  }

  void _retrieveData() {
    Future.delayed(Duration(seconds: 5)).then((e) {
      setState(() {
        //重新构建列表
        _words.insertAll(
          _words.length - 1,
          //每次生成20个单词
          generateWordPairs().take(20).map((e) => e.asPascalCase).toList(),
        );
      });
    });
  }
}
