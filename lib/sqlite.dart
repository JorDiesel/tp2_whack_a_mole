import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:tp1_whack_a_mole/models/player.dart';

class Sqlite {
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE players(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        date DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
        name TEXT NOT NULL,
        score INT NOT NULL
      )
      """);
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      join(await sql.getDatabasesPath(), 'whackAMole.db'),
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  //Insert
  static Future<int> createScore(String name, int score) async {
    final db = await Sqlite.db();

    final data = {'name': name, 'score': score};
    final id = await db.insert('players', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  //Select all
  static Future<List<Player>> getPlayers() async {
    final db = await Sqlite.db();

    final List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM players ORDER BY score DESC");

    return List.generate(maps.length, (i) {
      return Player(
        id: maps[i]['id'],
        name: maps[i]['name'],
        date: DateTime.parse(maps[i]['date']),
        score: maps[i]['score']
      );
    });
  }

  //Select one
  static Future<bool> getSinglePlayer(int score, String name) async {
    final db = await Sqlite.db();
    final List<Map<String, dynamic>> maps = await db.rawQuery('SELECT * FROM players WHERE score=? AND name=?', [score, name]);

    if(maps.length >= 1){
      return true;
    }
    return false;
    }

  //Update
  static Future<int> updatePlayer(
      int id, String name, int score) async {
    final db = await Sqlite.db();

    final data = {
      'score': score,
      'name': name,
      'date': DateTime.now().toString()
    };

    final result =
    await db.update('players', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  //Delete
  static Future<void> deletePlayer(int id) async {
    final db = await Sqlite.db();
    try {
      await db.delete("players", where: 'id=?', whereArgs: [id]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }
}