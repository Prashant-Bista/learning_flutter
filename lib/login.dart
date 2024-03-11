import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_flutter/controller/login_controller.dart';
import 'package:learning_flutter/service/firebase_auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatelessWidget {
  Login({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController loginController =Get.put(LoginController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
      ),
      body: Form(
        key: loginController.formKey,
        child: Column(
          children: [
            TextFormField(
              controller: loginController.emailAddressController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your username'),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: loginController.passwordController,
              obscureText: true,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter a password',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                FractionallySizedBox(
                  widthFactor: 0.2,
                  child: Obx(() {
                      return Checkbox(
                        ///reactive boolean value so use .value to access the value and since it is obs value wrap it with obx
                        value: loginController.isChecked.value,
                        onChanged: (newValue) {
                          ///when new value updated Obx function is called and the checkbox is redrawed
                          print('New value: $newValue');
                          if (newValue != null) {
                            loginController.isChecked.value=newValue;
                          }
                        },
                      );
                    }
                  ),
                ),
                FractionallySizedBox(
                    widthFactor: 0.8,
                    child: Text('Agree to all conditions of the app?')),
              ],
            ),
            Wrap(
              children: [
                FractionallySizedBox(
                  widthFactor: 0.3,
                  child: ElevatedButton(
                    onPressed: ()=>loginController.handlelogin(context),
                    child: Text('Login'),
                  ),
                ),
                FractionallySizedBox(
                  widthFactor: 0.03,
                ),
                FractionallySizedBox(
                  widthFactor: 0.3,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Reset'),
                  ),
                ),
                FractionallySizedBox(
                  widthFactor: 0.03,
                ),
                FractionallySizedBox(
                  widthFactor: 0.3,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/register');
                    },
                    child: Text('Signup'),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
