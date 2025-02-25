import 'package:botbusters_scout_app/helpers/database_helper.dart';
import 'package:flutter/material.dart';

import '../classes/robot_match.dart';

class RobotsProvider with ChangeNotifier {
  List<RobotMatch> _matches = [];

  List<RobotMatch> get matches => [..._matches];

  Future<void> addMatch(RobotMatch match) async {
    await DBHelper.addMatch(match);
    _matches.add(match);
    notifyListeners();
  }

  Future<void> editMatch(RobotMatch newMatch, String previousId) async {
    await DBHelper.editMatch(newMatch, previousId);
    final previousRobot = _matches.firstWhere((rob) => rob.id == previousId);

    final previousRobotIndex = _matches.indexOf(previousRobot);

    _matches[previousRobotIndex] = newMatch;
    notifyListeners();
  }

  Future<void> deleteMatch(RobotMatch match) async {
    await DBHelper.deleteMatch(match);

    _matches.remove(match);

    print('match removed :D!');
  }

  Future<void> fetchAndSetRobots() async {
    final robotsDataList = await DBHelper.getMatchesData();

    _matches = robotsDataList
        .map(
          (robotMap) => RobotMatch(
            id: robotMap['id'],
            teamNumber: robotMap['teamNumber'],
            matchNumber: robotMap['matchNumber'],
            allianceId: robotMap['allianceId'],
            leftCommunity: robotMap['leftCommunity'] == 0 ? false : true,
            autoCoralL1: robotMap['autoCoralL1'], // !
            autoCoralL2: robotMap['autoCoralL2'], // !
            autoCoralL3: robotMap['autoCoralL3'], // !
            autoCoralL4: robotMap['autoCoralL4'], // !
            autoAlgaeProcessor: robotMap['autoAlgaeProcessor'], // !
            autoAlgaeNet: robotMap['autoAlgaeNet'], // !
            teleopCoralL1: robotMap['teleopCoralL1'], // !
            teleopCoralL2: robotMap['teleopCoralL2'], // !
            teleopCoralL3: robotMap['teleopCoralL3'], // !
            teleopCoralL4: robotMap['teleopCoralL4'], // !
            teleopAlgaeProcessor: robotMap['teleopAlgaeProcessor'], // !
            teleopAlgaeNet: robotMap['teleopAlgaeNet'], // !
            bargeId: robotMap['bargeId'],
            yellowCard: robotMap['yellowCard'] == 0 ? false : true,
            redCard: robotMap['redCard'] == 0 ? false : true,
            yellowCardMotive: robotMap['yellowCardMotive'],
            redCardMotive: robotMap['redCardMotive'],
            coralPickupId: robotMap['coralPickupId'], // !
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

  Future<void> deleteEverything() async {
    await DBHelper.deleteDatabase();

    _matches.clear();

    notifyListeners();
  }
}
