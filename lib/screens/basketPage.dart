// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sales_order/Store/MyStore.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'checkout.dart';

class BasketPage extends StatefulWidget {
  const BasketPage({super.key});

  @override
  State<BasketPage> createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  final DateFormat formatter = DateFormat('MM-dd-yyyy');

  String pickeddate = "";
  late final SharedPreferences _prefs;

  @override
  void initState() {
    getStringValuesSF();
    super.initState();
  }

  getStringValuesSF() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      pickeddate = _prefs.getString('pickeddate') ?? "";
    });
    return pickeddate;
  }

  @override
  Widget build(BuildContext context) {
    var store = Provider.of<MyStore>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Center(child: Text('Cart')),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {},
            iconSize: 40,
          ),
          Text(
            store.getBasketQty().toString(),
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: EdgeInsets.only(left: 30, right: 30, bottom: 30),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              fixedSize: const Size(
                0,
                45,
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Checkout(),
                ),
              );
            },
            child: Text('Check Out'),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(
          top: 0,
          right: 0,
          left: 0,
          bottom: MediaQuery.of(context).viewInsets.bottom + 10,
        ),
        child: ListView.builder(
          itemCount: store.baskets.length,
          itemBuilder: (context, i) {
            return Card(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Image.asset(
                          'lib/images/newsp.jpg',
                          width: 60,
                          height: 90,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          store.baskets[i].name!,
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(
                            () {
                              store.baskets.removeAt(i);
                            },
                          );
                        },
                        icon: Icon(Icons.close),
                      ),
                    ],
                  ),
                  // ignore: sized_box_for_whitespace
                  Container(
                    height: 30,
                    child: Text("Shipping Date :$pickeddate"),
                  ),
                  Container(
                    height: 40,
                    padding: EdgeInsets.only(left: 100),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            store.removeOneItemFromBasket(store.baskets[i]);
                          },
                          icon: Icon(Icons.remove),
                          iconSize: 32,
                          color: Colors.redAccent,
                        ),
                        SizedBox(width: 15),
                        // ignore: sized_box_for_whitespace
                        Container(
                          height: 20,
                          width: 40,
                          child: TextFormField(
                            controller: TextEditingController()
                              ..text = store.baskets[i].qty.toString()
                              ..selection = TextSelection.collapsed(
                                  offset:
                                      store.baskets[i].qty.toString().length),
                            onChanged: (text) {
                              store.increaseItemQuantity(
                                  (int.tryParse(text) ?? 0), store.baskets[i]);
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        // SizedBox(width: 5),
                        IconButton(
                          onPressed: () {
                            store.addOneItemToBasket(store.baskets[i]);
                          },
                          icon: Icon(Icons.add),
                          iconSize: 30,
                          color: Colors.greenAccent,
                        ),
                        SizedBox(width: 15),
                        // ignore: avoid_unnecessary_containers
                        Container(
                          child: Text(
                            ('₦ ${store.baskets[i].totalPrice.toString()}'),
                            style: TextStyle(
                              fontSize: 22,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
