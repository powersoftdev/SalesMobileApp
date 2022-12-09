import 'package:flutter/material.dart';
import '../../Screens/login_screen.dart';
import '../../Screens/select_item.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  String customerName = "";
  late final SharedPreferences _prefs;

  @override
  void initState() {
    getStringValuesSF();
    super.initState();
  }

  getStringValuesSF() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      customerName = _prefs.getString('customerName') ?? "";
    });
    return customerName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('DashBoard')),
        //resizeToAvoidBottomInset: false,
        // backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome ,$customerName',
              style: TextStyle(
                fontSize: 30,
                color: Colors.blue[900],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Text(
                'Sales Bookings',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.blue[900],
                ),
              ),
            ),
            // Container(
            //   height: 60,
            //   width: 400,
            //   color: Colors.red,
            //   padding: const EdgeInsets.only(
            //     top: 10.0,
            //     left: 20.0,
            //   ),
            //   child: Text(
            //     'Welcome ,$customerName',
            //     style: TextStyle(
            //       fontSize: 30,
            //       color: Colors.blue[900],
            //     ),
            //   ),
            // ),
            // Container(
            //   height: 80,
            //   // width: 100,
            //   color: Colors.green,
            //   padding: const EdgeInsets.only(
            //     top: 25.0,
            //     left: 90.0,
            //   ),
            //   child: Text(
            //     'Sales Bookings',
            //     style: TextStyle(
            //       fontSize: 30,
            //       color: Colors.blue[900],
            //     ),
            //   ),
            // ),
            Stack(children: [
              Container(
                height: 446,
                //  width: 100,
                decoration: BoxDecoration(
                  color: Colors.blue[700],
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(100),
                    topRight: Radius.circular(100),
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                  ),
                ),
                padding: const EdgeInsets.only(
                    left: 60, right: 60, top: 25, bottom: 400),
                //margin: const EdgeInsets.only(top: 80),
                child: const Center(
                  child: Text(
                    'What would you like to do?',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 30, bottom: 400),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SelectItemScreen(),
                        ),
                      );
                    },
                    child: const CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 70,
                      child: Icon(
                        Icons.local_offer_outlined,
                        size: 60,
                      ),
                    ),
                  ),
                ],
              ),
              Row(children: [
                const Padding(
                  padding: EdgeInsets.only(right: 210, bottom: 400),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  },
                  child: const CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 70,
                    child: Icon(
                      Icons.account_circle_sharp,
                      size: 60,
                    ),
                  ),
                ),
              ]),
              const Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 300, left: 5, right: 200),
                  child: Text(
                    "View Catlog",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 300, left: 190, right: 20),
                  child: Text(
                    "Profile",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ]),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue[500],
        unselectedItemColor: Colors.blue[500],
        selectedFontSize: 18,
        unselectedFontSize: 18,
        iconSize: 32,
        // currentIndex: 1,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_offer_outlined),
            label: 'View Catlog',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_sharp),
            label: 'Profile',
          ),
        ],
        onTap: (int index) {
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
              break;
            default:
          }
          switch (index) {
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const SelectItemScreen()),
              );
              break;
            default:
          }
          switch (index) {
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
              break;
            default:
          }
        },
      ),
    );
  }
}
