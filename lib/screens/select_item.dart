// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sales_order/Model/products.dart';
import 'package:sales_order/Screens/login_screen.dart';
import 'package:http/http.dart' as http;
import 'package:sales_order/screens/profileScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Store/MyStore.dart';
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
  // ignore: prefer_final_fields
  TextEditingController txtQuery = new TextEditingController();

  var itemId;
  late int minimumQty;
  late String itemName;
  late double price;
  late String pictureurl;
  late String itemFamilyId;
  String? token;

  Future<List<Datum>> productListAPIResult =
      Future.value(List<Datum>.from([Datum()]));

  @override
  void initState() {
    productListAPIResult = callApi();
    super.initState();
  }

  Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
  }

  Future<List<Datum>> callApi() async {
    await getToken();
    final response = await http.get(
        Uri.parse('http://powersoftrd.com/PEMAPI/api/GetInventoryItems/741258'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    print('token : ${token}');

    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      // final itemModels = result["data"];
      var itemModel = ItemModel.fromJson(result);
      return itemModel.data;
      // return ItemModels.map((e) => ItemModelFromJson(e)).toList();

    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    //register for thr listener to listen for any notifications
    var store = Provider.of<MyStore>(context);
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
              // onChanged: search,
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
          var data = snapshot.data;
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
            return CircularProgressIndicator();
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
}
