// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:sales_order/Screens/dashboard.dart';
import 'package:sales_order/screens/registration.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  var _userName, _password;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context) => Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 70,
                  width: 120,
                  color: Colors.white,
                  padding: EdgeInsets.only(top: 30.0, left: 20.0),
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.blue.shade700,
                    ),
                  ),
                ),
                Container(
                  height: 180.5,
                  width: double.infinity,
                  color: Colors.white,
                  padding: EdgeInsets.only(top: 20.0, left: 20.0),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 80,
                        backgroundImage: AssetImage('lib/images/newPhone.jpg'),
                      ),
                    ],
                  ),
                ),
                Stack(
                  children: [
                    Container(
                      height: 460,
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
                            key: _key,
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
                                  onSaved: (value) => _userName = value,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                TextFormField(
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
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Field is required.';
                                    }
                                    String pattern =
                                        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*[0-9]).{8,}$';
                                    if (!RegExp(pattern).hasMatch(value)) {
                                      return 'Invalid Password format.';
                                    }
                                    // password most contain a uppercase letter,number,lowercase letter and it must be at least 8 characters
                                    return null;
                                  },
                                  onSaved: (value) => _password = value,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                FloatingActionButton(
                                  onPressed: () {
                                    if (_key.currentState!.validate()) {
                                      _key.currentState!.save();
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const DashBoard(),
                                        ),
                                      );
                                    }
                                  },
                                  child: Icon(Icons.forward),
                                ),
                                Container(
                                  width: double.infinity,
                                )
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Register(),
                              ),
                            );
                          },
                          child: SizedBox(
                            height: 20,
                            child: Text(
                              'Forget your password? Click here',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
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
    );
  }
}
