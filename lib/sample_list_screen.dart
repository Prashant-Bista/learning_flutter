import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_flutter/controller/sample_list_controller.dart';

class SampleListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final SampleListController sampleListController =
        Get.put(SampleListController());
    return Scaffold(
        appBar: AppBar(title: Text('Sample List'), centerTitle: true, actions: [
          IconButton(
              onPressed: () => sampleListController.insertDataIntoList('Hello'),
              icon: Icon(Icons.add)),
          SizedBox(
            width: 10,
          ),
          IconButton(
              onPressed: () => sampleListController.deleteDataFromList('Hello'),
              icon: Icon(Icons.remove)),
        ]),
        body: Obx(() {
          return ListView.builder(
            itemCount: sampleListController.sampleList.length,
            itemBuilder: (context, index) {
              final sampleData = sampleListController.sampleList[index];
              return Container(
                padding: EdgeInsets.all(10),
                child: Text('$sampleData'),
              );
            },
          );
        }));
  }
}
