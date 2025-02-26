import 'package:flutter/material.dart';
import '../models/robot_match.dart';
import '../services/robots_database.dart';

class RobotsProvider with ChangeNotifier {
  final RobotsDatabase _database;
  List<RobotMatch> _matches = [];

  RobotsProvider._(this._database);

  static Future<RobotsProvider> initialize() async {
    final database = RobotsDatabase();
    await database.init();
    final provider = RobotsProvider._(database);
    await provider.fetchAndSetRobots();
    return provider;
  }

  List<RobotMatch> get matches => [..._matches];

  Future<void> addMatch(RobotMatch match) async {
    await _database.addMatch(match);
    _matches.add(match);
    notifyListeners();
  }

  Future<void> editMatch(RobotMatch newMatch, String previousId) async {
    await _database.editMatch(newMatch, previousId);
    final previousRobot = _matches.firstWhere((rob) => rob.id == previousId);
    final previousRobotIndex = _matches.indexOf(previousRobot);
    _matches[previousRobotIndex] = newMatch;
    notifyListeners();
  }

  Future<void> deleteMatch(RobotMatch match) async {
    await _database.deleteMatch(match.id);
    _matches.remove(match);
    notifyListeners();
  }

  Future<void> fetchAndSetRobots() async {
    _matches = await _database.getAllMatches();
    notifyListeners();
  }

  Future<void> deleteEverything() async {
    await _database.deleteAllMatches();
    _matches.clear();
    notifyListeners();
  }
}
