import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as p;

import '../classes/robot.dart';

abstract class DBHelper {
  static Future<void> addRobot(Robot robot) async {
    final database = await initDatabase();

    await database.insert(
      'robots',
      robot.toMap(),
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
  }

  static Future<void> editRobot(Robot robot, String previousId) async {
    final database = await initDatabase();

    await database.update(
      'robots',
      robot.toMap(),
      where: 'id = ?',
      whereArgs: [previousId],
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
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
            autoTopScored INTEGER,
            autoMiddleScored INTEGER,
            autoBottomScored INTEGER,
            leftCommunity BOOLEAN,
            docked BOOLEAN,
            engaged BOOLEAN,
            teleopTopScored INTEGER,
            teleopMiddleScored INTEGER,
            teleopBottomScored INTEGER,
            teleopLinksScored INTEGER,
            coopBonus BOOLEAN,
            wasDefended BOOLEAN,
            floorPickupId TEXT,
            dockingTimer INTEGER,
            finalStatusId TEXT,
            allianceRobots INTEGER,
            driverSkillId TEXT,
            speedRating INTEGER,
            missedPieces BOOLEAN,
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
