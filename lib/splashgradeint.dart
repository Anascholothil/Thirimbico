import 'dart:async';

import 'package:flutter/material.dart';
import 'package:thirmbico/constance/callfunction.dart';
import 'package:thirmbico/signup.dart';
import 'package:thirmbico/LoginScreen.dart';

class Splashstrike extends StatefulWidget {
  const Splashstrike({super.key});

  @override
  State<Splashstrike> createState() => _SplashstrikeState();
}

class _SplashstrikeState extends State<Splashstrike> {
  @override

  void initState (){
    Timer(const Duration(seconds: 4),(){
      callNextReplacement(context, LoginScreen());
     }
    );
    super.initState();
  }
  Widget   build (BuildContext context) {
    return Scaffold(




        body:
            // Container(
            //   decoration: BoxDecoration(gradient: LinearGradient(
            //       colors:[Color(0xfffae0f9),Color(0xffEDB1F7),Color(0xffEDB1F7),Color(0xffedb1f7),Color(0xffFBE1FF)],
            //     begin: Alignment.topLeft,
            //     end: Alignment.bottomRight,
            //
            //
            //
            //
            //   )),
            // ),
            Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/spash arab.png",
          ),
          fit: BoxFit.fill,

        ),
      ),
    ),
    );
  }
}
