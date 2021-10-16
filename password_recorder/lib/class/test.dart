import 'package:sqflite/sqlite_api.dart';

import '../dbhelper.dart';

class Test{
  int id;
  String info;
  Test(this.id,this.info);
  Map<String,dynamic> toMap(){
    return{
      'info':info
    };
  }
  @override
  String toString(){
    return 'Test{id:$id, info:$info}';
  }

  static insertTest(var test) async{
    Database db = await DbHelper().getDatabase();
    await db.insert('test',test.toMap());
    db.close();
  }

  static Future<List<Test>> tests() async {
    Database db = await DbHelper().getDatabase();
    final List<Map> maps = await db.query('test');
    
    return List.generate(maps.length, (i) {
      return Test(maps[i]['id'],maps[i]['info']); 
    });
  }
}