import 'package:shared_preferences/shared_preferences.dart';

class LocalService {
  const LocalService({required this.prefs});

  final SharedPreferences prefs;

  final String _cache = 'token';

  Future<void> save(String token) async {
    await prefs.setString(_cache, token);
  }

  String? getToken() => prefs.getString(_cache);
}
