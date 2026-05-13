import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {

  static Future saveUser({
    required String name,
    required String email,
    required String password,
    required String phone,
    String image = '',
  }) async {

    final prefs = await SharedPreferences.getInstance();

    await prefs.setString('name', name);
    await prefs.setString('email', email);
    await prefs.setString('password', password);
    await prefs.setString('phone', phone);
    await prefs.setString('image', image);
  }

  static Future<Map<String, String>> getUser() async {

    final prefs = await SharedPreferences.getInstance();

    return {
      'name': prefs.getString('name') ?? '',
      'email': prefs.getString('email') ?? '',
      'password': prefs.getString('password') ?? '',
      'phone': prefs.getString('phone') ?? '',
      'image': prefs.getString('image') ?? '',
    };
  }

  static Future logout() async {

  final prefs =
      await SharedPreferences.getInstance();

  await prefs.setBool('isLogin', false);
  }
}