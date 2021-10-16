import 'package:flutter/material.dart';
import 'package:password_recorder/class/test.dart';
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
    //DbHelper dbh = DbHelper();
    //dbh.initDB();
    //print(dbh.getData("select * from enter"));
    
    //List<Test> tests = readData();

    insertData();
    
    return Container(
      child:
        FutureBuilder(future: Test.tests(),builder: (BuildContext context, AsyncSnapshot<List<Test>> snapshot) {      //snapshot就是_calculation在时间轴上执行过程的状态快照
          switch (snapshot.connectionState) {
            case ConnectionState.none: return new Text('Press button to start');    //如果_calculation未执行则提示：请点击开始
            case ConnectionState.waiting: return new Text('Awaiting result...');  //如果_calculation正在执行则提示：加载中
            default:    //如果_calculation执行完毕
              if (snapshot.hasError)    //若_calculation执行出现异常
                return new Text('Error');
              else    //若_calculation执行正常完成
                return ListView.builder(
                  padding: EdgeInsets.all(10),
                  itemCount: snapshot.data?.length,
                  itemBuilder: (BuildContext context, int index){
                    return Text(snapshot.data?[index].info ?? '');
                  }
                );
          }
        },
        
        )
      
    );
    
  }


  insertData() async {
    Test t1 = Test(1,"hello");
    await Test.insertTest(t1);
    Test t2 = Test(2,"world");
    await Test.insertTest(t2);
    print(await Test.tests());
  }
}

class EnterPwd {
  String hint;
  String password;
  EnterPwd(this.hint, this.password);
}
