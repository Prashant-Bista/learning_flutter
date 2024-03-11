import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../service/firebase_auth_service.dart';

class LoginController extends GetxController{
  final formKey = GlobalKey<FormState>();
  final emailAddressController = TextEditingController();
  final passwordController = TextEditingController();
  var isChecked = false.obs;
  @override
  void onReady() {
    emailAddressController.text="bistaprashant1@gmail.com";
    passwordController.text='123456';
    super.onReady();
  }
  ///this function is used to handle login functionalities
  ///when added buildcontext in handle login the navigator knows that the initial page is login
handlelogin(BuildContext context) async{
  if (isChecked != null) {
    if (isChecked.value) {
      final email = emailAddressController.text;
      final password = passwordController.text;
      final firebaseAuthService = FirebaseAuthService();
      final User? user = await firebaseAuthService
          .loginInWithEmailAndPassword(email, password);
      if (user!=null){
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('id', user.uid);
        print("Login Success");
        Navigator.of(context).pushReplacementNamed('/dashboard');
      }
      else{
        print('Login Failed');
      }
//proceed
    } else {
      print('Please check the terms');
    }
  }
}
}