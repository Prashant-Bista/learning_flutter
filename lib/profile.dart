import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_flutter/controller/user_controller.dart';
import 'package:learning_flutter/model/user_model.dart';
import 'package:learning_flutter/service/firebase_database_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:learning_flutter/users_list.dart';

class Profile extends StatelessWidget{
  const Profile({super.key});


  ///This function is used to get Uid Fom shared Preferences
  void getUIDFromSharedPreferences() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? id = prefs.getString('id');
    }

  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.put(UserController());
    return Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        appBar: AppBar(
          title: Text('View Profile'),
          actions: [
            IconButton(
                onPressed: () {
                  userController.getusersFromDatabase();
                  Navigator.of(context).pushNamed('/userslist');
                },
                icon: Icon(Icons.edit)),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: (userController.uId.isNotEmpty)
              ?Obx(() {
                  return ListView(
                              children: [
                  ProfileImage(),
                  SizedBox(
                    height: 20,
                  ),
                  BasicDetails(userModel: userController.userModel.value),
                  SizedBox(
                    height: 20,
                  ),
                  MenuWidgets(
                    title: 'Settings',
                    onPressed: () {
                      print('Settings Clicked');
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  MenuWidgets(
                    title: 'Notification',
                    onPressed: () {
                      print('Notification Clicked');
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  MenuWidgets(
                    title: 'About App',
                    onPressed: () {
                      print('About App Clicked');
                    },
                  ),
                              ],
                            );
                }
              )
              : Center(
                  child: CircularProgressIndicator(),
                ),
        ));
  }
}

/// TO display the circular profile
class ProfileImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 100,
      child: CircleAvatar(
        backgroundImage: AssetImage('assets/images/Profile.jfif'),
        radius: 20,
      ),
    );
  }
}

///This displays the basic details of the user
class BasicDetails extends StatelessWidget {
  BasicDetails({required this.userModel});
  final UserModel? userModel;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(
              0,
              3,
            ),
          ),
        ]),
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            userModel != null
                ? Text('Name: ${userModel!.fullname}')
                : Text('Name: -'),
            SizedBox(
              height: 5,
            ),
            userModel != null
                ? Text('Address: ${userModel!.address}')
                : Text('Address: - '),
            SizedBox(
              height: 5,
            ),
            userModel != null
                ? Text('Phone: ${userModel!.phonenumber}')
                : Text('Phone: - '),
            SizedBox(
              height: 5,
            ),
            userModel != null
                ? Text('Gender: ${userModel!.gender}')
                : Text('Gender: - '),
            SizedBox(
              height: 5,
            ),
            userModel != null
                ? Text('Email: ${userModel!.email}')
                : Text('Email:: - '),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed('/editprofile', arguments: userModel);
              },
              child: Text("Edit profile"),
            ),
          ],
        ));
  }
}

class MenuWidgets extends StatelessWidget {
  MenuWidgets({required this.title, this.onPressed});
  String title;
  void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPressed,
        child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(
                  0,
                  3,
                ),
              ),
            ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title),
                Icon(Icons.arrow_right),
              ],
            )));
  }
}
