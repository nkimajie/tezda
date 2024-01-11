import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tezda/features/auth/data/user_model.dart';

class ProfileProvider extends ChangeNotifier {
  // ignore: constant_identifier_names
  static const String BASE_URL = 'https://fakestoreapi.com/';

  bool _loading = false;
  bool get loading => _loading;

  String _error = '';
  String get error => _error;

  UserModel? _user;
  UserModel? get currentUser => _user;

  Future<bool> getUser({
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

        return true;
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

  Future<dynamic> saveProfile({
    BuildContext? context,
    required int id,
    required String firstname,
    required String lastname,
    required String email,
    required String phone,
  }) async {
    _loading = true;
    notifyListeners();

    final url = Uri.parse('${BASE_URL}users/$id');
    final body = {
      "email": email,
      "username": "username",
      "password": "password",
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
      "phone": phone
    };

    try {
      final response = await http.put(url,
          body: json.encode(body),
          // data won't be sent to the a server if headers are excluded
          headers: {'Content-Type': 'application/json'});

      if (response.statusCode == 200 || response.statusCode == 201) {
        _loading = false;
        notifyListeners();
        return true;
      } else {
        final res = json.decode(response.body);

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
}
