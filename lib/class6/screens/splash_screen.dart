import 'package:bdapps/class6/screens/home_screen.dart';
import 'package:flutter/material.dart';

/* 

we will not give size manullay: use media quary:
Media_Quary: get infomation of the mobile,size,width,landscape etc.
*/
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (_, _, _) {
            return const HomeScreen();
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: .center,
            crossAxisAlignment: .center,
            children: [
              Icon(Icons.quiz_outlined, size: 100),
              SizedBox(height: 50),
              Text("Quiz Master", style: TextStyle(fontSize: 20)),
            ],
          ),
        ),
      ),
    );
  }
}
