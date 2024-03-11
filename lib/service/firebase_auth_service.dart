import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService{
  FirebaseAuth _auth =FirebaseAuth.instance;

  Future<User?> createUserWithEmailAndPassword(String email, String password) async{
    try{
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email,password : password);
      return userCredential.user;
    }on FirebaseAuthException catch(e){
      print('Firebase Auth Error $e');
    }
    catch(e){
      print("something went wrong");
    }
    return null;
  }
  ///This function is used to login user with email and password
  Future<User?>loginInWithEmailAndPassword(String email, String password) async{
    try{
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    }on FirebaseAuthException catch(e){
      print('Firebase Auth Error $e');
    }
    catch(e){
      print('Something Went Wrong $e');
    }
    return null;
  }
  ///This funciton is used to signout user
  void signOutUser() async{
    try{
      await _auth.signOut();
      print('logout Success');
    }catch(e){
      print('Error while sigout');
    }

  }
  User? getCurrentUser(){

  }
}