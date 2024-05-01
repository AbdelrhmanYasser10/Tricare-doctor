import 'package:shared_preferences/shared_preferences.dart';

class CashHelper {
  static CashHelper? _instance;
  static late  SharedPreferences prefs;

  CashHelper._internal();

  factory CashHelper() {
    _instance ??= CashHelper._internal();
    return _instance!;
  }

  static dynamic getData({required key}) {
    return prefs.get(key);
  }

 static  Future<void> initialize() async => prefs = await SharedPreferences.getInstance();
}
