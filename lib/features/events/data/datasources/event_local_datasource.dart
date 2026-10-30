import 'package:sqflite/sqflite.dart';

import '../../domain/entities/event.dart';
import 'package:mixis/core/database/database_helper.dart';

class EventLocalDataSource {
  EventLocalDataSource({DatabaseHelper? helper}) : _helper = helper ?? DatabaseHelper.instance;
  final DatabaseHelper _helper;

  Future<List<Event>> getAll() async {
    final db = await _helper.database;
    final rows = await db.query('events', orderBy: 'creation DESC');
    return rows.map(Event.fromMap).toList();
  }

  Future<Event?> getByCode(String code) async {
    final db = await _helper.database;
    final rows = await db.query('events', where: 'code = ?', whereArgs: [code], limit: 1);
    if (rows.isEmpty) return null;
    return Event.fromMap(rows.first);
  }

  Future<void> insert(Event event) async {
    final db = await _helper.database;
    await db.insert('events', event.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> update(Event event) async {
    final db = await _helper.database;
    await db.update('events', event.toMap(), where: 'code = ?', whereArgs: [event.code]);
  }

  Future<void> delete(String code) async {
    final db = await _helper.database;
    await db.delete('events', where: 'code = ?', whereArgs: [code]);
  }
}
