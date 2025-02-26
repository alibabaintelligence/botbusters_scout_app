import 'package:hive_flutter/hive_flutter.dart';
import '../models/robot_match.dart';

class RobotsDatabase {
  static const String boxName = 'robot_matches';
  late Box<RobotMatch> _box;

  Future<void> init() async {
    await Hive.initFlutter();
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(RobotMatchAdapter());
    }
    _box = await Hive.openBox<RobotMatch>(boxName);
  }

  Future<List<RobotMatch>> getAllMatches() async {
    return _box.values.toList();
  }

  Future<void> addMatch(RobotMatch match) async {
    await _box.put(match.id, match);
  }

  Future<void> editMatch(RobotMatch match, String previousId) async {
    if (previousId != match.id) {
      await _box.delete(previousId);
    }
    await _box.put(match.id, match);
  }

  Future<void> deleteMatch(String id) async {
    await _box.delete(id);
  }

  Future<void> deleteAllMatches() async {
    await _box.clear();
  }
} 