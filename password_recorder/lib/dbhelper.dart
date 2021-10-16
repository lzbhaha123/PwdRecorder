import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper{
  final dbName = "pwdrc.db";
  final version = 5;
  //static Database? db;

  //void initDB() async{
    //db ??= await getDatabase();
  //}
  Future<Database> getDatabase() async{
    WidgetsFlutterBinding.ensureInitialized();
    return openDatabase(
      join(await getDatabasesPath(), dbName),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE enter(id INTEGER PRIMARY KEY, hint TEXT, password TEXT)'
        );
      },
      onUpgrade: (db,oldVersion,newVersion){
        if (newVersion==2){
          return db.execute(
            'CREATE TABLE test(id INTEGER PRIMARY KEY, info TEXT)'
          );
        }
      },
      version: version,
    );
  }
  
  /*getData(String sql) async {
      return await db?.rawQuery(sql);
  }*/
}

