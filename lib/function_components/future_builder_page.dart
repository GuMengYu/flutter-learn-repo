import 'package:flutter/material.dart';

class FutureBuilderPage extends StatelessWidget {
  const FutureBuilderPage({Key? key}) : super(key: key);

  Future asyncData() {
    return Future.delayed(Duration(seconds: 3), () => "模拟网络加载的文本");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Future Builder")),
        body: Container(
          alignment: Alignment.center,
          child: FutureBuilder(
            future: asyncData(),
            initialData: "placeholder",
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return Text('Error ${snapshot.error}');
                } else {
                  return Text("Content ${snapshot.data}");
                }
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        ));
  }
}
