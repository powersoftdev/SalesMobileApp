

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sales_order/Store/MyStore.dart';
import 'package:intl/intl.dart';

class BasketPage extends StatefulWidget {
  const BasketPage({super.key});

  @override
  State<BasketPage> createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  final DateFormat formatter = DateFormat('MM-dd-yyyy');

  @override
  Widget build(BuildContext context) {
    var store = Provider.of<MyStore>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Center(child: Text('Cart')),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {},
            iconSize: 40,
          ),
          Text(
            store.getBasketQty().toString(),
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
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
            onPressed: () {},
            child: const Text('Check Out'),
          ),
        ),
      ),
      body: ListView.builder(
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
                        style: const TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ),
                    // Expanded(
                    //   flex: 1,
                    //   child: Text(store.baskets[i].totalPrice.toString()),
                    // ),
                    IconButton(
                      onPressed: () {
                        setState(
                          () {
                            store.baskets.removeAt(i);
                          },
                        );
                      },
                      icon: const Icon(Icons.close),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                  child:
                      Text("Order Date :${formatter.format(DateTime.now())}"),
                ),
                Container(
                  height: 40,
                  // color: Colors.red,
                  padding: const EdgeInsets.only(left: 100),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          store.removeOneItemFromBasket(store.baskets[i]);
                        },
                        icon: const Icon(Icons.remove),
                        iconSize: 32,
                        color: Colors.redAccent,
                      ),
                      const SizedBox(width: 15),
                      Container(
                        height: 20,
                        width: 40,
                        decoration: const BoxDecoration(
                            // border: Border.all(
                            //   color: Colors.grey,
                            // ),
                            ),
                        child: Text(
                          store.baskets[i].qty.toString(),
                        ),
                      ),
                      // SizedBox(width: 5),
                      IconButton(
                        onPressed: () {
                          store.addOneItemToBasket(store.baskets[i]);
                        },
                        icon: const Icon(Icons.add),
                        iconSize: 30,
                        color: Colors.greenAccent,
                      ),
                      const SizedBox(width: 30),
                      Text(
                        ('₦ ${store.baskets[i].totalPrice.toString()}'),
                        style: const TextStyle(
                          fontSize: 22,
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
    );
  }
}
