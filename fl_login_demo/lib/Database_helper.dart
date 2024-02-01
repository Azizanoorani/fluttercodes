import 'dart:ffi';

import 'package:fl_login_demo/Lion.dart';
import 'package:fl_login_demo/ListView.builder.dart';
import 'package:fl_login_demo/WildAnimals.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqflite.dart';

import 'MyFlutterApp.dart';

class DatabaseHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE AnimalType(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        TypeName TEXT,
        Icon TEXT,
        Description TEXT,
        isDelete boolean
      )""");
    await database.execute("""CREATE TABLE Animal(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        AnimalTypeId Integer,
        Name TEXT,
        Icon String,
        MinimumWeight Integer,
        MaximumWeight Integer,
        AverageWeight Integer,
        isDelete boolean,
         FOREIGN KEY(AnimalTypeId) REFERENCES AnimalType(id)
      
      )""");
    await database.execute("""CREATE TABLE AnimalImages(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        AnimalId Integer,
       ImagePath String,
        isDelete boolean,
         FOREIGN KEY(AnimalId) REFERENCES Animal(id)
      
      )""");
    await database.execute("""CREATE TABLE SegmentedButton(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        AnimalId Integer,
        Name Text,
        DisplayIndex Integer,
       Description Text,
        isDelete boolean,
         FOREIGN KEY(AnimalId) REFERENCES Animal(id)
      
      )""");
  }

  static Future<sql.Database> db() async {
      // Set the path to the database.
    return sql.openDatabase(
      'Foxy.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
        await _insert(database);
      },
    );
  }
 static _insert(sql.Database database)async{
    int wildAnimalTypeId = await createAnimalType("Wild Animals","fox",false);
    int domesticAnimalTypeId = await createAnimalType(" Domestic Animals", "cat", false);
    int birdAnimalTypeId = await  createAnimalType("Birds","gauge",false);
    int reptileAnimalTypeId = await createAnimalType("Reptiles","snake",false);
    int seacreaturesAnimalTypeId = await createAnimalType("sea creatures","fox",false);
    createAnimal("Lion", "lion", 170 as Int32?, 250 as Int32?,200 as Int32? , false);
    createAnimal("Tiger" , "lion", 170 as Int32?, 250 as Int32?,200 as Int32? , false);
    createAnimal("Fox", "lion", 170 as Int32?, 250 as Int32?,200 as Int32? , false);
    createAnimal("Cheetah", "lion", 170 as Int32?, 250 as Int32?,200 as Int32? , false);
    //createAnimalImage("lion", lionImages as Text?, false);
  }

  static Future<int> createAnimalType(String? Typename, String? IconData,bool? isdeleted) async {
    final db = await DatabaseHelper.db();
    final data = {'TypeName': Typename, 'IconData': IconData,'isdelete':isdeleted};
    final id = await db.insert('AnimalType', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }
  static Future<List<Map<String, dynamic>>> getAnimalTypes() async {
    final db = await DatabaseHelper.db();
    return db.query('AnimalType', orderBy: "id");
  }
  static Future<List<Map<String, dynamic>>> getAnimalType(int id) async {
    final db = await DatabaseHelper.db();
    return db.query('AnimalType', where: "id = ?", whereArgs: [id], limit: 1);
  }
  static Future<int> createAnimal(String? Typename, String? Icon,Int32? MinimumWeight,Int32? MaximumWeight,Int32? AverageWeight,bool? isdeleted) async {
    final db = await DatabaseHelper.db();
    final data = {'Typename': Typename, 'description': Icon,'MinimumWeight':MinimumWeight,'AverageWeight':AverageWeight,'MaximumWeight':MaximumWeight,'isdelete':isdeleted};
    final id = await db.insert('Animal', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }
  static Future<List<Map<String, dynamic>>> getAnimals() async {
    final db = await DatabaseHelper.db();
    return db.query('Animals', orderBy: "id");
  }
  static Future<List<Map<String, dynamic>>> getAnimal(int id) async {
    final db = await DatabaseHelper.db();
    return db.query('Animal', where: "id = ?", whereArgs: [id], limit: 1);
  }
  static Future<int> createAnimalImage(int? animalId, String? path, bool? isdelete) async {
    final db = await DatabaseHelper.db();
    final data = {'animalId': animalId, 'imagePath': path,'isdelete':isdelete};
    final id = await db.insert('Animal', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }
  static Future<List<Map<String, dynamic>>> getAnimalImages() async {
    final db = await DatabaseHelper.db();
    return db.query('AnimalImages', orderBy: "id");
  }
  static Future<List<Map<String, dynamic>>> getAnimalImage(int id) async {
    final db = await DatabaseHelper.db();
    return db.query('AnimalImage', where: "id = ?", whereArgs: [id], limit: 1);
  }
  static Future<int> createSegemetedbutton(Int? AnimalId, Text? Name,Text?Descipition, bool? isdeleted,Int32?displayIndex) async {
    final db = await DatabaseHelper.db();
    final data = {'AnimalId': AnimalId, 'Name': Name,'Descripition':Descipition,'isdelete':isdeleted,'display':displayIndex};
    final id = await db.insert('Animal', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }
  static Future<List<Map<String, dynamic>>> getSegemetedbuttons() async {
    final db = await DatabaseHelper.db();
    return db.query('segementedbuttons', orderBy: "id");
  }
  static Future<List<Map<String, dynamic>>> getsegementedbutton(int id) async {
    final db = await DatabaseHelper.db();
    return db.query('segementbutton', where: "id = ?", whereArgs: [id], limit: 1);
  }
}