// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, body_might_complete_normally_nullable, avoid_print

// import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sales_order/Model/products.dart';
// import 'package:http/http.dart' as http;
import 'package:sales_order/screens/profileScreen.dart';
import 'package:sales_order/store/myStore.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../Store/MyStore.dart';
import '../Screens/ProductDetailPage.dart';
import '../Screens/basketPage.dart';
import '../Screens/dashboard.dart';
import '../Model/item.dart';

class SelectItemScreen extends StatefulWidget {
  const SelectItemScreen({super.key});

  @override
  State<SelectItemScreen> createState() => _SelectItemScreenState();
}

class _SelectItemScreenState extends State<SelectItemScreen> {
  TextEditingController txtQuery = TextEditingController();

  var itemId;
  var data;
  var productLists = [];
  late int minimumQty;
  late String itemName;
  late double price;
  late String pictureurl;
  late String itemFamilyId;

  Future<List<Datum>> productListAPIResult =
      Future.value(List<Datum>.from([Datum()]));

  @override
  void initState() {
    productListAPIResult = Provider.of<MyStore>(context).callApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //register for thr listener to listen for any notifications
    var store = Provider.of<MyStore>(context);
    var dataCopy;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Center(
          child: Text('Catlog'),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Container(
            padding: EdgeInsets.only(left: 15),
            height: 50,
            decoration: BoxDecoration(
              color: Colors.blue[50],
            ),
            child: TextField(
              onChanged: (text) {
                _getProductList();
                // print(productLists.length.toString());
                // print('Nos of Items in product list: ${data.length}');
                // var dataCopy = [];
                // for (var product in productLists) {
                //   final prod = product is Datum ? product : Datum();
                //   print(
                //       'product is ${product.ItemName}; prod is ${prod.ItemName}');
                //   var pattern = RegExp('($text)+?', caseSensitive: false);
                //   bool myResult = pattern.hasMatch(prod.ItemName);
                //   print(
                //       'Product name is: ${prod.ItemName}, hasMatch value is: $myResult');
                //   if (myResult) {
                //     dataCopy.add(prod);
                //   }
                //   // print('Nos of Items in data: ${data.length}');
                // }
                // setState(() {
                //   dataCopy = productLists.where((product) {
                //     final prod = product is Datum ? product : Datum();
                //     var pattern = RegExp('($text)+?', caseSensitive: false);
                //     bool myResult = pattern.hasMatch(prod.ItemName);
                //     print(
                //         'Product name is: ${prod.ItemName}, hasMatch value is: $myResult');
                //     return myResult;
                //   });
                // });

                store.setProductCatalogViewable(dataCopy);
                print('Nos of Items in data: ${data.length}');
              },
              controller: txtQuery,
              decoration: InputDecoration(
                border: InputBorder.none,
                // contentPadding: EdgeInsets.all(5),
                hintText: 'Search Items',
                icon: Icon(
                  Icons.search,
                  size: 32,
                ),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    //   txtQuery.text = '';
                    //   search(txtQuery.text);
                  },
                ),
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BasketPage()),
              );
            },
            iconSize: 40,
          ),
          Text(
            store.getBasketQty().toString(),
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          // Text(
          //   store.getBasketQty().toString(),
          //   style: TextStyle(
          //     color: Colors.white,
          //   ),
          // ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue[500],
        unselectedItemColor: Colors.blue[500],
        selectedFontSize: 18,
        unselectedFontSize: 18,
        iconSize: 32,
        // currentIndex: 1,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_offer_outlined),
            label: 'View Catlog',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_sharp),
            label: 'Profile',
          ),
        ],
        onTap: (int index) {
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DashBoard()),
              );
              break;
            default:
          }
          switch (index) {
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const SelectItemScreen()),
              );
              break;
            default:
          }

          switch (index) {
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const profileScreen()),
              );
              break;
            default:
          }
        },
      ),
      body: FutureBuilder<List<Datum>>(
        future: productListAPIResult,
        builder: (context, snapshot) {
          // store.setProductCatalogViewable(snapshot.data);
          data = store.products;
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: data!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Image.asset(
                        'lib/images/newsp.jpg',
                      ),
                    ),
                    title: Text(data[index].ItemName.toString()),
                    subtitle: Text(data[index].ItemFamilyId.toString()),
                    trailing: Text('₦ ${data[index].price.toString()}'),
                    onTap: () {
                      // set the item as the activeProduct
                      store.setActiveProduct(
                        Product(
                            id: data[index].ItemId,
                            name: data[index].ItemName,
                            price: data[index].price,
                            qty: _getQty(data[index].ItemId, store),
                            // qty: store.activeProduct!.qty ?? 1,
                            totalPrice: 0),
                      );
                      //move to productDetail page
                      showModalBottomSheet<void>(
                        context: context,
                        isScrollControlled: true,
                        // ignore: sized_box_for_whitespace
                        builder: (context) => Container(
                          height: 500,
                          child: _popupProductDetails(),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  ProductDetailpage _popupProductDetails() => ProductDetailpage();
  int _getQty(dynamic itemId, MyStore store) {
    var baskets = store.baskets;
    if (store.baskets.isNotEmpty) {
      var product =
          baskets.firstWhere((a) => a.id == itemId, orElse: () => Product());
      if (product.qty != null) {
        return product.qty!; // return current product qty if it exists.
      }
      return 0; // if basket is not empty but product not found, return 0
    }

    return 0; // if basket is empty return 0
  }

  _getProductList() async {
    productLists = await productListAPIResult;
  }
}
