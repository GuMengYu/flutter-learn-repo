import 'package:flutter/material.dart';

class LayoutBuilderPage extends StatelessWidget {
  const LayoutBuilderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _children = List.filled(
        5,
        SizedBox(
          height: 50,
          width: 50,
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.pink, width: 5),
                borderRadius: BorderRadius.all(Radius.circular(2))),
            margin: EdgeInsets.all(2),
          ),
        ));

    return Scaffold(
      appBar: AppBar(title: Text('layout builder')),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        // 限制宽度为190，小于 200
        SizedBox(
          width: 190,
          child: ResponsiveColumn(children: _children),
        ),
        Padding(padding: EdgeInsets.only(top: 50)),
        ResponsiveColumn(children: _children),
      ]),
    );
  }
}

class ResponsiveColumn extends StatelessWidget {
  const ResponsiveColumn({Key? key, required this.children}) : super(key: key);
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      print(constraints.maxWidth);
      if (constraints.maxWidth > 200) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: children,
        );
      } else {
        var _children = <Widget>[];
        for (var i = 0; i < children.length; i += 2) {
          if (i + 1 < children.length) {
            _children.add(Row(
              mainAxisSize: MainAxisSize.min,
              children: [children[i], children[i + 1]],
            ));
          } else {
            _children.add(children[i]);
          }
        }
        print(_children);
        return Column(mainAxisSize: MainAxisSize.min, children: _children);
      }
    });
  }
}
