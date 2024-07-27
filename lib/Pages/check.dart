import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:speedcheck_net/Pages/speedcheck.dart';

class check extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Container(
        color: Color.fromARGB(255, 255, 255, 255),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: (){
                Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SpeedCheckNet()),
            );

              },
              child: Image.asset(
                'assets/images/checkspeed.gif',
                fit:BoxFit.contain,
                width: MediaQuery.of(context).size.width*0.9,
              ),
            )
          ],
        )
    
    );
  }
} 