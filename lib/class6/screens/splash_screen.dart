import 'package:bdapps/class6/screens/home_screen.dart';
import 'package:bdapps/class6/theme/app_theme.dart';
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

/*
Two type of animation:
- explicit animation 
- implicit animation
*/
class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  // for doing animation we need an controler and for animation we need variable:
  late AnimationController _logoAnimationController;
  late Animation<double> _logScaleAnimation;
  late Animation<double> _logOpacityAnimation;
  @override
  void initState() {
    super.initState();

    // for doing animation we need to define an controller:
    // vsync -> animation sync with mobile referesh rate:
    _logoAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );

    // from where(begin) to where(end) ---> (between),
    _logScaleAnimation = Tween(begin: 0.4, end: 1.0).animate(
      CurvedAnimation(parent: _logoAnimationController, curve: Curves.easeOut),
    );

    _logOpacityAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _logoAnimationController,
        curve: Interval(0.0, 0.5),
      ),
    );
    _runAnimation();
  }

  // how to control the animation
  Future<void> _runAnimation() async {
    // it will run the
    await _logoAnimationController.forward();
    Future.delayed(Duration(seconds: 5), () {
      // mounted->means:
      if (mounted) {
        Navigator.of(context).pushReplacement(
          PageRouteBuilder(
            pageBuilder: (_, _, _) {
              return const HomeScreen();
            },
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primaryBlue,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: .center,
            crossAxisAlignment: .center,
            children: [
              // we want to add an animation this container:
              AnimatedBuilder(
                animation: _logoAnimationController,
                builder: (context, Widget? _) {
                  // here we will give all the animation that we careate:
                  return Opacity(
                    opacity: _logOpacityAnimation.value,
                    child: Transform.scale(
                      scale: _logScaleAnimation.value,
                      child: Container(
                        width: 200,
                        height: 300,
                        decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Icon(
                          Icons.quiz_outlined,
                          size: 100,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 50),
              Text("Quiz Master", style: TextStyle(fontSize: 20)),
            ],
          ),
        ),
      ),
    );
  }
}
