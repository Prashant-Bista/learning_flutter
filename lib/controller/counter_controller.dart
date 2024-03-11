import 'package:get/get.dart';

class CounterController extends GetxController{
  ///.obs is used to declare that the value of the variable is dynamic and needs to be changed
  var counter=0.obs;
  var counter1=0;
  var users=[].obs;

  increment(){
    counter++;
    print('The increment is $counter');
  }

  decrement(){
    counter--;
    print('The decrement is $counter');
  }

}