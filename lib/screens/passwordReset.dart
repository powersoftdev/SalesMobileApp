import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class PasswordReset extends StatefulWidget {
  const PasswordReset({super.key});

  @override
  State<PasswordReset> createState() => _PasswordResetState();
}

class _PasswordResetState extends State<PasswordReset> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Reset Password'),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            TextFormField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 20),
                fillColor: Colors.white,
                filled: true,
                border: const OutlineInputBorder(),
                labelText: 'Current Password',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Colors.blueAccent),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 20),
                fillColor: Colors.white,
                filled: true,
                border: const OutlineInputBorder(),
                labelText: 'Enter New Password',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Colors.blueAccent),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextFormField(
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
              onPressed: () {},
              child: Text('Change Password'),
            ),
          ],
        ),
      ),
    );
  }
}
