import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static LocalStorageService _instance;
  static SharedPreferences _preferences;

  static const String themeKey = 'theme';

  static Future<LocalStorageService> getInstance() async {
    if(_instance == null)
      _instance = LocalStorageService();
    if(_preferences == null)
      _preferences = await SharedPreferences.getInstance();

    return _instance;
  }

  dynamic _getFromDisk(String key) {
    var value  = _preferences.get(key);
    print('(TRACE) LocalStorageService:_getFromDisk. key: $key value: $value');
    return value;
  }

  int get getTheme => _getFromDisk(themeKey) ?? 0;
  set savedTheme(int themeSetIndex) => _saveToDisk(themeKey, themeSetIndex);

  void _saveToDisk<T>(String key, T content) {
    print('(TRACE) LocalStorageService:_saveToDisk. key: $key value: $content');

    if(content is String)
      _preferences.setString(key, content);
  
    if(content is bool)
      _preferences.setBool(key, content);
    
    if(content is int)
      _preferences.setInt(key, content);
    
    if(content is double)
      _preferences.setDouble(key, content);

    if(content is List<String>)
      _preferences.setStringList(key, content);
    
  }

}