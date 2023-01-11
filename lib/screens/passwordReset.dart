// ignore_for_file: use_build_context_synchronously, prefer_const_constructors, body_might_complete_normally_nullable, avoid_print, unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// import 'package:sales_order/Model/changePassword.dart';
import '../Model/changePassword.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:form_field_validator/form_field_validator.dart';

class PasswordReset extends StatefulWidget {
  const PasswordReset({super.key});

  @override
  State<PasswordReset> createState() => _PasswordResetState();
}

class _PasswordResetState extends State<PasswordReset> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  final passwordcontroller = TextEditingController();
  final newpasswordcontroller = TextEditingController();
  final confirmpasswordcontroller = TextEditingController();

  String password = '';
  String confirmPassword = '';
  String currentPassword = '';
  String? token;
  dynamic customerId;

  Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
    customerId = prefs.getString('customerId');

    print('token : ${token}');
    print(customerId);
  }

  void changePwdApi() async {
    await getToken();

    http.Response response = await http.post(
        Uri.parse(
            'https://powersoftrd.com/PEMAPI/api/ChangePasswordCustomer/741258?'),
        body: jsonEncode(changePassword(
            username: customerId,
            oldPassword: currentPassword,
            newPassword: password)),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });

    print(response.body);

    if (response.statusCode == 200) {
      final text = 'Password Reset Successful',
          snackBar = SnackBar(content: Text(text));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);

      Navigator.pop(context);
    } else {
      final text = 'Password Reset not Successful..Please try again',
          snackBar = SnackBar(content: Text(text));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Reset Password'),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Form(
          key: formkey,
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: passwordcontroller,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                autofocus: false,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(left: 20),
                  fillColor: Colors.white,
                  filled: true,
                  border: const OutlineInputBorder(),
                  labelText: 'Current Password',
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 2, color: Colors.blueAccent),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onChanged: (value) {
                  currentPassword = value;
                },
                validator: MultiValidator(
                  [
                    RequiredValidator(errorText: 'Required'),
                    MaxLengthValidator(15,
                        errorText: 'Not more than 15 Characters'),
                    MinLengthValidator(8,
                        errorText: 'Should be at least 8 Characters')
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: newpasswordcontroller,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                autofocus: false,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(left: 20),
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(),
                  labelText: 'Enter New Password',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Colors.blueAccent),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onChanged: (value) {
                  password = value;
                },
                validator: MultiValidator(
                  [
                    RequiredValidator(errorText: 'Required'),
                    MaxLengthValidator(15,
                        errorText: 'Not more than 15 Characters'),
                    MinLengthValidator(8,
                        errorText: 'Should be at least 8 Characters')
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: confirmpasswordcontroller,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                autofocus: false,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 20),
                  fillColor: Colors.white,
                  filled: true,
                  border: const OutlineInputBorder(),
                  labelText: 'Confirm New Password',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Colors.blueAccent),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onChanged: (value) {
                  confirmPassword = value;
                },
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return 'Confirm password is required please enter';
                  }
                  if (value != password) {
                    return 'Confirm password not matching';
                  }
                  return null;
                },
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
                  ),
                ),
                onPressed: changePwdApi,
                child: Text('Change Password'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
