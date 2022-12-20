import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sales_order/Screens/basketPage.dart';
import 'package:sales_order/Screens/dashboard.dart';

import 'package:sales_order/Screens/select_item.dart';
import 'package:sales_order/Store/MyStore.dart';
import 'package:provider/provider.dart';
import 'package:sales_order/screens/login_screen.dart';
import 'package:sales_order/screens/passwordReset.dart';
import 'package:shared_preferences/shared_preferences.dart';

class profileScreen extends StatefulWidget {
  const profileScreen({super.key});

  @override
  State<profileScreen> createState() => _profileScreenState();
}

class _profileScreenState extends State<profileScreen> {
  final customerNamecontroller = TextEditingController();
  final customerIdcontroller = TextEditingController();
  final customerEmailcontroller = TextEditingController();
  final customerPhonecontroller = TextEditingController();
  final accountBalancecontroller = TextEditingController();

  dynamic customerName;
  dynamic customerId;
  dynamic customerEmail;
  dynamic customerPhone;
  dynamic accountBalance;

  late final SharedPreferences _prefs;

  @override
  void initState() {
    getStringValuesSF();
    super.initState();
  }

  getStringValuesSF() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      customerName = _prefs.getString('customerName') ?? "";
      customerId = _prefs.getString('customerId') ?? "";
      customerEmail = _prefs.getString('customerEmail') ?? "";
      customerPhone = _prefs.getString('customerPhone') ?? "";
      accountBalance = _prefs.getString('accountBalance') ?? "";
    });
    return;
  }

  @override
  Widget build(BuildContext context) {
    var store = Provider.of<MyStore>(context);
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Profile'),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.topLeft,
                children: [
                  Container(
                    height: 80,
                    color: Colors.blue[50],
                  ),
                  const Positioned(
                    left: 10,
                    bottom: -50,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 50,
                      child: Icon(
                        Icons.account_circle_sharp,
                        size: 100,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 100),
              height: 90,
              child: Row(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      backgroundColor: Colors.blue[300],
                      fixedSize: const Size(
                        150,
                        30,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PasswordReset()),
                      );
                    },
                    child: Text('Change Password'),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      backgroundColor: Colors.red,
                      fixedSize: const Size(
                        100,
                        30,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()),
                      );
                    },
                    child: Text('Sign Out'),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              child: Column(
                children: [
                  TextFormField(
                    readOnly: true,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 20),
                      fillColor: Colors.white,
                      filled: true,
                      border: const OutlineInputBorder(),
                      labelText: 'Customer ID',
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 2, color: Colors.blueAccent),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    controller: customerIdcontroller..text = '$customerId',
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 20),
                      fillColor: Colors.white,
                      filled: true,
                      border: const OutlineInputBorder(),
                      labelText: 'Customer Name',
                      // hintText: ' $customerName',
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 2, color: Colors.blueAccent),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    readOnly: true,
                    controller: customerNamecontroller..text = '$customerName',
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    readOnly: true,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 20),
                      fillColor: Colors.white,
                      filled: true,
                      border: const OutlineInputBorder(),
                      labelText: 'Email',
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 2, color: Colors.blueAccent),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    controller: customerEmailcontroller
                      ..text = '$customerEmail',
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    readOnly: true,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 20),
                      fillColor: Colors.white,
                      filled: true,
                      border: const OutlineInputBorder(),
                      labelText: 'Phone Number',
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 2, color: Colors.blueAccent),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    controller: customerPhonecontroller
                      ..text = '$customerPhone',
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    readOnly: true,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 20),
                      fillColor: Colors.white,
                      filled: true,
                      border: const OutlineInputBorder(),
                      labelText: 'Account Balance',
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 2, color: Colors.blueAccent),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    controller: accountBalancecontroller
                      ..text = '$accountBalance',
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    readOnly: true,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 20),
                      fillColor: Colors.white,
                      filled: true,
                      border: const OutlineInputBorder(),
                      labelText: 'Customer Type',
                      hintText: 'Customer Type',
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 2, color: Colors.blueAccent),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  const TextField(
                    maxLines: 5,
                    readOnly: true,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 20),
                        fillColor: Colors.white,
                        filled: true,
                        border: const OutlineInputBorder(),
                        labelText: 'Address',
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: Colors.blueAccent),
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
