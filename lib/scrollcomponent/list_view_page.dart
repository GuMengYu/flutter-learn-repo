import 'package:flutter/material.dart';

class ListViewPage extends StatelessWidget {
  const ListViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //下划线widget预定义以供复用。
    Widget divider1 = Divider(
      color: Colors.blue,
    );
    Widget divider2 = Divider(color: Colors.green);
    return Scaffold(
        appBar: AppBar(
          title: Text('ListView'),
        ),
        body: Center(
          child: Column(children: [
            ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 200),
              child: ListView(
                children: List.filled(
                    50, const Text('I\'m dedicating every day to you')),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 24.0)),
            ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 200),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('$index'),
                  );
                },
                itemCount: 100,
                itemExtent: 50.0,
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 24.0)),
            ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 200),
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('$index'),
                  );
                },
                itemCount: 100,
                separatorBuilder: (context, index) {
                  return index % 2 == 0 ? divider1 : divider2;
                },
              ),
            ),
          ]),
        ));
  }
}
