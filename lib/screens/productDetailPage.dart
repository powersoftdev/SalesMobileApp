// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:number_inc_dec/number_inc_dec.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:sales_order/Store/MyStore.dart';
import 'basketPage.dart';

class ProductDetailpage extends StatefulWidget {
  const ProductDetailpage({super.key});

  @override
  State<ProductDetailpage> createState() => _ProductDetailpageState();
}

class _ProductDetailpageState extends State<ProductDetailpage> {
  TextEditingController _date = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var store = Provider.of<MyStore>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // appBar: AppBar(
      //   title: Text('Product Details'),
      //   actions: [
      //     IconButton(
      //       icon: Icon(Icons.shopping_cart),
      //       onPressed: () {
      //         Navigator.push(context,
      //             MaterialPageRoute(builder: (context) => BasketPage()));
      //       },
      //       iconSize: 40,
      //     ),
      //     Text(
      //       store.getBasketQty().toString(),
      //       style: TextStyle(color: Colors.red),
      //     ),
      //   ],
      // ),
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
                  // icon:
                  //     Icon(Icons.calendar_today_rounded),
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
                // padding: EdgeInsets.only(left: 15),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                  ),
                ),
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
                      child: Text(
                        store.activeProduct!.qty.toString(),
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
                    fixedSize: const Size(
                      350,
                      45,
                    ),
                    primary: Colors.blue[300]),
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
                  fixedSize: const Size(
                    350,
                    45,
                  ),
                  primary: Colors.blue[300],
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
                  fixedSize: const Size(
                    350,
                    45,
                  ),
                  primary: Colors.red[300],
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
