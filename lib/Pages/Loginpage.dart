import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:speedcheck_net/Pages/check.dart';
import 'package:speedcheck_net/Pages/speedcheck.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _loginState();
}

class _loginState extends State<Login> with SingleTickerProviderStateMixin {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _userIdController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xFFF9F2E9),
        ),
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: Image.asset(
                    'assets/images/login.png', // Provide the path to your SVG image
                    fit: BoxFit.contain,
                  ),
                ),
                Row(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Positioned(
                          child: FadeInUp(
                            duration: Duration(milliseconds: 1600),
                            child: Container(
                              margin: EdgeInsets.fromLTRB(30, 20, 0, 0),
                              child: Center(
                                child: Text(
                                  "Login to your account",
                                  style: TextStyle(
                                    color: Color(0xFF102C57),
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Column(
                    children: <Widget>[
                      FadeInUp(
                        duration: Duration(milliseconds: 1800),
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Color(0xFF102C57),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(143, 148, 251, .2),
                                blurRadius: 20.0,
                                offset: Offset(0, 10),
                              ),
                            ],
                          ),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Color(0xFF102C57),
                                    ),
                                  ),
                                ),
                                child: TextField(
                                  controller: _userIdController,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Email or Phone number",
                                    hintStyle: TextStyle(
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(8.0),
                                child: TextField(
                                  controller: _passwordController,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Password",
                                    hintStyle: TextStyle(
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      FadeInUp(
                        duration: Duration(milliseconds: 1900),
                        child: ElevatedButton(
                          onPressed: _login,
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Color(0xFF102C57), // Background color
                            foregroundColor: Color(0xFFEDEDF9), // Text color
                            textStyle: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 18,
                              letterSpacing: 0,
                            ),
                            padding:
                                EdgeInsets.symmetric(horizontal: 24), // Padding
                            minimumSize: Size(
                                MediaQuery.of(context).size.width * 0.7,
                                60), // Size
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide(
                                  color: Colors.transparent, width: 1),
                            ),
                          ),
                          child: Text('Login'),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      FadeInUp(
                        duration: Duration(milliseconds: 2000),
                        child: Text(
                          "Create new account",
                          style: TextStyle(
                            color: Color(0xFF102C57),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      FadeInUp(
                        duration: Duration(milliseconds: 2000),
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(
                            color: Color(0xFF102C57),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _login() {
    String userId = _userIdController.text.toUpperCase();
    String password = _passwordController.text;

    if (userId == 'DEMO' && password == '1234') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => check()),
      );
    } else {
      // Show error message or handle invalid login
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Invalid login ID or password'),
        ),
      );
    }
  }
}
