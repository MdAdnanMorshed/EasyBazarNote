import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {

  static const _databaseName = "easyBazarNote.db";
  static const _databaseVersion = 1;

  ///------------------ Category Table ---------------
  static const categoryTB = 'category_table';
  static const cId = 'categoryId';
  static const categoryName = 'categoryName';


  ///------------------ Sub Category Table ---------------
  static  const subCategoryTB = 'subCategory_table';
  static const subCid = 'subCategoryId';
  static const subCategoryName = 'subCategoryName';

  ///------------------ Items  Table ---------------
  static  const itemTB = 'items_table';
  static const itemId = 'itemId';
  static const itemName = 'itemName';
  static const itemCategoryName = 'itemCategoryName';
  static const itemSubCategoryName = 'itemSubCategoryName';
  static const itemPrice = 'itemPrice';
  static const updatedAT = 'updatedAT';
  static const updatePerson = 'updatePerson';


  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database?> get database async {
    if (_database != null) return _database;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    print('local path >>$path');
    return await openDatabase(path,
        version: _databaseVersion,
        onCreate: _onCreate,
        onUpgrade: (Database db, int oldV,int newV){

      }
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $categoryTB (
            $cId INTEGER PRIMARY KEY,
            $categoryName TEXT NOT NULL
          )
          ''');
    await db.execute('''
          CREATE TABLE $subCategoryTB (
            $subCid INTEGER PRIMARY KEY,
            $subCategoryName TEXT NOT NULL
          )
          ''');
    await db.execute('''
          CREATE TABLE $itemTB (
            $itemId INTEGER PRIMARY KEY,
            $itemName TEXT NOT NULL,
            $itemCategoryName INTEGER NOT NULL,
            $itemSubCategoryName INTEGER NOT NULL,
            $itemPrice INTEGER NOT NULL,
            $updatedAT INTEGER NOT NULL,
            $updatePerson INTEGER NOT NULL
          )
          ''');

  }


  ///----------------- Category CRUD -------------------
  Future<int> categoryInsert(Map<String, dynamic> row) async {
    Database? db = await instance.database;
    return await db!.insert(categoryTB, row);
  }

  Future<int> categoryUpdate(Map<String, dynamic> row) async {
    Database ?db = await instance.database;
    int id = row[cId];
    return await db!.update(categoryTB, row, where: '$cId = ?', whereArgs: [id]);
  }

  Future<int> categoryDelete(int id) async {
    Database ?db = await instance.database;
    return await db!.delete(categoryTB, where: '$cId = ?', whereArgs: [id]);
  }

  Future<List<Map<String, dynamic>>> categoryGetData() async {
    Database? db = await instance.database;
    return await db!.query(categoryTB);
  }

  ///----------------- Sub Category CRUD -------------------

  Future<int> subCategoryInsert(Map<String, dynamic> row) async {
    Database? db = await instance.database;
    return await db!.insert(subCategoryTB, row);
  }

  Future<int> subCategoryUpdate(Map<String, dynamic> row) async {
    Database ?db = await instance.database;
    int id = row[cId];
    return await db!.update(subCategoryTB, row, where: '$subCid = ?', whereArgs: [id]);
  }

  Future<int> subCategoryDelete(int id) async {
    Database ?db = await instance.database;
    return await db!.delete(subCategoryTB, where: '$subCid = ?', whereArgs: [id]);
  }

  Future<List<Map<String, dynamic>>> subCategoryGetData() async {
    Database? db = await instance.database;
    return await db!.query(subCategoryTB);
  }

  ///----------------- Item  CRUD -------------------

  Future<int> itemInsert(Map<String, dynamic> row) async {
    Database? db = await instance.database;
    return await db!.insert(itemTB, row);
  }

  Future<int> itemUpdate(Map<String, dynamic> row) async {
    Database ?db = await instance.database;
    int id = row[cId];
    return await db!.update(itemTB, row, where: '$itemId = ?', whereArgs: [id]);
  }

  Future<int> itemDelete(int id) async {
    Database ?db = await instance.database;
    return await db!.delete(itemTB, where: '$itemId = ?', whereArgs: [id]);
  }

  Future<List<Map<String, dynamic>>> itemGetData() async {
    Database? db = await instance.database;
    return await db!.query(itemTB);
  }
}

