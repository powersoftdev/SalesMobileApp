// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../Store/MyStore.dart';
import 'basketPage.dart';

class ProductDetailpage extends StatefulWidget {
  const ProductDetailpage({super.key});

  @override
  State<ProductDetailpage> createState() => _ProductDetailpageState();
}

class _ProductDetailpageState extends State<ProductDetailpage> {
  final _date = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var store = Provider.of<MyStore>(context);
    String qtyStr = store.activeProduct!.qty.toString();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: Color(0xFF737373),
        child: Container(
          padding: EdgeInsets.only(top: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            ),
            color: Colors.white,
          ),
          child: Column(
            children: [
              TextFormField(
                readOnly: true,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 150),
                  fillColor: Colors.white,
                  filled: true,
                  border: const OutlineInputBorder(),
                  labelText: (store.activeProduct!.name),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Colors.blueAccent),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                readOnly: true,
                decoration: InputDecoration(
                  suffixIcon:
                      Text('₦ ${store.activeProduct!.price.toString()}'),
                  contentPadding: EdgeInsets.only(left: 30),
                  suffixIconConstraints:
                      BoxConstraints(minWidth: 100, minHeight: 0),
                  fillColor: Colors.white,
                  filled: true,
                  border: const OutlineInputBorder(),
                  labelText: ('Price: '),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Colors.blueAccent),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                controller: _date,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 30),
                  fillColor: Colors.white,
                  filled: true,
                  border: const OutlineInputBorder(),
                  suffixIcon: Icon(Icons.calendar_today_rounded),
                  labelText: 'Select Preferred Delivery Date:',
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Colors.blueAccent),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onTap: () async {
                  DateTime? pickeddate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2050));

                  if (pickeddate != null) {
                    setState(
                      () {
                        _date.text =
                            DateFormat('MM-dd-yyyy').format(pickeddate);
                      },
                    );
                  }
                },
              ),
              SizedBox(
                height: 30.0,
              ),
              Container(
                width: 200,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        store.removeOneItemFromBasket(store.activeProduct!);
                      },
                      icon: Icon(Icons.remove),
                      iconSize: 32,
                      color: Colors.redAccent,
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Container(
                      height: 25,
                      width: 40,
                      child: TextFormField(
                        // controller: _date,
                        controller: TextEditingController()
                          ..text = qtyStr
                          ..selection =
                              TextSelection.collapsed(offset: qtyStr.length),
                        onChanged: (text) {
                          store.increaseItemQuantity(
                              (int.tryParse(text) ?? 0), store.activeProduct!);
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                        // onChanged: (text) {},
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    IconButton(
                      onPressed: () {
                        store.addOneItemToBasket(store.activeProduct!);
                      },
                      icon: Icon(Icons.add),
                      iconSize: 32,
                      color: Colors.greenAccent,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    backgroundColor: Colors.blue[300],
                    fixedSize: const Size(
                      350,
                      45,
                    )),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => BasketPage()));
                },
                child: Text('Add To Cart'),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  backgroundColor: Colors.blue[300],
                  fixedSize: const Size(
                    350,
                    45,
                  ),
                ),
                onPressed: () {},
                //Navigate to the checkout page
                child: Text('Place Order'),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  backgroundColor: Colors.red[300],
                  fixedSize: const Size(
                    350,
                    45,
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Select More Items'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
