import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? id;
  String? fullname;
  int? phonenumber;
  String? address;
  String? gender;

  UserModel(
      {this.id, this.fullname, this.gender, this.address, this.phonenumber});
  tojson() {
    return {
      'id': id,
      'Full_name': fullname,
      'phone_number': phonenumber,
      'address': address,
      'Gender': gender,
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
    );
  }
}
