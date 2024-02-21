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
            leftCommunity: robotMap['leftCommunity'] == 0 ? false : true,
            autoAmpNotes: robotMap['autoAmpNotes'], // !
            autoSpeakerNotes: robotMap['autoSpeakerNotes'], // !
            teleopAmpNotes: robotMap['teleopAmpNotes'], // !
            teleopAmpNotesX2: robotMap['teleopAmpNotesX2'], // !
            teleopSpeakerNotes: robotMap['teleopSpeakerNotes'], // !
            parked: robotMap['parked'] == 0 ? false : true, // !
            onstage: robotMap['onstage'] == 0 ? false : true, // !
            notePickupId: robotMap['notePickupId'], // !
            spotlight: robotMap['spotlight'] == 0 ? false : true, // !
            noteInTrap: robotMap['noteInTrap'] == 0 ? false : true, // !
            yellowCard: robotMap['yellowCard'] == 0 ? false : true,
            redCard: robotMap['redCard'] == 0 ? false : true,
            yellowCardMotive: robotMap['yellowCardMotive'],
            redCardMotive: robotMap['redCardMotive'],
            driverSkillId: robotMap['driverSkillId'],
            died: robotMap['died'] == 0 ? false : true,
            tippy: robotMap['tippy'] == 0 ? false : true,
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
