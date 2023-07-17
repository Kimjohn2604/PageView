import 'package:app/service/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  late final SharedPreferences _pref;
  Future<StorageService> init() async {
    _pref = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setBool(String key, bool value) async {
    return await _pref.setBool(key, value);
  }

  Future<bool> setString(String key, String value) async {
    return await _pref.setString(key, value );
  }

  bool getDeviceFirstOpen() {
    return _pref.getBool(AppConstant.STORAGE_DEVICE_OPEN_FIRST_TIME) ?? false;
  }
  bool getIsLogged() {
    return _pref.getString(AppConstant.STORAGE_USER_TOKEY_KEY)==null?false:true;
  }

}
