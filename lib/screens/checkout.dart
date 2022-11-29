import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';

import 'package:sales_order/screens/size_config.dart';

import 'dashboard.dart';
import 'select_item.dart';

enum PaymentOption { payOffline, payOnline }

enum AddressInfo { location }

// Initial Selected Value
String? dropdownvalue;
String? addressvalue;

// List of items in our dropdown menu
var items = ['Door', 'Walk-In'];

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
Future<void> showInformationDialog(BuildContext context) async {
  return await showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          //  SizeConfig().init(context);
          return Center(
            child: AlertDialog(
              title: const Text('Address Information'),
              scrollable: true,
              content: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      // mainAxisSize: MainAxisSize.max,

                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: TextFormField(
                            autofocus: false,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'First Name',
                              prefixIcon: Padding(
                                padding: EdgeInsets.only(top: 0),
                                child: Icon(Icons.account_box),
                              ),
                            ),
                            validator: (value) {
                              return value!.isNotEmpty
                                  ? null
                                  : 'Invalid field First Name';
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: TextFormField(
                            autofocus: false,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Last Name',
                              prefixIcon: Padding(
                                padding: EdgeInsets.only(top: 0),
                                child: Icon(Icons.account_box),
                              ),
                            ),
                            validator: (value) {
                              return value!.isNotEmpty
                                  ? null
                                  : 'Invalid field Last Name';
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: TextFormField(
                            autofocus: false,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Country/Region',
                              prefixIcon: Padding(
                                padding: EdgeInsets.only(top: 0),
                                child: Icon(Icons.flag),
                              ),
                            ),
                            validator: (value) {
                              return value!.isNotEmpty
                                  ? null
                                  : 'Invalid field Country/Region';
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: TextFormField(
                            autofocus: false,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Address',
                              prefixIcon: Padding(
                                padding: EdgeInsets.only(top: 0),
                                child: Icon(Icons.location_city_outlined),
                              ),
                            ),
                            validator: (value) {
                              return value!.isNotEmpty
                                  ? null
                                  : 'Invalid field Address';
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: TextFormField(
                            autofocus: false,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'City',
                              prefixIcon: Padding(
                                padding: EdgeInsets.only(top: 0),
                                child: Icon(Icons.location_city_sharp),
                              ),
                            ),
                            validator: (value) {
                              return value!.isNotEmpty
                                  ? null
                                  : 'Invalid field City';
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: TextFormField(
                            autofocus: false,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'State',
                              prefixIcon: Padding(
                                padding: EdgeInsets.only(top: 0),
                                child: Icon(Icons.satellite_alt_outlined),
                              ),
                            ),
                            validator: (value) {
                              return value!.isNotEmpty
                                  ? null
                                  : 'Invalid field State';
                            },
                          ),
                        ),
                        TextFormField(
                          autofocus: false,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Postal Code',
                            prefixIcon: Padding(
                              padding: EdgeInsets.only(top: 0),
                              child: Icon(Icons.add_call),
                            ),
                          ),
                          validator: (value) {
                            return value!.isNotEmpty
                                ? null
                                : 'Invalid field Postal Code';
                          },
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: TextFormField(
                            autofocus: false,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Phone (optional)',
                              prefixIcon: Padding(
                                padding: EdgeInsets.only(top: 0),
                                child: Icon(Icons.add_call),
                              ),
                            ),
                            validator: (value) {
                              return value!.isNotEmpty
                                  ? null
                                  : 'Invalid field Phone';
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      Navigator.of(context).pop();
                    }
                  },
                  child: const Text(
                    'Save Address',
                    style: TextStyle(fontSize: 20, color: Colors.green),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Checkout(),
                      ),
                    );
                  },
                  child: const Text(
                    'Cancel',
                    style: TextStyle(fontSize: 20, color: Colors.red),
                  ),
                ),
              ],
            ),
          );
        });
      });
}

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  PaymentOption _value = PaymentOption.payOffline;
  AddressInfo _values = AddressInfo.location;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DashBoard(),
                  ),
                );
              },
              icon: const Icon(Icons.arrow_back, size: 25),
            ),
            title: const Center(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(right: 35.0),
                  child: Text(
                    'Checkout',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Center(
                    child: SingleChildScrollView(
                      child: Container(
                        width: getProportionateScreenWidth(352),
                        height: getProportionateScreenHeight(360),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                                blurRadius: 8.0,
                                color: Colors.grey,
                                offset: Offset(0, 5)),
                          ],
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(
                                8.0,
                              ),
                              child: TextFormField(
                                readOnly: true,
                                decoration: const InputDecoration(
                                  hintText: 'Email',
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: 300,
                                top: 20,
                                left: 0,
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom +
                                        10,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                  Text('Ship to'),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 140.0),
                              child: RadioListTile(
                                subtitle: const Text('Lagos,LA,102216,NG'),
                                value: AddressInfo.location,
                                title: const Text('121 Ogba-Road'),
                                groupValue: _values,
                                onChanged: (AddressInfo? val) {
                                  setState(() {
                                    _values = val!;
                                  });
                                },
                              ),
                            ),
                            GestureDetector(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 18.0),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.add,
                                      size: 27,
                                      color: Colors.blue,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: GestureDetector(
                                        onTap: () async {
                                          await showInformationDialog(context);
                                        },
                                        child: const Text(
                                          'Use a diffrent address',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.blue,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              onTap: () async {
                                await showInformationDialog(context);
                              },
                            ),
                            const Divider(
                              color: Colors.grey,
                              thickness: 1,
                            ),
                            Column(
                              children: [
                                DropdownButton(
                                  hint: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text('Delivery Type:'),
                                  ),
                                  dropdownColor: Colors.white,
                                  icon: const Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.blue,
                                  ),
                                  iconSize: 36,

                                  isExpanded: true,
                                  underline: const SizedBox(),
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
                                  // Initial Value
                                  value: dropdownvalue,
                                  // Array list of items
                                  items: items.map((String items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(items),
                                      ),
                                    );
                                  }).toList(),
                                  // After selecting the desired option,it will
                                  // change button value to selected value
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      dropdownvalue = newValue!;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(15),
                  ),
                  Center(
                    child: SingleChildScrollView(
                      child: Container(
                        width: getProportionateScreenWidth(355),
                        height: getProportionateScreenHeight(360),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                                blurRadius: 8.0,
                                color: Colors.grey,
                                offset: Offset(0, 5)),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Form(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(bottom: 3.0),
                                  child: Text(
                                    'Subtotal:',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                                const Text(
                                  'Shipping Cost:',
                                  style: TextStyle(fontSize: 20),
                                ),
                                const Text(
                                  'Discount:',
                                  style: TextStyle(fontSize: 20),
                                ),
                                const Text(
                                  'Tax:',
                                  style: TextStyle(fontSize: 20),
                                ),
                                const Text(
                                  'Total:',
                                  style: TextStyle(fontSize: 20),
                                ),
                                const Text(
                                  'Available Credit:',
                                  style: TextStyle(fontSize: 20),
                                ),
                                const Text(
                                  'Amount to Pay:',
                                  style: TextStyle(fontSize: 20),
                                ),
                                const Divider(
                                  color: Colors.grey,
                                  thickness: 2,
                                ),
                                const Text(
                                  'Choose Payment Method',
                                  style: TextStyle(fontSize: 20),
                                ),
                                RadioListTile(
                                  value: PaymentOption.payOffline,
                                  title: const Text('Pay Offline'),
                                  groupValue: _value,
                                  onChanged: (PaymentOption? val) {
                                    setState(() {
                                      _value = val!;
                                    });
                                  },
                                ),
                                RadioListTile(
                                  value: PaymentOption.payOnline,
                                  title: const Text('Pay Online'),
                                  groupValue: _value,
                                  onChanged: (PaymentOption? val) {
                                    setState(() {
                                      _value = val!;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(
                        20.0,
                      ),
                      child: AnimatedButton(
                        height: getProportionateScreenHeight(45),
                        width: getProportionateScreenWidth(126),
                        text: 'Confirm',
                        animationDuration: const Duration(seconds: 2),
                        textStyle: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                        onPress: () {
                          if (PaymentOption.payOffline == _value) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SelectItemScreen(),
                              ),
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const DashBoard(),
                              ),
                            );
                          }
                        },
                        gradient: const LinearGradient(
                          colors: [Colors.blueGrey, Colors.blue],
                        ),
                        selectedGradientColor: const LinearGradient(
                            colors: [Colors.blue, Colors.blueGrey]),
                        selectedTextColor: Colors.black,
                        transitionType: TransitionType.LEFT_BOTTOM_ROUNDER,
                        isReverse: true,
                        borderColor: Colors.white,
                        borderRadius: 45,
                      ),
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
