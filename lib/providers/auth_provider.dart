import 'dart:convert';

import 'package:flutter/cupertino.dart';
import '../utils/http_exception.dart';
import 'package:http/http.dart' as http;

class AuthProvider with ChangeNotifier {
  String? _token;
  DateTime? _expiration;
  String? _userId;

  bool? get isAuth {
    return token != null;
  }

  String? get token {
    if (_expiration != null &&
        _expiration!.isAfter(DateTime.now()) &&
        _token != null) {
      return _token;
    }
    return null;
  }

  // Store.saveMap('userId', {'token' : _token, ''});

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
    // _token = responseData['idToken'];
    // _userId = responseData['localId'];
    // _expiration = DateTime.now().add(
    //   Duration(
    //     seconds: int.parse(
    //       responseData['expiresIn'],
    //     ),
    //   ),
    //);
    notifyListeners();
  }

  Future<void> login(String email, String password) async {
    final url = Uri.parse("http://147.182.215.248:8001/api-auth/login/");
    var response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
        'Authorization': 'Token 6b929e47f278068fe6ac8235cda09707a3aa7ba1'
      },
      body: json.encode({
        'email': email,
        'password': password,
      }),
    );
    final responseData = json.decode(response.body);
    if (responseData['error'] != null) {
      throw HttpException(responseData['error']['message']);
    }

    _token = responseData['X-CSRFToken'];
    print(_token);
    // _userId = responseData['localId'];
    // _expiration = DateTime.now().add(
    //   Duration(
    //     seconds: int.parse(
    //       responseData['expiresIn'],
    //     ),
    //   ),
    // );
    notifyListeners();
  }
}
