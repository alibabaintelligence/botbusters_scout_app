import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as p;

import '../classes/robot_match.dart';

abstract class DBHelper {
  static Future<void> addMatch(RobotMatch match) async {
    final database = await initDatabase();

    await database.insert(
      'matches',
      match.toSQLMap(),
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
  }

  static Future<void> editMatch(RobotMatch matches, String previousId) async {
    final database = await initDatabase();

    await database.update(
      'matches',
      matches.toSQLMap(),
      where: 'id = ?',
      whereArgs: [previousId],
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
  }

  static Future<void> deleteMatch(RobotMatch matches) async {
    final database = await initDatabase();

    await database.delete(
      'matches',
      where: 'id = ?',
      whereArgs: [matches.id],
    );
  }

  static Future<List<Map<String, dynamic>>> getMatchesData() async {
    final database = await initDatabase();
    return database.query('matches');
  }

  static Future<sql.Database> initDatabase() async {
    final dbPath = await sql.getDatabasesPath();

    return sql.openDatabase(
      p.join(dbPath, 'matches_database.db'),
      onCreate: (db, version) {
        return db.execute(
          '''
          CREATE TABLE matches(
            id TEXT PRIMARY KEY,
            teamNumber INTEGER,
            matchNumber INTEGER,
            allianceId TEXT,
            leftCommunity BOOLEAN,
            autoCoralL1 INTEGER,
            autoCoralL2 INTEGER,
            autoCoralL3 INTEGER,
            autoCoralL4 INTEGER,
            autoAlgaeProcessor INTEGER,
            autoAlgaeNet INTEGER,
            teleopCoralL1 INTEGER,
            teleopCoralL2 INTEGER,
            teleopCoralL3 INTEGER,
            teleopCoralL4 INTEGER,
            teleopAlgaeProcessor INTEGER,
            teleopAlgaeNet INTEGER,
            bargeId TEXT,
            yellowCard BOOLEAN,
            redCard BOOLEAN,
            yellowCardMotive TEXT,
            redCardMotive TEXT,
            coralPickupId TEXT,
            died BOOLEAN,
            tippy BOOLEAN,
            mechFail BOOLEAN,
            defense BOOLEAN,
            comment TEXT,
            scoutId TEXT,
            scoutName TEXT,
            dateTimeCreated TEXT
          )''',
        );
      },
      version: 1,
    );
  }

  static Future<void> deleteDatabase() async {
    final dbPath = await sql.getDatabasesPath();

    return sql.deleteDatabase(
      p.join(dbPath, 'matches_database.db'),
    );
  }
}
