import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:speedcheck_net/Pages/Loginpage.dart';

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
          color: Color(0xFFF9F2E9),
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
                    'Want to know your internet speed?',
                    'Know it quickly no adware,no datasharing,no thirdparty cookies',
                  ),
                  Column1(
                    context,
                    'assets/images/pageview2.png',
                    'No catchy headline needed!',
                    'Because it\'s ad free!',
                  ),
                  Column2(
                    context,
                    'assets/images/pageview1.png',
                    'Speedcheck.net',
                    'Check your internet speed now',
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

  Column Column1(BuildContext context, String p1, String t1, String t2) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: <Widget>[
        SizedBox(
          height: 50,
        ),
        Container(
          width: screenWidth * 0.98,
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
                    width: screenWidth * 0.6,
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
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Text(
                      t2,
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
            ],
          ),
        ),
      ],
    );
  }

  Column Column2(BuildContext context, String p1, String t1, String t2) {
    return Column(
      children: <Widget>[
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
                    child: Text(
                      t1,
                      style: TextStyle(
                        fontFamily: 'RobotoSerif',
                        color: Color(0xFF102C57),
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Text(
                      '',
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
                height: 80,
              ),
              Padding(
                padding: EdgeInsets.all(30.0),
                child: Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Login()),
                        );
                      },
                      child: FadeInUp(
                        duration: Duration(milliseconds: 800),
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
                    FadeInUp(
                      duration: Duration(milliseconds: 2000),
                      child: Row(
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
