import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  const AlertPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dialog'),
      ),
      body: Center(
          child: Column(
        children: [
          ElevatedButton(
              onPressed: () async {
                bool? delete = await showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('提示'),
                        content: Text('提示内容提示内容提示内容提示内容'),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('取消')),
                          FilledButton(
                              onPressed: () {
                                Navigator.of(context).pop(true);
                              },
                              child: Text('确认'))
                        ],
                      );
                    });
                if (delete == null) {
                  print('取消了');
                } else {
                  print('确认了');
                }
              },
              child: Text('对话框1'))
        ],
      )),
    );
  }
}
