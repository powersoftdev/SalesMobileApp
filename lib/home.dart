// ignore_for_file: prefer_const_constructors, unused_field

import 'package:flutter/material.dart';
import 'package:number_inc_dec/number_inc_dec.dart';
import 'Screens/select_item.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  String dropDownValue = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Center(
            child: Text('Order Page'),
          ),
        ),
        body: SafeArea(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 80,
                width: 400,
                color: Colors.white,
                padding: EdgeInsets.only(top: 30.0, left: 120.0),
                child: Text(
                  'BOOK ITEM',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.blue.shade700,
                  ),
                ),
              ),
              Container(
                height: 649,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(100),
                    topRight: Radius.circular(100),
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                  ),
                ),
                padding: const EdgeInsets.only(
                  left: 10.0,
                  right: 10.0,
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 55,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: const OutlineInputBorder(),
                        hintText: 'Order ID',
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: Colors.blueAccent),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: const OutlineInputBorder(),
                        hintText: 'Order Date',
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: Colors.blueAccent),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 55,
                      padding: EdgeInsets.only(top: 0.0, left: 10.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      child: DropdownButtonFormField(
                        value: dropDownValue,
                        items: const [
                          DropdownMenuItem<String>(
                              value: '', child: Text('-Select Item-')),
                          DropdownMenuItem<String>(
                              value: 'Item 1', child: Text('Item 1')),
                          DropdownMenuItem<String>(
                              value: 'Item 2', child: Text('Item 2')),
                          DropdownMenuItem<String>(
                              value: 'Item 3', child: Text('Item 3')),
                          DropdownMenuItem<String>(
                              value: 'Item 4', child: Text('Item 4')),
                        ],
                        onChanged: (String? value) {
                          setState(() {
                            dropDownValue = value!;
                          });
                        },
                        validator: (value) {
                          if (dropDownValue == '') return 'Select an Item.';
                          return null;
                        },
                        iconSize: 40,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 55,
                      padding: EdgeInsets.only(top: 0.0, left: 10.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      child: NumberInputWithIncrementDecrement(
                        controller: TextEditingController(),
                        min: 0,
                        max: 20,
                        incIcon: Icons.add,
                        decIcon: Icons.remove,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: const OutlineInputBorder(),
                        hintText: 'Item Unit Price',
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: Colors.blueAccent),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: const OutlineInputBorder(),
                        hintText: 'Amount',
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: Colors.blueAccent),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: const OutlineInputBorder(),
                        hintText: 'Delivery Date',
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: Colors.blueAccent),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        // ignore: deprecated_member_use
                        primary: Colors.blue.shade400,
                        textStyle: const TextStyle(
                          // backgroundColor: Colors.black,
                          fontSize: 25,
                        ),
                      ),
                      onPressed: () {},
                      child: const Text('Book Order'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SelectItemScreen(),
            ),
          ),
          child: const Icon(Icons.forward),
        ),
      ),
    );
  }
}
