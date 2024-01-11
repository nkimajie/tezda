import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tezda/features/auth/data/user_model.dart';

class AuthProvider extends ChangeNotifier {
  // ignore: constant_identifier_names
  static const String BASE_URL = 'https://fakestoreapi.com/';

  bool _loading = false;
  bool get loading => _loading;

  String _error = '';
  String get error => _error;

  UserModel? _user;
  UserModel? get currentUser => _user;

  Future<dynamic> register({
    BuildContext? context,
    required String firstname,
    required String lastname,
    required String username,
    required String email,
    required String password,
  }) async {
    _loading = true;
    notifyListeners();

    final url = Uri.parse('${BASE_URL}users');
    final body = {
      "email": email,
      "username": username,
      "password": password,
      "name": {
        "firstname": firstname,
        "lastname": lastname,
      },
      "address": {
        "city": "kilcoole",
        "street": "7835 new road",
        "number": 3,
        "zipcode": "12926-3874",
        "geolocation": {
          "lat": "-37.3159",
          "long": "81.1496",
        }
      },
      "phone": "1-570-236-7033"
    };

    Logger().d(body);

    try {
      final response = await http.post(url,
          body: json.encode(body),
          // data won't be sent to the a server if headers are excluded
          headers: {'Content-Type': 'application/json'});

      if (response.statusCode == 200 || response.statusCode == 201) {
        _loading = false;
        Logger().d('Account created');
        notifyListeners();
        return true;
      } else {
        final res = json.decode(response.body);
        Logger().d(res);

        _error = res;
        _loading = false;
        notifyListeners();
        return false;
      }
    } catch (e) {
      _error = e.toString();
      _loading = false;
      notifyListeners();
      return false;
      // Logger().d('An error occured: ${e.toString()}');
      // throw Exception('An error occurred during registration');
    }
  }

  Future<dynamic> login({
    BuildContext? context,
    required String username,
    required String password,
  }) async {
    _loading = true;
    notifyListeners();

    final url = Uri.parse('${BASE_URL}auth/login');
    final body = {
      'username': username,
      'password': password,
    };

    Logger().d(body);

    try {
      final response = await http.post(url,
          body: json.encode(body),
          // data won't be sent to the a server if headers are excluded
          headers: {'Content-Type': 'application/json'});

      if (response.statusCode == 200 || response.statusCode == 201) {
        final res = json.decode(response.body);

        _loading = false;
        Logger().d('Login Successfully');
        notifyListeners();

        //Save token here
        final token = res['token'];
        SharedPreferences pref = await SharedPreferences.getInstance();
        pref.setString('token', token);
        pref.setBool('isLoggedIn', true);
        return true;
      } else {
        final res = json.decode(response.body);
        Logger().d(res);

        _error = res;
        _loading = false;
        notifyListeners();
        return false;
      }
    } catch (e) {
      _error = e.toString();
      _loading = false;
      notifyListeners();
      return false;
      // Logger().d('An error occured: ${e.toString()}');
      // throw Exception('An error occurred during registration');
    }
  }

  Future<dynamic> getUser({
    BuildContext? context,
    required int id,
  }) async {
    _loading = true;
    notifyListeners();

    final url = Uri.parse('${BASE_URL}users/$id');

    try {
      final response =
          await http.get(url, headers: {'Content-Type': 'application/json'});

      if (response.statusCode == 200 || response.statusCode == 201) {
        final res = json.decode(response.body);

        _user = UserModel.fromJson(res);

        _loading = false;
        notifyListeners();
      } else {
        _loading = false;
        notifyListeners();
        return false;
      }
    } catch (e) {
      _error = e.toString();
      _loading = false;
      notifyListeners();
      return false;
    }
  }
}
