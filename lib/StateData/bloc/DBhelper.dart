import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static Database? _database;
  static const String tableName = 'BigChart';

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }

  Future<Database> initDB() async {
    final path = await getDatabasesPath();
    final dbPath = join(path, 'soldier.db');

    return await openDatabase(dbPath, version: 1,
        onCreate: (db, version) async {
      await db.execute(
          'CREATE TABLE IF NOT EXISTS $tableName(AIN INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,FoodName TEXT, FoodImage TEXT, SideFoodName TEXT, SideFoodImage TEXT, SideID TEXT, FoodID TEXT, MenuID TEXT,FoodCategory TEXT)');
    });
  }

  Future<int> insertItem(Map<String, dynamic> item) async {
    final db = await database;
    return await db.insert(tableName, item);
  }

  Future<void> updateCart(Map<String, dynamic> item) async {
    final db = await database;
    await db.update(
      tableName,
      item,
      where: 'AIN = ?',
      whereArgs: [
        item['AIN'],
      ],
    );
  }

  Future<int> deleteItem(int? id) async {
    final db = await database;
   return await db.delete(tableName, 
    where: 'AIN = ?', whereArgs: [id]);
  }

  Future<List<Map<String, dynamic>>> getCart() async {
    final db = await database;
    return await db.query(tableName);
  }
}