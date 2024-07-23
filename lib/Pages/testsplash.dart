import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:animate_do/animate_do.dart';
import 'package:speedcheck_net/Pages/Afters.dart';


class Splash1 extends StatefulWidget {
  const Splash1({Key? key}) : super(key: key);

  @override
  State<Splash1> createState() => _SplashState();
}

class _SplashState extends State<Splash1> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    _controller.forward();
    Future.delayed(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => Asplash(),
        ),
      );
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Gradient Background
          Container(
            decoration: BoxDecoration(
              color: Color(0xFFF9F2E9),
            ),
          ),
          // Centered Truck Image
          Center(
            child: FadeInDown(
              // Add FadeInDown animation to the image
              duration: Duration(milliseconds: 1500),
              child: Image.asset(
                'assets/images/speedchecklogo.png',
                fit: BoxFit
                    .contain, // Ensure the image fits inside its container
                // Set width to 80% of screen width
              ),
            ),
          ),
          // Positioned Text
          Positioned(
            left: 0,
            right: 0,
            bottom: 60,
            child: AnimatedOpacity(
              opacity: _animation.value,
              duration: Duration(milliseconds: 500),
              child: Text(
                'Speedcheck.net',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'poppins',
                  color: Color(0xFF102C57), // Text color changed to white
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
