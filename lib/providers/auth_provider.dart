import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/http_exception.dart';
import 'package:http/http.dart' as http;

class AuthProvider with ChangeNotifier {
  int? _id;

  bool? get isAuth {
    return id != null;
  }

  int? get id {
    if (_id != null) {
      return _id;
    }
    return null;
  }

  Future<void> signup(String email, String password) async {
    final url = Uri.parse("http://147.182.215.248:8002/api/profile/");
    var response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: json.encode({
        // "id": 26,
        // "last_login": "2021-10-13T01:10:37.101690Z",
        'email': email,
        'password': password,
        "is_active": true,
        "staff": false,
        "admin": false
      }),
    );
    final responseData = json.decode(response.body);
    if (responseData['error'] != null) {
      throw HttpException(responseData['error']['message']);
    }

    notifyListeners();
  }

  Future<void> login(String email, String password) async {
    final url = Uri.parse("http://147.182.215.248:8001/api-auth/login/");
    final responseData;
    var _header = {
      "Content-Type": "application/x-www-form-urlencoded",
      'Cookie':
          'csrftoken=olf7mulM72hAhJpRGLTAR3pGkgUMgVzlmvoO8LklMfEhZ1asJr8LQoP139lPmU3I'
    };

    var _body = new Map<String, dynamic>();
    _body['csrfmiddlewaretoken'] =
        'L91GyqdJ5lP4EPk98kXw4FgVGTNkHwDSJjankHciKycLm75Kb0cH30GgpMenNv7f';
    _body['next'] = '/api/profile';
    _body['username'] = email;
    _body['password'] = password;
    _body['submit'] = 'Log+in';

    var response = await http.post(url, headers: _header, body: _body);
    if (response.statusCode == 302) {
      var _cookie = response.headers["set-cookie"]!.split(';')[0];
      var _session = response.headers["set-cookie"]!
          .split(';')[4]
          .replaceAll("SameSite=Lax,", "");
      var _getProfileUrl = Uri.parse("http://147.182.215.248:8001/api/profile");
      var _getProfileHeader = {
        'Cookie': "$_cookie;$_session",
      };
      var responseProfile =
          await http.get(_getProfileUrl, headers: _getProfileHeader);
      if (responseProfile.statusCode == 200) {
        print(responseProfile.body);
        responseData = json.decode(responseProfile.body);
        await _createPrefs(responseData[0]);
        _id = responseData[0]["id"];
      }
    }
    notifyListeners();
    return;
  }

  Future<void> _createPrefs(dynamic data) async {
    final prefs = await SharedPreferences.getInstance();
    final userData = json.encode({
      'id': data["id"],
      'last_login': data["last_login"],
      'email': data["email"],
      'is_active': data["is_active"],
      'staff': data["staff"],
      'admin': data["admin"],
    });

    prefs.setString('userData', userData);
  }

  Future<bool> tryAutoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    //prefs.clear();

    if (!prefs.containsKey('userData')) {
      //TODO user repository
      return false;
    }

    final extractedUserData =
        json.decode(prefs.getString('userData')!) as Map<String, dynamic>;

    _id = extractedUserData['id'];

    notifyListeners();
    return true;
  }
}
