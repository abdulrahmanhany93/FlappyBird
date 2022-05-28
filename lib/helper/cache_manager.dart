import 'package:shared_preferences/shared_preferences.dart';

class CachManager {
  static SharedPreferences? sharedPref;
  static Future<void> initialize() async {
    sharedPref = await SharedPreferences.getInstance();
  }

  static Future<void> cacheScore(int highScore) async {
    /// save high score
    await sharedPref!.setInt('HighScore', highScore);
  }

  static int? getHighScore() {
    /// get high score
    return sharedPref!.getInt('HighScore');
  }
}
