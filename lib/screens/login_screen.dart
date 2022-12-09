// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:sales_order/Screens/dashboard.dart';
import '../Model/customer.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  dynamic customerName;
  String? token;

  String password = '';

  // late final SharedPreferences _prefs = await SharedPreferences.getInstance();

  Future<void> callApi() async {
    print(emailcontroller.text);
    print(passwordcontroller.text);

    showDialog(
      context: context,
      builder: (context) {
        return Center(child: CircularProgressIndicator());
      },
    );

    var url = Uri.parse(
        'https://powersoftrd.com/PEMAPI/api/CustomerLoginEmail/741258?Email=' +
            emailcontroller.text +
            '&Password=' +
            passwordcontroller.text);
    print(url);
    var response = await http.get(url, headers: {
      "Access-Control-Allow-Origin": "*",
    });
    final CustomerModel responseData = CustomerModelFromJson(response.body);

    var customerInformation = responseData.data.first;
    var customerName = customerInformation.customerName;

    if (responseData.status == 'Success') {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      await prefs.setString('customerEmail', emailcontroller.text);
      await prefs.setString('customerName', customerName);
      await prefs.setString('token', responseData.authToken);
      String? tokenFromSP = prefs.getString('token');

      print(customerName);
      print('responseData.authToken: ' + responseData.authToken);
      print('token from sp: ' + tokenFromSP!);
    }

    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => DashBoard()));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context) => Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 180.0,
                    width: double.infinity,
                    color: Colors.white,
                    padding: EdgeInsets.only(top: 5.0, left: 20.0),
                    child: Row(
                      children: [
                        Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.blue.shade700,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        CircleAvatar(
                          radius: 80,
                          backgroundImage:
                              AssetImage('lib/images/newPhone.jpg'),
                        ),
                      ],
                    ),
                  ),
                  Stack(
                    children: [
                      Container(
                        height: 660,
                        decoration: BoxDecoration(
                          color: Colors.blue.shade700,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(100),
                            topRight: Radius.circular(100),
                            bottomLeft: Radius.circular(0),
                            bottomRight: Radius.circular(0),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            height: 300,
                            width: 500,
                            margin: EdgeInsets.fromLTRB(20, 80, 20, 20),
                            padding: EdgeInsets.only(
                                top: 20.0, left: 15.0, right: 15.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Form(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Center(
                                    child: Text(
                                      'Please sign in to continue',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue.shade700,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    controller: emailcontroller,
                                    autofocus: false,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'Email address',
                                      prefixIcon: Padding(
                                        padding: EdgeInsets.only(top: 0),
                                        child: Icon(Icons.email),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            width: 3, color: Colors.blue),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'E-mail is required.';
                                      }
                                      String pattern = r'\w+@\w+\.\w+';
                                      if (!RegExp(pattern).hasMatch(value)) {
                                        return 'Invalid E-mail Address format.';
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    controller: passwordcontroller,
                                    autofocus: false,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'Password',
                                      prefixIcon: Padding(
                                        padding: EdgeInsets.only(top: 0),
                                        child: Icon(Icons.lock),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            width: 3, color: Colors.blue),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    obscureText: true,
                                    // validator: (value) {
                                    //   if (value == null || value.isEmpty) {
                                    //     return 'Field is required.';
                                    //   }
                                    //   String pattern =
                                    //       r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*[0-9]).{8,}$';
                                    //   if (!RegExp(pattern).hasMatch(value)) {
                                    //     return 'Invalid Password format.';
                                    //   }
                                    //   // password most contain a uppercase letter,number,lowercase letter and it must be at least 8 characters
                                    //   return null;
                                    // },
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  FloatingActionButton(
                                    onPressed: callApi,
                                    child: Icon(Icons.forward),
                                  ),
                                  Container(
                                    width: double.infinity,
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                            child: Text(
                              'Forget your password? Click here',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
