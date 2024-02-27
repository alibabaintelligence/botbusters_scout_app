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
            autoPositionId TEXT,
            autoTopScored INTEGER,
            autoMiddleScored INTEGER,
            autoBottomScored INTEGER,
            leftCommunity BOOLEAN,
            autoAmpNotes INTEGER,
            autoSpeakerNotes INTEGER,
            teleopSpeakerNotes INTEGER,
            teleopSpeakerNotesX2 INTEGER,
            teleopAmpNotes INTEGER,
            parked BOOLEAN,
            onstage BOOLEAN,
            notePickupId TEXT,
            spotlight1Id TEXT,
            spotlight2Id TEXT,
            spotlight3Id TEXT,
            noteInTrap BOOLEAN,
            yellowCard BOOLEAN,
            redCard BOOLEAN,
            yellowCardMotive TEXT,
            redCardMotive TEXT,
            driverSkillId TEXT,
            speedRating INTEGER,
            missedPieces INTEGER,
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
