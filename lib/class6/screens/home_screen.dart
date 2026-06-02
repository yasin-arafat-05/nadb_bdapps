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
              child: Column(
                children: [
                  Text("Good Morning", style: TextStyle(color: Colors.white)),
                  Text("Ready To Learn", style: TextStyle(color: Colors.white)),
                ],
              ),
            ),

            // --------------Functionality------------------
            ElevatedButton(
              onPressed: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (context) => QuizeScreen()));
              },
              child: Text("Start Quiz"),
            ),
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
