import 'package:dart_config/default_browser.dart';
import 'dart:async';

class Config {

  static var _config;
  static var _errorhandler;

  static Future<String> get(String key) async{
    try {
      var config = await _config;
      if(config[key]==null)
        _errorhandler("Missing config variable: $key");
        else
      return config[key];
    }
    catch (e) {
      _errorhandler("No config on server:$e");
    }
  }

  static load(errorhandler) {
    _config = loadConfig();
    _errorhandler = errorhandler;
  }
}