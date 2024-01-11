import 'dart:convert';

import 'package:tezda/features/home/data/product_model.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class HomeService {
  // ignore: constant_identifier_names
  static const String BASE_URL = 'https://fakestoreapi.com/';

  Future<List<ProductModel>> homeProduct(limit) async {
    final url = Uri.parse('${BASE_URL}products?limit=${limit ?? 20}');
    try {
      final response =
          await http.get(url, headers: {'Content-Type': 'application/json'});

      final res = json.decode(response.body) as List;
      final products = res.map((p) {
        return ProductModel.fromJson(p);
      }).toList();
      return products;
    } catch (e) {
      Logger().d('An error occured: ${e.toString()}');
      throw Exception('An error occurred during registration');
    }
  }

  Future<List<ProductModel>> getProductByCat(String cat) async {
    final url = Uri.parse('${BASE_URL}products/category/$cat');
    try {
      final response =
          await http.get(url, headers: {'Content-Type': 'application/json'});

      final res = json.decode(response.body) as List;

      final products = res.map((p) {
        return ProductModel.fromJson(p);
      }).toList();
      return products;
    } catch (e) {
      Logger().d('An error occured: ${e.toString()}');
      throw Exception('An error occurred during registration');
    }
  }

  Future<List<String>> getCategories() async {
    final url = Uri.parse('${BASE_URL}products/categories');
    try {
      final response =
          await http.get(url, headers: {'Content-Type': 'application/json'});

      final res = json.decode(response.body) as List;

      // Assuming the elements in the response list are strings, return it directly
      return List<String>.from(res);
    } catch (e) {
      Logger().d('An error occurred: ${e.toString()}');
      throw Exception('An error occurred during registration');
    }
  }
}
