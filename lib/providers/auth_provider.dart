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

  Future<void> signup(String email, String password) async {
    final url = Uri.parse(
        "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyCckCtgd8d0Tba-8XyCQcCKLSRaBNThRPY");
    var response = await http.post(
      url,
      body: json.encode({
        'email': email,
        'password': password,
        'returnSecureToken': true,
      }),
    );
    final responseData = json.decode(response.body);
    if (responseData['error'] != null) {
      throw HttpException(responseData['error']['message']);
    }
    _token = responseData['idToken'];
    _userId = responseData['localId'];
    _expiration = DateTime.now().add(
      Duration(
        seconds: int.parse(
          responseData['expiresIn'],
        ),
      ),
    );
    notifyListeners();
  }

  Future<void> login(String email, String password) async {
    final url = Uri.parse(
        "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyCckCtgd8d0Tba-8XyCQcCKLSRaBNThRPY");
    var response = await http.post(
      url,
      body: json.encode({
        'email': email,
        'password': password,
        'returnSecureToken': true,
      }),
    );
    final responseData = json.decode(response.body);
    if (responseData['error'] != null) {
      throw HttpException(responseData['error']['message']);
    }
    _token = responseData['idToken'];
    _userId = responseData['localId'];
    _expiration = DateTime.now().add(
      Duration(
        seconds: int.parse(
          responseData['expiresIn'],
        ),
      ),
    );
    notifyListeners();
  }
}
