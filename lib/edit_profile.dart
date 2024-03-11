import 'package:flutter/material.dart';
import 'package:learning_flutter/model/user_model.dart';
import 'package:learning_flutter/service/firebase_database_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfile extends StatefulWidget {
  EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _formKey = GlobalKey<FormState>();

  //underscore : private
  final _fullNameController = TextEditingController();

  final _emailAddressController = TextEditingController();

  final _phoneNumberController = TextEditingController();

  final _passwordController = TextEditingController();

  final _emailRegexPattern =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

  final _addressController = TextEditingController();

  String gender = "Male";

  ///Function to set usermodel details to form controllers
  void setUserModelDetailsToFormControllers(BuildContext context) {
    final UserModel? userModelDetails =
    ModalRoute.of(context)!.settings.arguments as UserModel;
    if (userModelDetails != null) {
      if (userModelDetails.fullname != null) {
        _fullNameController.text = userModelDetails.fullname!;
      }

      if (userModelDetails.phonenumber != null) {
        _phoneNumberController.text = userModelDetails.phonenumber!.toString();
      }

      if (userModelDetails.address != null) {
        _addressController.text = userModelDetails.address!;
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
        key: _formKey,
        child: ListView(
          children: [
            EditProfileImage(),
            SizedBox(
              height: 10,
            ),
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
              maxLength: 300,
              maxLines: 3,
              controller: _addressController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text('Enter your address'),
              ),
            ),
            Text('Select Your Gender'),
            SizedBox(height: 5),
            Wrap(
              children: [
                Radio(
                  value: 'Male',
                  groupValue: gender,
                  onChanged: ((newValue) {
                    setState(() {
                      if (newValue != null) {
                        gender = newValue;
                      }
                    });
                  }),
                ),
                Text('Male'),
                Radio(
                  value: 'Female',
                  groupValue: gender,
                  onChanged: ((newValue) {
                    setState(() {
                      if (newValue != null) {
                        gender = newValue;
                      }
                    });
                  }),
                ),
                Text('Female'),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: Text('Update'),
              onPressed: () async {
                final firebasedatabaseService =FirebaseDatabaseService();
                final SharedPreferences prefs= await SharedPreferences.getInstance();
                final uID= prefs.getString('id');
                final userRequestModel= UserModel(
                  id: uID,
                  fullname: _fullNameController.text,
                  phonenumber: int.parse(_phoneNumberController.text),
                  address: _addressController.text,
                  gender: gender,
                  email: _emailAddressController.text,
                );
                if(uID!=null){
                  firebasedatabaseService.updateUserUsingUID(uId: uID, userModel: userRequestModel);
                }
              },
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
            backgroundImage: AssetImage('assets/images/Profile.jfif'),
          ),
        ),
      ],
    );
  }
}