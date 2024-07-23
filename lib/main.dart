import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:speedcheck_net/Pages/testsplash.dart';

void main() {
  
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My App',
      theme: ThemeData(
          primarySwatch: Colors.amber,
        fontFamily: GoogleFonts.poppins().fontFamily),
      initialRoute: '/',
      routes: {
        '/': (context) => Splash1(),
      
      },
    );
  }
}
