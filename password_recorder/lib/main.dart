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

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late Future<List<Test>> tests;
  @override
  void initState() {
    super.initState();
    tests = Test.tests();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: FutureBuilder(
      future: Test.tests(),
      builder: (BuildContext context, AsyncSnapshot<List<Test>> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return new Text('Press button to start');
          case ConnectionState.waiting:
            return new Text('Awaiting result...');
          default:
            if (snapshot.hasError)
              return new Text('Error');
            else
              return ListView.builder(
                  padding: EdgeInsets.all(10),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Text(snapshot.data![index].info);
                  });
        }
      },
    ));
  }

  /*insertData() async {
    Test t1 = Test(1, "hello");
    await Test.insertTest(t1);
    Test t2 = Test(2, "world");
    await Test.insertTest(t2);
  }*/
}
/*
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
        FutureBuilder(future: Test.tests(),builder: (BuildContext context, AsyncSnapshot<List<Test>> snapshot) {     
          switch (snapshot.connectionState) {
            case ConnectionState.none: return new Text('Press button to start');   
            case ConnectionState.waiting: return new Text('Awaiting result...');  
            default:    
              if (snapshot.hasError)    
                return new Text('Error');
              else    
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
  }
}*/

class EnterPwd {
  String hint;
  String password;
  EnterPwd(this.hint, this.password);
}
