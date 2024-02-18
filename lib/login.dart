import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learning_flutter/service/firebase_auth_service.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _emailAddressController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _emailAddressController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your username'),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _passwordController,
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
                  child: Checkbox(
                    value: _isChecked,
                    onChanged: (newValue) {
                      print('New value: $newValue');
                      if (newValue != null) {
                        setState(() {
                          _isChecked = newValue;
                        });
                      }
                    },
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
                    onPressed: () async {
                      if (_isChecked != null) {
                        if (_isChecked) {
                          final email = _emailAddressController.text;
                          final password = _passwordController.text;
                          final firebaseAuthService = FirebaseAuthService();
                          final User? user = await firebaseAuthService
                              .loginInWithEmailAndPassword(email, password);
                          if (user!=null){
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
                    },
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
