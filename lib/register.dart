import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learning_flutter/model/user_model.dart';
import 'package:learning_flutter/service/firebase_auth_service.dart';
import 'package:learning_flutter/service/firebase_database_service.dart';

class Register extends StatefulWidget {
  Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}
class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  //underscore : private
  final _fullNameController = TextEditingController();

  final _emailAddressController = TextEditingController();

  final _phoneNumberController = TextEditingController();

  final _passwordController = TextEditingController();

  final _addressController = TextEditingController();

  final _emailRegexPattern =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

  String gender = "Male";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(left: 10, top: 20),
            width: MediaQuery.of(context).size.width / 1.5,
            child: Column(
              children: [
                TextFormField(
                  controller: _fullNameController,
                  keyboardType: TextInputType.name,
                  maxLength: 30,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter full name',
                  ),
                  validator: (fullNameValue) {
                    if (fullNameValue == null || fullNameValue.trim().isEmpty) {
                      return 'Please Enter Full Name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _emailAddressController,
                  maxLength: 30,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email address',
                  ),
                  validator: (emailValue) {
                    if (emailValue == null || emailValue.trim().isEmpty) {
                      return 'Please enter your email address';
                    }
                    final regex = RegExp(_emailRegexPattern);
                    if (!regex.hasMatch(emailValue)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _phoneNumberController,
                  keyboardType: TextInputType.phone,
                  maxLength: 10,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter your phone number',
                  ),
                  validator: (phoneNumberValue) {
                    if (phoneNumberValue == null ||
                        phoneNumberValue.trim().isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  maxLength: 20,
                  obscureText: true, //making non visible password
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter your password',
                  ),
                  validator: (passwordValue) {
                    if (passwordValue == null || passwordValue.trim().isEmpty) {
                      return 'Please Enter password';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                    controller: _addressController,
                    keyboardType: TextInputType.streetAddress,
                    maxLength: 300,
                    maxLines: 3, //lines or height of box
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter your address',
                    )),
                Text('Select your Gender'),
                Wrap(
                  children: [
                    Radio(
                        value: 'Male',
                        groupValue: gender,
                        onChanged: ((newvalue) {
                          setState(() {
                            if (newvalue != null) {
                              gender = newvalue;
                            }
                          });
                        })),
                    Text('Male'),
                    Radio(
                        value: 'Female',
                        groupValue: gender,
                        onChanged: ((newvalue) {
                          setState(() {
                            if (newvalue != null) {
                              gender = newvalue;
                            }
                          });
                        })),
                    Text('Female')
                  ],
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState != null) {
                      if (_formKey.currentState!.validate()) {
                        final email = _emailAddressController.text;
                        final password = _passwordController.text;
                        final firebaseAuthService = FirebaseAuthService();
                        User? user = await firebaseAuthService
                            .createUserWithEmailAndPassword(email, password);
                        if (user != null) {
                          final userModel = UserModel(
                              id: user.uid,
                              fullname: _fullNameController.text,
                              phonenumber:
                              int.parse(_phoneNumberController.text),
                              gender: gender,
                              address: _addressController.text,
                              email: _emailAddressController.text,
                          );
                          FirebaseDatabaseService().createUser(userModel: userModel);
                          _formKey.currentState!.reset();
                          Navigator.of(context).pushNamed('/login');
                        }
                        else{
                          print("Register Failure");
                        }
                      }
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      'Submit',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}