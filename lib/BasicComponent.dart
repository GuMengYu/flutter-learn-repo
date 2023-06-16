import 'package:flutter/material.dart';

class BasicComponent extends StatefulWidget {
  const BasicComponent({super.key});

  @override
  State<StatefulWidget> createState() => _BasicComponent();
}

class _BasicComponent extends State<BasicComponent> {
  final TextEditingController _selectionController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectionController.text = "hello world";
    _selectionController.selection = TextSelection(
        baseOffset: 2, extentOffset: _selectionController.text.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Basic components')),
      body: Center(
          child: Column(
        children: [
          // TextField(
          //   decoration: InputDecoration(hintText: '请输入文字'),
          //   onChanged: (value) {
          //     print('value onChanged ${value}');
          //   },
          //   onSubmitted: (value) {
          //     print('value onSubmitted ${value}');
          //   },
          //   controller: _selectionController,
          // )
          Login(),
        ],
      )),
    );
  }
}

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Login();
  }
}

class _Login extends State<Login> {
  TextEditingController _unameController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();
  GlobalKey _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        TextFormField(
          autofocus: true,
          controller: _unameController,
          decoration: InputDecoration(
            labelText: "用户名",
            hintText: "用户名或邮箱",
            icon: Icon(Icons.person),
          ),
          // 校验用户名
          validator: (v) {
            return v!.trim().isNotEmpty ? null : "用户名不能为空";
          },
        ),
        TextFormField(
          autofocus: true,
          controller: _pwdController,
          decoration: const InputDecoration(
            labelText: "密码",
            hintText: "密码",
            icon: Icon(Icons.lock),
          ),
          // 校验密码
          validator: (v) {
            return v!.trim().length > 5 ? null : "密码不能少于6位";
          },
        ),
        Padding(
          padding: const EdgeInsets.only(top: 28.0),
          child: Row(
            children: [
              Expanded(
                child: Builder(builder: (context) {
                  return FilledButton(
                      onPressed: () {
                        var formstate = Form.of(context);
                        if (formstate.validate()) {
                          print('valid form submit');
                        }
                      },
                      child: Text('登录'));
                }),
              )
            ],
          ),
        )
      ],
    ));
  }
}
