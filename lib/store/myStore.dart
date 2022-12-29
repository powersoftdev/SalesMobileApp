// ignore: file_names
// ignore_for_file: prefer_final_fields, prefer_is_empty

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sales_order/Model/item.dart';
// import '../Model/Products.dart';
import 'package:sales_order/Model/products.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class MyStore extends ChangeNotifier {
  List<Datum> _products = [];
  List<Product> _baskets = [];
  Product _activeProduct = Product();
  String? _token;

//constructor to initialize the variables
  // MyStore() {
  //   _products = [
  //     Product(
  //         id: 1,
  //         qty: 1,
  //         name: 'The Nation',
  //         price: 125,
  //         pic: 'https://library.sacredheart.edu/c.php?g=29769&p=185755',
  //         totalPrice: 0),
  //     Product(
  //         id: 2,
  //         qty: 1,
  //         name: 'Saturday Nation',
  //         price: 100,
  //         pic: 'https://library.sacredheart.edu/c.php?g=29769&p=185755',
  //         totalPrice: 0),
  //     Product(
  //         id: 3,
  //         qty: 1,
  //         name: 'Spoty Life',
  //         price: 115,
  //         pic: 'https://library.sacredheart.edu/c.php?g=29769&p=185755',
  //         totalPrice: 0),
  //     Product(
  //         id: 4,
  //         qty: 1,
  //         name: 'Gbelegbo',
  //         price: 110,
  //         pic: 'https://library.sacredheart.edu/c.php?g=29769&p=185755',
  //         totalPrice: 0),
  //     Product(
  //         id: 5,
  //         qty: 1,
  //         name: 'Alaroye',
  //         price: 50,
  //         pic: 'https://library.sacredheart.edu/c.php?g=29769&p=185755',
  //         totalPrice: 0),
  //     Product(
  //         id: 6,
  //         qty: 1,
  //         name: 'Ovation',
  //         price: 500,
  //         pic: 'https://library.sacredheart.edu/c.php?g=29769&p=185755',
  //         totalPrice: 0),
  //     Product(
  //         id: 7,
  //         qty: 1,
  //         name: 'Item 7',
  //         price: 150,
  //         pic: 'https://library.sacredheart.edu/c.php?g=29769&p=185755',
  //         totalPrice: 0),
  //     Product(
  //         id: 8,
  //         qty: 1,
  //         name: 'Item 8',
  //         price: 120,
  //         pic: 'https://library.sacredheart.edu/c.php?g=29769&p=185755',
  //         totalPrice: 0),
  //   ];
  //   notifyListeners();
  // }

  //create getter function
  List<Datum> get products => _products;
  List<Product> get baskets => _baskets;
  Product? get activeProduct => _activeProduct;

  setActiveProduct(Product p) {
    _activeProduct = p;

    notifyListeners();
  }

  Future<String?> _getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _token = prefs.getString('token');
  }

  Future<List<Datum>> callApi() async {
    await _getToken();
    final response = await http.get(
        Uri.parse('http://powersoftrd.com/PEMAPI/api/GetInventoryItems/741258'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $_token',
        });
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    print('token : $_token');

    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      // final itemModels = result["data"];
      var itemModel = ItemModel.fromJson(result);
      return itemModel.data;
      // return ItemModels.map((e) => ItemModelFromJson(e)).toList();

    } else {
      throw Exception('Request API Error');
    }

    notifyListeners();
  }

  setProductCatalogViewable(var p) {
    _products = [...p];

    notifyListeners();
  }

  increaseItemQuantity(int? quantity, Product p) {
    if (_baskets.length > 0) {
      var foundItem =
          _baskets.firstWhere((a) => a.id == p.id, orElse: () => Product());
      Product found = Product();
      if (foundItem.id != null) {
        found = _baskets.firstWhere((a) => a.id == p.id);
      }
      if (found.id != null) {
        found.qty = found.qty == null ? 0 : quantity!;
        found.totalPrice = found.qty! * found.price!;
      } else {
        p.qty = p.qty == null ? 0 : quantity!;
        p.totalPrice = p.qty! * p.price!;
        _baskets.add(p);
      }
    } else {
      p.qty = p.qty == null ? 0 : quantity!;
      p.totalPrice = p.qty! * p.price!;
      _baskets.add(p);
    }
    notifyListeners();
  }

  addOneItemToBasket(Product p) {
    if (_baskets.length > 0) {
      var foundItem =
          _baskets.firstWhere((a) => a.id == p.id, orElse: () => Product());

      Product found = Product();

      if (foundItem.id != null) {
        found = _baskets.firstWhere((a) => a.id == p.id);
      }
      if (found.id != null) {
        found.qty = found.qty == null ? 0 : found.qty! + 1;
        found.totalPrice = found.qty! * found.price!;

        int index = _baskets.indexWhere((b) => b.id == found.id);
        _baskets[index].qty = found.qty;
        _baskets[index].totalPrice = found.totalPrice;
      } else {
        p.qty = 1;
        _baskets.add(p);
      }
    } else {
      p.qty = 1;
      _baskets.add(p);
    }

    notifyListeners();
  }

  removeOneItemFromBasket(Product p) {
    if (_baskets.length > 0) {
      var foundItem =
          _baskets.firstWhere((a) => a.id == p.id, orElse: () => Product());

      Product found = Product();

      if (foundItem.id != null) {
        found = _baskets.firstWhere((a) => a.id == p.id);
      }
      if (found.id != null) {
        if (found.qty! > 1 && found.id != null) {
          found.qty = found.qty! - 1;
          found.totalPrice = found.qty! * found.price!;

          int index = _baskets.indexWhere((b) => b.id == found.id);
          _baskets[index].qty = found.qty;
          _baskets[index].totalPrice = found.totalPrice;
        } else {
          _baskets.remove(p);
        }
      } else {
        _baskets.remove(p);
      }
    }
    notifyListeners();
  }

  getBasketQty() {
    int total = 0;
    for (int i = 0; i < baskets.length; i++) {
      total += baskets[i].qty!;
    }
    return total;
  }
}
