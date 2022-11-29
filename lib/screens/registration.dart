// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_function_declarations_over_variables

import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:sales_order/provider/auth_provider.dart';
import 'package:sales_order/screens/login_screen.dart';
import 'package:sales_order/utility/validator.dart';
import 'package:sales_order/utility/widgets.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  Duration get loginTime => Duration(milliseconds: timeDilation.ceil() * 2250);
  final formKey = GlobalKey<FormState>();
  var _userName, _password, _confirmPassword;

  @override
  Widget build(BuildContext context) {
    AuthProvider auth = Provider.of<AuthProvider>(context);

    var loading = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircularProgressIndicator(),
        Text(" Registering ... Please wait")
      ],
    );

    var doRegister = () {
      print('on doRegister');

      final form = formKey.currentState;
      if (form!.validate()) {
        form!.save();

        auth.loggedInStatus = Status.Authenticating;
        auth.notify();

        Future.delayed(loginTime).then((_) {
          Navigator.pushReplacementNamed(context, '/login');
          auth.loggedInStatus = Status.LoggedIn;
          auth.notify();
        });

        /*// now check confirm password
        if(_password.endsWith(_confirmPassword)){
          auth.register(_username, _password).then((response) {
            if(response['status']){
              User user = response['data'];
              Provider.of<UserProvider>(context,listen: false).setUser(user);
              Navigator.pushReplacementNamed(context, '/login_screen');
            }else{
              Flushbar(
                title: 'Registration fail',
                message: response.toString(),
                duration: Duration(seconds: 10),
              ).show(context);
            }
          });
        }else{
          Flushbar(
            title: 'Mismatch password',
            message: 'Please enter valid confirm password',
            duration: Duration(seconds: 10),
          ).show(context);
        }*/
      } else {
        Flushbar(
          title: 'Invalid form',
          message: 'Please complete the form properly',
          duration: Duration(seconds: 10),
        ).show(context);
      }
    };
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(40),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                      borderSide:
                          const BorderSide(width: 3, color: Colors.blue),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  validator: validateEmail,
                  // validator: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return 'E-mail is required.';
                  //   }
                  //   String pattern = r'\w+@\w+\.\w+';
                  //   if (!RegExp(pattern).hasMatch(value)) {
                  //     return 'Invalid E-mail Address format.';
                  //   }
                  //   return null;
                  // },
                  onSaved: (value) => _userName = value,
                ),
                SizedBox(height: 20),
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
                      borderSide:
                          const BorderSide(width: 3, color: Colors.blue),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  obscureText: true,
                  validator: (value) =>
                      value!.isEmpty ? 'Please enter password' : null,
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
                  onSaved: (value) => _password = value,
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  autofocus: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Confirm Password',
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(top: 0),
                      child: Icon(Icons.lock),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 3, color: Colors.blue),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  obscureText: true,
                  validator: (value) =>
                      value!.isEmpty ? 'Please enter password' : null,
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
                  onSaved: (value) => _confirmPassword = value,
                ),
                SizedBox(
                  height: 20.0,
                ),
                auth.loggedInStatus == Status.Authenticating
                    ? loading
                    : longButtons('Register', doRegister)

                // SizedBox(
                //   height: 30,
                // ),
                // ElevatedButton(
                //   style: ElevatedButton.styleFrom(
                //       shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(20.0),
                //       ),
                //       backgroundColor: Colors.blue[300],
                //       fixedSize: const Size(
                //         350,
                //         45,
                //       )),
                //   onPressed: () {
                //     final form = formKey.currentState;
                //     form!.save();

                //     print(_userName);
                //     print(_password);
                //     print(_confirmPassword);

                //     Navigator.push(context,
                //         MaterialPageRoute(builder: (context) => LoginScreen()));
                //   },
                //   child: Text('Register'),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
