import 'dart:math' as math;
import 'dart:ui';

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

// class _SplashScreenState extends State<SplashScreen>
//     with TickerProviderStateMixin {
//   // for doing animation we need an controler and for animation we need variable:
//   late AnimationController _logoAnimationController;
//   late Animation<double> _logScaleAnimation;
//   late Animation<double> _logOpacityAnimation;
//   @override
//   void initState() {
//     super.initState();

//     // for doing animation we need to define an controller:
//     // vsync -> animation sync with mobile referesh rate:
//     _logoAnimationController = AnimationController(
//       vsync: this,
//       duration: Duration(milliseconds: 800),
//     );

//     // from where(begin) to where(end) ---> (between),
//     _logScaleAnimation = Tween(begin: 0.4, end: 1.0).animate(
//       CurvedAnimation(parent: _logoAnimationController, curve: Curves.easeOut),
//     );

//     _logOpacityAnimation = Tween(begin: 0.0, end: 1.0).animate(
//       CurvedAnimation(
//         parent: _logoAnimationController,
//         curve: Interval(0.0, 0.5),
//       ),
//     );
//     _runAnimation();
//   }

//   // how to control the animation
//   Future<void> _runAnimation() async {
//     // it will run the
//     await _logoAnimationController.forward();
//     Future.delayed(Duration(seconds: 5), () {
//       // mounted->means:
//       if (mounted) {
//         Navigator.of(context).pushReplacement(
//           PageRouteBuilder(
//             pageBuilder: (_, _, _) {
//               return const HomeScreen();
//             },
//           ),
//         );
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppTheme.primaryBlue,
//       body: SafeArea(
//         child: Center(
//           child: Column(
//             mainAxisAlignment: .center,
//             crossAxisAlignment: .center,
//             children: [
//               // we want to add an animation this container:
//               AnimatedBuilder(
//                 animation: _logoAnimationController,
//                 builder: (context, Widget? _) {
//                   // here we will give all the animation that we careate:
//                   return Opacity(
//                     opacity: _logOpacityAnimation.value,
//                     child: Transform.scale(
//                       scale: _logScaleAnimation.value,
//                       child: Container(
//                         width: 200,
//                         height: 300,
//                         decoration: BoxDecoration(
//                           color: Colors.blueGrey,
//                           borderRadius: BorderRadius.circular(25),
//                         ),
//                         child: Icon(
//                           Icons.quiz_outlined,
//                           size: 100,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//               SizedBox(height: 50),
//               Text("Quiz Master", style: TextStyle(fontSize: 20)),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primaryBlue,
      body: SafeArea(
        child: Container(
          color: Colors.grey.shade600,
          child: CustomPaint(
            size: Size(double.infinity, double.infinity),

            // here we will pass custom painter but it's a abstract class:
            // we need to extends it's body
            painter: MasterPainter(progress: 0.4),
          ),
        ),
      ),
    );
  }
}

// =======================================================
class MasterPainter extends CustomPainter {
  final double progress; // 0.0 to 1.0
  MasterPainter({this.progress = 1.0});
  /*
    - As it's a abstract class we need to must implement 
        - paint: here we will create objects etc.
        - shouldRepain: For repainting. 
  */
  @override
  void paint(Canvas canvas, Size size) {
    // define center of the circle:
    final Offset center = Offset(size.width / 2, size.height / 2);
    // define radious of the circle:
    const double radious = 100.0;
    // paint: desing, color, filled or void etc.
    final Paint paint = Paint()
      ..color = const Color.fromARGB(255, 152, 190, 221)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5.0
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;

    // now create dancing wave:
    final Path path = Path();
    // we take 360 points on the circle
    const int points = 360;
    //
    const int waveCount = 30;
    const double A = 10.0;
    for (int i = 0; i < points; i++) {
      final double angle = (i * 2 * math.pi) / points;

      // wave effect: y = Asin(omega.T)
      final double wave = A * math.sin(waveCount * angle);

      // wave dancing + static circle:
      final double r = radious + wave;

      // find conridate points:
      final double x = center.dx + r * math.cos(angle);
      final double y = center.dy + r * math.sin(angle);

      // insert values:
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    // Progress Logic
    // // 0.3, 0.5, 0.8, 1.0
    // 0.3 -> show 30% of the circle,
    // 0.5 -> 50% of the cirle
    if (progress < 1.0) {
      final PathMetrics metrics = path.computeMetrics();
      final Path visiblePath = Path();

      for (final metric in metrics) {
        final double length = metric.length * progress;
        visiblePath.addPath(metric.extractPath(0, length), Offset.zero);
      }
      canvas.drawPath(visiblePath, paint);
    } else {
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant MasterPainter oldDelegate) {
    // we don't need to repaint
    return oldDelegate.progress != progress;
  }
}
