import 'package:get_storage/get_storage.dart';

class JwtStorage {
  static final _box = GetStorage();
  static const _tokenKey = 'jwt_token';

  static Future<void> saveToken(String token) async {
    await _box.write(_tokenKey, token);
  }

  static String? getToken() {
    return _box.read(_tokenKey);
  }

  static Future<void> clearToken() async {
    await _box.remove(_tokenKey);
  }
}
