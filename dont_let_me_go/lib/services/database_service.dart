import 'package:dont_let_me_go/models/food.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sortedmap/sortedmap.dart';

class DatabaseService {
  DatabaseService._();
  static final DatabaseService db = DatabaseService._();
  static Database? _database;

  Future<Database?> get database async{
    if(_database != null){
      return _database;
    }
    _database = await initDB();
    return _database;
  }

  initDB() async{
    return await openDatabase(
      join(await getDatabasesPath(), 'food_database.db'),
      onCreate: (db, version) async {
        await db.execute('CREATE TABLE foodToExpire(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, type TEXT, expirationDate TEXT)');
      },
      version: 1,
    );
  }

  //INSERT FOOD TO DATABASE
  insertFood(Food food) async {
    final db = await database;
    var res = await db!.rawInsert('INSERT INTO foodToExpire (name, type, expirationDate) VALUES (?, ?, ?)',
      [food.name, food.type, food.expirationDate]
    );
    return res;
  }

  Future<List<Food>> listOfFood() async {
    final db = await database;

    // Query the table for all The Food.
    final List<Map<String, dynamic>> maps = await db!.query('foodToExpire');

    // Convert the List<Map<String, dynamic> into a List<Food>.
    return List.generate(maps.length, (i) {
      return Food(
        type: maps[i]['type'],
        name: maps[i]['name'],
        expirationDate: maps[i]['expirationDate'],
      );
    });
  }

  deleteFood(Food food) async {
    final db = await database;
    var res = await db!.rawDelete('DELETE FROM foodToExpire WHERE (name = ? AND type = ? AND expirationDate = ?)',
        [food.name, food.type, food.expirationDate]
    );
    return res;
  }
}