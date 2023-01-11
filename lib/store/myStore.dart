// ignore: file_names
// ignore_for_file: prefer_final_fields, prefer_is_empty

import 'package:flutter/material.dart';
import '../Model/Products.dart';

class MyStore extends ChangeNotifier {
  List<Product> _products = [];
  List<Product> _baskets = [];
  Product _activeProduct = Product();
  Product _allProduct = Product();

//constructor to initialize the variables
  MyStore() {
    _products = [
      Product(
          id: 1,
          qty: 1,
          name: 'The Nation',
          price: 125,
          pic: 'https://library.sacredheart.edu/c.php?g=29769&p=185755',
          totalPrice: 0),
      Product(
          id: 2,
          qty: 1,
          name: 'Saturday Nation',
          price: 100,
          pic: 'https://library.sacredheart.edu/c.php?g=29769&p=185755',
          totalPrice: 0),
      Product(
          id: 3,
          qty: 1,
          name: 'Spoty Life',
          price: 115,
          pic: 'https://library.sacredheart.edu/c.php?g=29769&p=185755',
          totalPrice: 0),
      Product(
          id: 4,
          qty: 1,
          name: 'Gbelegbo',
          price: 110,
          pic: 'https://library.sacredheart.edu/c.php?g=29769&p=185755',
          totalPrice: 0),
      Product(
          id: 5,
          qty: 1,
          name: 'Alaroye',
          price: 50,
          pic: 'https://library.sacredheart.edu/c.php?g=29769&p=185755',
          totalPrice: 0),
      Product(
          id: 6,
          qty: 1,
          name: 'Ovation',
          price: 500,
          pic: 'https://library.sacredheart.edu/c.php?g=29769&p=185755',
          totalPrice: 0),
      Product(
          id: 7,
          qty: 1,
          name: 'Item 7',
          price: 150,
          pic: 'https://library.sacredheart.edu/c.php?g=29769&p=185755',
          totalPrice: 0),
      Product(
          id: 8,
          qty: 1,
          name: 'Item 8',
          price: 120,
          pic: 'https://library.sacredheart.edu/c.php?g=29769&p=185755',
          totalPrice: 0),
    ];
    notifyListeners();
  }

  //create getter function
  List<Product> get products => _products;
  List<Product> get baskets => _baskets;
  Product? get activeProduct => _activeProduct;
  Product? get allProduct => _allProduct;

  setActiveProduct(Product p) {
    _activeProduct = p;
  }

  setAllProduct(Product v) {
    _allProduct = v;
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
      } else {
        _baskets.add(p);
      }
    } else {
      _baskets.add(p);
    }

    notifyListeners();
  }

  // addAllItemInBasket(int? quantity, Product p) {
  //   if (_baskets.length > 0) {
  //     var foundItem =
  //         _baskets.firstWhere((a) => a.id == p.id, orElse: () => Product());

  //     Product allItem = Product();

  //     if (foundItem.id != null) {
  //       allItem = _baskets.firstWhere((a) => a.id == p.id);
  //     }
  //     if (allItem.id != null) {
  //       allItem.qty = allItem.qty == null ? 0 : quantity!;
  //       allItem.totalPrice = allItem.qty! * allItem.price!;
  //     } else {
  //       p.qty = p.qty == null ? 0 : quantity!;
  //       p.totalPrice = p.qty! + p.price!;
  //       _baskets.add(p);
  //     }
  //   } else {
  //     p.qty = p.qty == null ? 0 : quantity!;
  //     p.totalPrice = p.qty! + p.price!;
  //     _baskets.add(p);
  //   }
  //   notifyListeners();
  // }

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
        } else {
          _baskets.remove(p);
        }
      } else {
        _baskets.remove(p);
      }
    }
    notifyListeners();
  }

  addAllItemToBasket(Product v) {
    if (_baskets.length > 0) {
      var foundItem =
          _baskets.firstWhere((a) => a.id == v.id, orElse: () => Product());

      Product allItem = Product();

      if (foundItem.id != null) {
        allItem = _baskets.firstWhere((a) => a.id == v.id);
      }
      if (allItem.id != null) {
       if (allItem.qty! >= 0 && allItem.id != null) {
          // allItem.qty = allItem.qty! + 1;
          allItem.totalPrice = allItem.qty! + allItem.price!;
        } else {
          _baskets.add(v);
        }
      } else {
        _baskets.add(v);
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
