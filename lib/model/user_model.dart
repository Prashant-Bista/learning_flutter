import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? id;
  String? fullname;
  int? phonenumber;
  String? address;
  String? gender;
  String? email;
  UserModel(
      {this.id, this.fullname, this.gender, this.address, this.phonenumber,this.email,});
  tojson() {
    return {
      'id': id,
      'Full_name': fullname,
      'phone_number': phonenumber,
      'address': address,
      'Gender': gender,
      'Email_id':email
    };
  }

  factory UserModel.fromjson(
      QueryDocumentSnapshot <Map<String, dynamic>> document) {
    final userData = document.data();
    return UserModel(
      fullname: userData['Full_name'],
      phonenumber: userData['phone_number'],
      address: userData['address'],
      gender: userData['Gender'],
      email: userData['Email_id']
    );
  }
}
