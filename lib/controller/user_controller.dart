import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:learning_flutter/model/user_model.dart';
import 'package:learning_flutter/service/firebase_database_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class UserController extends GetxController{
  final userslist =<UserModel>[].obs;
  final firebaseDatabaseService = FirebaseDatabaseService();
  var userModel= UserModel().obs;
  var uId="".obs;
  final formKey = GlobalKey<FormState>();

  //underscore : private
  final fullNameController = TextEditingController();

  final emailAddressController = TextEditingController();

  final phoneNumberController = TextEditingController();

  final passwordController = TextEditingController();

  final emailRegexPattern =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

  final addressController = TextEditingController();

  var gender = "Male".obs;
  @override
  void onReady(){
    getUIDFromSharedPreferences();
    super.onReady();
  }
  void getUIDFromSharedPreferences () async{
    final SharedPreferences prefs =await SharedPreferences.getInstance();
    final String? id = prefs.getString('id');
    if(id!=null){
      uId.value =id;
      print('UID value ${uId.value}');
    }
    getUserDetailsUsingUidFromFirebase();

  }
  /// get all users from firebase database
 void getusersFromDatabase() async{
   userslist.value = await firebaseDatabaseService.getUsersFromDatabase();
 }
 void deleteUserFromFirebaseUsingUID({required String uId}) async {
   userslist.value=await firebaseDatabaseService.deleteUserUsingUID(uId: uId);
 }


 ///Get user details using UID from firebase
getUserDetailsUsingUidFromFirebase() async{
    UserModel? userDetails;
    userDetails = await firebaseDatabaseService.getUserDetailsFromUID(UID: uId.value);
    if (userDetails!=null){
      userModel.value=userDetails;
    }
}

updateUserDetailsUsingUidInFirebase({required BuildContext context}) async {
  final UserModel userModelRequest= UserModel(
    id: uId.value,
    fullname: fullNameController.text,
    phonenumber: int.parse(phoneNumberController.text),
    address:  addressController.text,
    gender: gender.value,
    email: emailAddressController.text,
  );
  print('Usermodel Request ${userModelRequest.tojson()}');
    if( uId.value.isNotEmpty){
      await firebaseDatabaseService.updateUserUsingUID(uId: uId.value, userModel: userModelRequest);
    }
    ///Get back updated user details after and update is called
  getUserDetailsUsingUidFromFirebase();
  Navigator.of(context).pop();
}

}
