import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:speedcheck_net/Pages/Afters.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: ScreenTypeLayout.builder(
          mobile: (BuildContext context) => Mobilelayout(),
          desktop: (BuildContext context) => Mobilelayout(),
          tablet: (BuildContext context) => Mobilelayout(),
        ),
      ),
    );
  }
}

class Mobilelayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Asplash(),
    );
  }
}
