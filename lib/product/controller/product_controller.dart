import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:machine_test_adss/product/model/product_model.dart';

class ProductController with ChangeNotifier {
  List<Product> products = [];
    List<Product> cartList = [];

  Future<void> getProducts(context) async {
    var data =
        await DefaultAssetBundle.of(context).loadString('assets/product.json');

    var productData = jsonDecode(data)["Products"] as List;
    for (var element in productData) {
      products.add(Product.fromJson(element));
    }
    notifyListeners();
  }
  void addToCart(Product product){
  cartList.add(product)  ;
  notifyListeners();
  }
  void getCart(){
  cartList;
  notifyListeners();
  }
}
