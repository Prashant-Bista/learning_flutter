import 'package:get/get.dart';
import 'package:learning_flutter/model/user_model.dart';
import 'package:learning_flutter/service/firebase_database_service.dart';

class USerController extends GetxController{
  final userslist =<UserModel>[].obs;
  final firebaseDatabaseService = FirebaseDatabaseService();

  /// get all users from firebase database
 void getusersFromDatabase() async{
   userslist.value = await firebaseDatabaseService.getUsersFromDatabase();
 }
 void deleteUserFromFirebaseUsingUID({required String uId}) async {
   userslist.value=await firebaseDatabaseService.deleteUserUsingUID(uId: uId);
 }
}
