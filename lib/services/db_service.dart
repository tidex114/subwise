// 1. Import necessary packages
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart'; // Provides SQLite API
import 'package:path/path.dart'; // Helps join paths correctly on all platforms
import '../models/subscription.dart'; // Import your custom Subscription model

class DBService {
  static final DBService instance = DBService._init();

  DBService._init();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('subwise.db');
    return _database!;
  }

  Future<Database> _initDB(String fileName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, fileName);

    final exists = await databaseExists(path);
    if (!exists) {
      final data = await rootBundle.load('assets/db/$fileName');
      final bytes = data.buffer.asUint8List();
      await File(path).writeAsBytes(bytes, flush: true);
    }
    print('Using database at: $path');
    return await openDatabase(path);
  }

  Future<void> insertSubscription(Subscription sub) async {
    final db = await instance.database;
    await db.insert(
      'subscriptions',
      sub.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Subscription>> getAllSubscriptions() async {
    final db = await instance.database;
    final result = await db.query('subscriptions');
    print(result);
    return result.map((e) => Subscription.fromMap(e)).toList();
  }

  Future<void> deleteSubscription(String name) async {
    final db = await instance.database;
    await db.delete(
      'subscriptions',
      where: 'name = ?',
      whereArgs: [name],
    );
  }
}
