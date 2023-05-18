import 'package:botbusters_scout_app/helpers/database_helper.dart';
import 'package:flutter/material.dart';

import '../classes/robot_match.dart';

class RobotsProvider with ChangeNotifier {
  List<RobotMatch> _robots = [];

  List<RobotMatch> get robots => [..._robots];

  Future<void> addRobot(RobotMatch robot) async {
    await DBHelper.addRobot(robot);
    _robots.add(robot);
    notifyListeners();
  }

  Future<void> editRobot(RobotMatch newRobot, String previousId) async {
    await DBHelper.editRobot(newRobot, previousId);
    final previousRobot = _robots.firstWhere((rob) => rob.id == previousId);

    final previousRobotIndex = _robots.indexOf(previousRobot);

    _robots[previousRobotIndex] = newRobot;
    notifyListeners();
  }

  Future<void> fetchAndSetRobots() async {
    final robotsDataList = await DBHelper.getRobotsData();

    _robots = robotsDataList
        .map(
          (robotMap) => RobotMatch(
            id: robotMap['id'],
            teamNumber: robotMap['teamNumber'],
            matchNumber: robotMap['matchNumber'],
            allianceId: robotMap['allianceId'],
            autoPositionId: robotMap['autoPositionId'],
            autoTopScored: robotMap['autoTopScored'],
            autoMiddleScored: robotMap['autoMiddleScored'],
            autoBottomScored: robotMap['autoBottomScored'],
            leftCommunity: robotMap['leftCommunity'] == 0 ? false : true,
            docked: robotMap['docked'] == 0 ? false : true,
            engaged: robotMap['engaged'] == 0 ? false : true,
            teleopTopScored: robotMap['teleopTopScored'],
            teleopMiddleScored: robotMap['teleopMiddleScored'],
            teleopBottomScored: robotMap['teleopBottomScored'],
            takingMoreFromDoubleSubstation:
                robotMap['takingMoreFromDoubleSubstation'] == 0 ? false : true,
            coopBonus: robotMap['coopBonus'] == 0 ? false : true,
            wasDefended: robotMap['wasDefended'] == 0 ? false : true,
            floorPickupId: robotMap['floorPickupId'],
            dockingTimer: robotMap['dockingTimer'],
            finalStatusId: robotMap['finalStatusId'],
            allianceRobots: robotMap['allianceRobots'],
            driverSkillId: robotMap['driverSkillId'],
            speedRating: robotMap['speedRating'],
            missedPieces:
                robotMap['missedPieces'], // ! WE CHANGED FROM BOOL TO INT
            died: robotMap['died'] == 0 ? false : true,
            tippy: robotMap['tippy'] == 0 ? false : true,
            errorFoul: robotMap['errorFoul'] == 0 ? false : true,
            mechFail: robotMap['mechFail'] == 0 ? false : true,
            defense: robotMap['defense'] == 0 ? false : true,
            comment: robotMap['comment'],
            scoutId: robotMap['scoutId'],
            scoutName: robotMap['scoutName'],
            dateTimeCreated: DateTime.tryParse(robotMap['dateTimeCreated']) ??
                DateTime.now(),
          ),
        )
        .toList();

    notifyListeners();
  }
}
