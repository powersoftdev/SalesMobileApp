// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sales_order/Screens/login_screen.dart';
import 'package:sales_order/Store/MyStore.dart';

void main() {
  return runApp( 
    ChangeNotifierProvider(
      create: (BuildContext context) {
        return MyStore();
        
      },
      child: MaterialApp(
        home: LoginScreen(),
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}
