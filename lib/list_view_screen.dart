import 'package:flutter/material.dart';

import 'model/list_view_model.dart';


class ListViewScreen extends StatelessWidget {
  const ListViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: movielist.length,
        itemBuilder:(BuildContext context, int index){
          final listData= movielist[index];
          return ListTile(
            leading:Icon(listData.icon),
            title:Text(" ${listData.title}",style:TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text("${listData.income}"),
          );
        },
      ),
    );
  }
}
