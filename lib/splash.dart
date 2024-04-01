import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_flutter/controller/counter_controller.dart';
import 'package:learning_flutter/controller/user_controller.dart';

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
    //Dependency Injection to create an object
    Get.put(CounterController());
    Get.put(UserController());
    return Scaffold(
      backgroundColor: Colors.white,
      body:Center(
        child:Image.asset('assets/images/infinity.gif'),
      ) ,
    );
  }
}

