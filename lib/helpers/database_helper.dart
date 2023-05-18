import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as p;

import '../classes/robot_match.dart';

abstract class DBHelper {
  static Future<void> addRobot(RobotMatch robot) async {
    final database = await initDatabase();

    await database.insert(
      'robots',
      robot.toMap(),
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
  }

  static Future<void> editRobot(RobotMatch robot, String previousId) async {
    final database = await initDatabase();

    await database.update(
      'robots',
      robot.toMap(),
      where: 'id = ?',
      whereArgs: [previousId],
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
  }

  static Future<void> deleteRobot(RobotMatch robot) async {
    final database = await initDatabase();

    await database.delete(
      'robots',
      where: 'id = ?',
      whereArgs: [robot.id],
    );
  }

  static Future<List<Map<String, dynamic>>> getRobotsData() async {
    final database = await initDatabase();
    return database.query('robots');
  }

  static Future<sql.Database> initDatabase() async {
    final dbPath = await sql.getDatabasesPath();

    return sql.openDatabase(
      p.join(dbPath, 'robots_database.db'),
      onCreate: (db, version) {
        return db.execute(
          '''
          CREATE TABLE robots(
            id TEXT PRIMARY KEY,
            teamNumber INTEGER,
            matchNumber INTEGER,
            allianceId TEXT,
            autoPositionId TEXT,
            autoTopScored INTEGER,
            autoMiddleScored INTEGER,
            autoBottomScored INTEGER,
            leftCommunity BOOLEAN,
            docked BOOLEAN,
            engaged BOOLEAN,
            teleopTopScored INTEGER,
            teleopMiddleScored INTEGER,
            teleopBottomScored INTEGER,
            takingMoreFromDoubleSubstation BOOLEAN,
            coopBonus BOOLEAN,
            wasDefended BOOLEAN,
            floorPickupId TEXT,
            dockingTimer INTEGER,
            finalStatusId TEXT,
            allianceRobots INTEGER,
            driverSkillId TEXT,
            speedRating INTEGER,
            missedPieces INTEGER,
            died BOOLEAN,
            tippy BOOLEAN,
            errorFoul BOOLEAN,
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
}
