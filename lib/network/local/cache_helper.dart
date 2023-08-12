import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper{
  static SharedPreferences? sharedPreferences;

  static init()
  async{
     sharedPreferences=await SharedPreferences.getInstance();
  }

  static Future<bool?> putBoolData(
      {required String key, required bool value}) async{
    return await sharedPreferences?.setBool(key, value);}

  static bool? getBoolData({required key}){
    return sharedPreferences?.getBool(key);
  }


}