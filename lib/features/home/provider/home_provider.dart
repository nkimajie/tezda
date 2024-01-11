import 'package:tezda/features/home/data/product_model.dart';
import 'package:tezda/features/home/service/home_service.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  final _homeService = HomeService();

  bool isLoading = false;

  List<ProductModel> _product = [];
  List<ProductModel> get product => _product;

  List<ProductModel> _electronics = [];
  List<ProductModel> get electronics => _electronics;

  List<ProductModel> _jewelery = [];
  List<ProductModel> get jewelery => _jewelery;

  List<String> _categories = [];
  List<String> get categories => _categories;

  // bool get loading => _loading;

  Future<void> getProduct() async {
    isLoading = true;
    notifyListeners();
    final response = await _homeService.homeProduct(null);
    _product = response;
    isLoading = false;
    notifyListeners();
  }

  Future<void> getHomeProduct() async {
    isLoading = true;
    notifyListeners();

    List<Future> futures = [
      _homeService.getProductByCat("electronics"),
      _homeService.getProductByCat("jewelery"),
      _homeService.homeProduct(6),
      _homeService.getCategories(),
    ];

    List<dynamic> results = await Future.wait(futures);

    _electronics = results[0];
    _jewelery = results[1];
    _product = results[2];
    _categories = results[3];

    isLoading = false;
    notifyListeners();
  }
}
