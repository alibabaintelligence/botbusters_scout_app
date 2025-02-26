import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScoutUser {
  ScoutUser(this.id, this.name);

  final String id;
  final String name;
}


class ScoutDataProvider with ChangeNotifier {
  ScoutUser? _scoutUser;

  ScoutUser? get scoutUser => _scoutUser;

  Future<void> tryToRecoverSavedUser() async {
    final prefs = await SharedPreferences.getInstance();

    String? scoutId = prefs.getString('scoutId');
    String? scoutName = prefs.getString('scoutName');

    if (scoutId != null && scoutName != null) {
      _scoutUser = ScoutUser(scoutId, scoutName);

      notifyListeners();
    }
  }

  Future<void> signIn(String scoutId, String scoutName) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString('scoutId', scoutId);
    await prefs.setString('scoutName', scoutName);

    _scoutUser = ScoutUser(scoutId, scoutName);

    notifyListeners();
  }

  Future<void> signOut() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      await prefs.remove('scoutId');
      await prefs.remove('scoutName');

      _scoutUser = null;

      notifyListeners();
    } catch (err) {
      debugPrint(err.toString());
    }
  }
}
