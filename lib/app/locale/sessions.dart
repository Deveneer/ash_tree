import 'package:ash_tree/app/models/verify_otp_response.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get_storage/get_storage.dart';

// ignore: non_constant_identifier_names
Rx<UserData> USER_INFO = Rx<UserData>(UserData());
// ignore: non_constant_identifier_names
Rx<String> USER_TOKEN = ''.obs;
// ignore: non_constant_identifier_names
var IS_DARK_ENABLED = false.obs;

class SessionManager {
  final _myStorage = GetStorage();

  // ignore: non_constant_identifier_names
  final String USER_DATA_KEY = 'UserData';
  // ignore: non_constant_identifier_names
  final String USER_TOKEN_KEY = 'UserToken';

  Future<void> saveString(String key, String value) async {
    _myStorage.write(key, value);
    print("String saved--$value");
  }

  Future<String?> getString(String key) async {
    String? stringValue;
    stringValue = _myStorage.read(key);
    print("String returned--$stringValue");
    return stringValue;
  }

  Future<void> saveToken(String value) async {
    _myStorage.write(USER_TOKEN_KEY, value);
    print("saveToken saved");
  }

  Future<String?> getToken() async {
    String? stringValue = await _myStorage.read(USER_TOKEN_KEY) == null
        ? null
        : _myStorage.read(USER_TOKEN_KEY);
    print("saveToken => $stringValue");
    return stringValue;
  }

  Future<void> saveBoolean(String key, bool value) async {
    _myStorage.write(key, value);
    debugPrint("Bool saved");
  }

  Future<bool> getBoolean(String key) async {
    bool boolValue;
    boolValue = _myStorage.read(key) ?? false;
    print("Bool returned-$boolValue");
    return boolValue;
  }

  clearSession() {
    _myStorage.erase();
    print("Session Cleared");
  }

  Future<void> saveUser(UserData value) async {
    _myStorage.write(USER_DATA_KEY, value);
    print('USER SAVED');
  }

  Future<UserData?> getUser() async {
    var value = _myStorage.read(USER_DATA_KEY);
    print('USER GET $value');
    if (value == null) {
      return null;
    } else
      return UserData.fromJson(value);
  }
}
