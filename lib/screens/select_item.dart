// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sales_order/Screens/login_screen.dart';
import '../Store/MyStore.dart';
import '../Screens/ProductDetailPage.dart';
import '../Screens/basketPage.dart';
import '../Screens/dashboard.dart';

class SelectItemScreen extends StatefulWidget {
  const SelectItemScreen({super.key});

  @override
  State<SelectItemScreen> createState() => _SelectItemScreenState();
}

class _SelectItemScreenState extends State<SelectItemScreen> {
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
            icon: Icon(Icons.feed_outlined),
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
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
              break;
            default:
          }
        },
      ),
      body: ListView.builder(
        itemCount: store.products.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.white,
                child: Image.asset(
                  'lib/images/newsp.jpg',
                ),
              ),
              title: Text(store.products[index].name!),
              subtitle: Text('₦ ${store.products[index].price.toString()}'),
              trailing: Text('₦ ${store.products[index].price.toString()}'),
              onTap: () {
                //set the item as the activeProduct
                store.setActiveProduct(
                  store.products[index],
                );
                //move to productDetail page
                showModalBottomSheet<void>(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) => Container(
                    height: 500,
                    child: _popupProductDetails(),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  ProductDetailpage _popupProductDetails() => ProductDetailpage();
}
