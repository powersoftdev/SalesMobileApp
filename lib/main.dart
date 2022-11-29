// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sales_order/Screens/dashboard.dart';

import 'package:sales_order/Screens/login_screen.dart';
import 'package:sales_order/Store/MyStore.dart';
import 'package:sales_order/provider/auth_provider.dart';
import 'package:sales_order/provider/user_provider.dart';
import 'package:sales_order/utility/shared_preference.dart';

import 'Screens/basketPage.dart';
import 'domain/user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Future<User> getUserData() => UserPreferences().getUser();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => MyStore())
      ],
      child: MaterialApp(
        home: LoginScreen(),
        routes: {
          '/login_screen': (context) => LoginScreen(),
          '/dashboard': (context) => DashBoard(),
          '/basketPage': (context) => BasketPage(),
        },
      ),
    );
  }
}
