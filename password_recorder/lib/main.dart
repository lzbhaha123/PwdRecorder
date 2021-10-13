import 'package:flutter/material.dart';
import 'dbhelper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Password Recorder',
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('Password Recorder'),
          ),
        ),
        body: Login(),
      ),
    );
  }
}

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //connectSQL();
    initDB();
    return Text("11111");
  }
}

class EnterPwd {
  String hint;
  String password;
  EnterPwd(this.hint, this.password);
}
