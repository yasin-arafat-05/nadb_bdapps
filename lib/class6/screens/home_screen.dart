import 'package:bdapps/class6/screens/profile_screen.dart';
import 'package:bdapps/class6/screens/quize_screen.dart';
import 'package:bdapps/class6/theme/app_theme.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('DashBoard'), centerTitle: true),
      body: SafeArea(
        child: Column(
          children: [
            // --------------Welcome Messge---------------
            Container(
              decoration: BoxDecoration(color: AppTheme.primaryBlue),
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(30),
              child: Stack(
                children: [
                  Column(
                    spacing: 20,
                    children: [
                      Text(
                        "Good Morning",
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        "Ready To Learn",
                        style: TextStyle(color: Colors.white),
                      ),
                      Row(
                        mainAxisAlignment: .spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(color: Colors.orange),
                            child: Text('12 Questions'),
                          ),
                          Container(
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(color: Colors.orange),
                            child: Text('12 Questions'),
                          ),
                          Container(
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(color: Colors.orange),
                            child: Text('12 Questions'),
                          ),
                        ],
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Column(
                          children: [
                            Text("Flutter Quiz"),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => QuizeScreen(),
                                  ),
                                );
                              },
                              child: Text("Start Quiz"),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // -------------- Functionality Button ------------------
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ProfileScreen()),
                );
              },
              child: Text("Show Profile"),
            ),
          ],
        ),
      ),
    );
  }
}
