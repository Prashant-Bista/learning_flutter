import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_flutter/controller/user_controller.dart';
import 'package:learning_flutter/model/user_model.dart';
import 'package:learning_flutter/service/firebase_database_service.dart';
class UsersList extends StatelessWidget {
  const UsersList({super.key});

  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.find();
    return Scaffold(
        appBar: AppBar(
          title:Text('Users List'),
          centerTitle: true,
        ),
        body:Obx(() {
            return ListView.builder(
              itemBuilder: (context, index){
                final userModel=userController.userslist[index];
                return BasicDetails(
                  userModel:userModel,
                );
              },
              itemCount: userController.userslist.length,
            );
          }
        )
    );
  }
}

class BasicDetails extends StatelessWidget {
  BasicDetails({required this.userModel});

  final UserModel? userModel;

  Widget build(BuildContext context) {
    final UserController uSerController = Get.find();
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(
                    0,
                    3,
                  ), //changes position of shadow
                ),
              ],
            ),
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                userModel != null
                    ? Text('Name:${userModel!.fullname}')
                    : Text('Name:-'),
                SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: 5,
                ),
                userModel != null
                    ? Text('Phone:${userModel!.phonenumber}')
                    : Text('Phone_number:-'),
                SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: 5,
                ),
                userModel != null
                    ? Text('Address:${userModel!.address}')
                    : Text('Address:-'),
                SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: 5,
                ),
                userModel != null
                    ? Text('Gender:${userModel!.gender}')
                    : Text('Gender:-'),
                SizedBox(
                  height: 5,
                ),


              ],
            ),
          ),
          Positioned(
            top: 0,
              right: 0,
              child:IconButton(

            icon: Icon(Icons.cancel),
            color: Colors.red,
            onPressed: (){
              showDialog(context: context, builder: (dialogContext){
                return AlertDialog(
                  icon: Icon(Icons.warning),
                  title: Text('Delete User'),
                  content: Text('Are you sure You want to delete?'),
                  actions: [
                    TextButton(onPressed: () async{
                      if(userModel!=null){
                        if(userModel!.id!=null){
                        uSerController.deleteUserFromFirebaseUsingUID(uId: userModel!.id!);
                        }
                      }
                      Navigator.of(dialogContext).pop();
                    }, child: Text('Ok')),
                    SizedBox(
                      width: 5,
                    ),
                    TextButton(onPressed: ()=>Navigator.of(dialogContext).pop(), child: Text('Cancel')),
                  ],
                );
              });
            },
          ))
        ],
      ),
    );
  }
}