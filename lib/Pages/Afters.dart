import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:speedcheck_net/Pages/check.dart';

class Asplash extends StatefulWidget {
  @override
  _AsplashState createState() => _AsplashState();
}

class _AsplashState extends State<Asplash> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                children: [
                  Column1(
                    context,
                    'assets/images/pageview3.png',
                    'Quickly assess your Internet speed with our app',
                  ),
                  Column1(
                    context,
                    'assets/images/pageview2.png',
                    'That\'s 100% ad free!',
                  ),
                  Column2(
                    context,
                    'assets/images/pageview1.png',
                    'Check your Internet speed now'
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SmoothPageIndicator(
                controller: _pageController,
                count: 3,
                effect: WormEffect(
                  dotColor: Colors.grey,
                  activeDotColor: Color(0xFF102C57),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column Column1(BuildContext context, String p1, String t1) {
    return Column(
      children: <Widget>[
        SizedBox(height: 40),
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          child: Image.asset(
            p1,
            fit: BoxFit.contain,
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Expanded(
          child: Column(
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Text(
                      t1,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'RobotoSerif',
                        color: Color(0xFF102C57),
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Column Column2(BuildContext context, String p1, String t1) {
    return Column(
      children: <Widget>[
        SizedBox(height: 40),
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          child: Image.asset(
            p1,
            fit: BoxFit.contain,
          ),
        ),
        Expanded(
          child: Column(
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Text(
                      t1,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'RobotoSerif',
                        color: Color(0xFF102C57),
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Text(
                      '',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'RobotoSerif',
                        color: Color(0xFF102C57),
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.all(30.0),
                child: Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => check()),
                        );
                      },
                      child: FadeInUp(
                        duration: Duration(milliseconds: 1900),
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFF102C57),
                                Color(0xFF102C57),
                              ],
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "Get started!",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Made with ",
                          style: TextStyle(color: Color(0xFF102C57)),
                        ),
                        Icon(
                          Icons.favorite,
                          color: Color(0xFFFC4100),
                        ),
                        Text(
                          " by Pseudocraft",
                          style: TextStyle(color: Color(0xFF102C57)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
