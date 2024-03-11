import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:learning_flutter/model/user_model.dart';

class FirebaseDatabaseService {
  final usersList = [];
  final _firestoreDb = FirebaseFirestore.instance;

  ///This function is to get single user from firebase
  Future getSingleUser() async {
    try {
      final CollectionReference _usersCollectionReference = await _firestoreDb
          .collection('users');
      var userDetails = await _usersCollectionReference.doc('user2').get();
      if (userDetails.exists) {
        print('User Details ${userDetails.data()}');
      } else {
        print('User Not Found');
      }
    } catch (e) {
      print('Something went wrong');
    }
  }

  ///This function is to get all users in a collection
  Future getUsersInACollection() async {
    try {
      final CollectionReference _usersCollectionReference = await _firestoreDb
          .collection('users');
      await _usersCollectionReference.get().then((querySnapShot) {
        for (var result in querySnapShot.docs) {
          usersList.add(result.data());
        }
      });
      return usersList;
    } catch (e) {
      print('Something Went Wrong $e');
    }
  }

  ///This function is used to create user in cloud FirebaseFirestore
  void createUser({required UserModel userModel}) async {
    try {
      final CollectionReference _usersCollectionReference = await _firestoreDb
          .collection('users');
      await _usersCollectionReference
          .add(userModel.tojson())
          .whenComplete;
      print('User Creation Success');
    } catch (e) {
      print('Something went wrong');
    }
  }
  Future<UserModel?> getUserDetailsFromUID({required String UID}) async{
    try{
      final CollectionReference _userCollectionReference=  await _firestoreDb.collection("users");
      final documentSnapshot= await _userCollectionReference.where('id',isEqualTo: UID).get();
      if (documentSnapshot.docs.isNotEmpty){
        final userModel= documentSnapshot.docs.map((doc) => UserModel.fromjson(doc as QueryDocumentSnapshot <Map<String, dynamic>>)).first;
        return userModel;
      }
      else{
        print("Data not found");
        return null;
      }

    }catch(e){
      print("something went wrong");
    }
  }
  Future<List<UserModel>?> getUsersFromDatabase() async {
    try {
      final CollectionReference _usersCollectionReference =
      await _firestoreDb.collection('users');
      final snapShot =
      await _usersCollectionReference.get();

      if (snapShot.docs.isNotEmpty) {
        return snapShot.docs.map((doc)=> UserModel.fromjson(doc as QueryDocumentSnapshot<Map<String, dynamic>>)).toList();
      } else {
        throw Exception('User not found');
      }
    } catch (e) {
      print('Something went wrong $e');
    }
    return null;
  }
  Future<UserModel?> updateUserUsingUID({required String uId,required UserModel userModel}) async{
    try{
      final CollectionReference _usersCollectionReference= await _firestoreDb.collection('users');
      final documentSnapshot =await _usersCollectionReference.where('id', isEqualTo: uId).get();
      if(documentSnapshot.docs.isNotEmpty){
       final documetId=documentSnapshot.docs.first.id;
       await _usersCollectionReference.doc(documetId).update(userModel.tojson());
      }else{

      }
    }catch(e){
      print("Something went wrong $e");
    }
    return null;
  }
}