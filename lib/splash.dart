import 'dart:async';

import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});
  @override
  State<Splash> createState() => _SplashState();
}
class _SplashState extends State<Splash> {
  void initState(){
    Timer(Duration(seconds: 3),()=>Navigator.of(context).pushReplacementNamed('/login'));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Center(
        child:Image.asset('assets/images/infinity.gif'),
      ) ,
    );
  }
}

