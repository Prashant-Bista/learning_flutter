import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'controller/user_controller.dart';
import 'model/user_model.dart';

class EditProfile extends StatefulWidget {
  EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final UserController userController = Get.find();

  ///Function to set usermodel details to form controllers
  void setUserModelDetailsToFormControllers(BuildContext context) {
    final UserModel? userModelDetails =
    ModalRoute.of(context)!.settings.arguments as UserModel;
    if (userModelDetails != null) {
      if (userModelDetails.fullname != null) {
        userController.fullNameController.text = userModelDetails.fullname!;
      }

      if (userModelDetails.phonenumber != null) {
        userController.phoneNumberController.text =
            userModelDetails.phonenumber!.toString();
      }

      if (userModelDetails.address != null) {
        userController.addressController.text = userModelDetails.address!;
      }

      if (userModelDetails.email != null) {
        userController.emailAddressController.text = userModelDetails.email!;
      }

      // if (userModelDetails.gender != null) {
      //   gender = userModelDetails.gender!;
      // }
    }
  }

  @override
  void didChangeDependencies() {
    setUserModelDetailsToFormControllers(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        centerTitle: true,
      ),
      body: Form(
        key: userController.formKey,
        child: ListView(
          children: [
            EditProfileImage(),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: userController.fullNameController,
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
              controller: userController.emailAddressController,
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
                final regex = RegExp(userController.emailRegexPattern);
                if (!regex.hasMatch(emailValue)) {
                  return 'Please enter a valid email';
                }
                return null;
              },
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: userController.phoneNumberController,
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
              maxLength: 300,
              maxLines: 3,
              controller: userController.addressController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text('Enter your address'),
              ),
            ),
            Text('Select Your Gender'),
            SizedBox(height: 5),
            Obx(() {
              return Wrap(
                children: [
                  Radio(
                    value: 'Male',
                    groupValue: userController.gender.value,
                    onChanged: ((newValue) {
                      if (newValue != null) {
                        userController.gender.value = newValue;
                      }
                    }),
                  ),
                  Text('Male'),
                  Radio(
                    value: 'Female',
                    groupValue: userController.gender.value,
                    onChanged: ((newValue) {
                      if (newValue != null) {
                        userController.gender.value = newValue;
                      }
                    }),
                  ),
                  Text('Female'),
                ],
              );
            }),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: Text('Update'),
              onPressed: () => userController
                  .updateUserDetailsUsingUidInFirebase(context: context),
            ),
          ],
        ),
      ),
    );
  }
}

///Class to create edit function in profile image
class EditProfileImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          right: 0,
          child: IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {},
          ),
        ),
        SizedBox(
          height: 100,
          width: 100,
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/images/profile.jpg'),
          ),
        ),
      ],
    );
  }
}
