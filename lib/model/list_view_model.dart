import 'package:flutter/material.dart';
class ListViewModel{
  IconData? icon;
  String? title;
  double? income;

  ListViewModel({this.icon,this.title,this.income});

}

List<ListViewModel> movielist=[
  ListViewModel(icon:Icons.place,title:"Mean Girls",income:6.9),
  ListViewModel(icon:Icons.plus_one,title:"The beekeper",income:6.7),
  ListViewModel(icon:Icons.near_me,title:"Wonka",income:5.7),
  ListViewModel(icon:Icons.nat,title:"Migration",income:4.9),
  ListViewModel(icon:Icons.abc,title:"Anyone but you",income:4.6),
  ListViewModel(icon:Icons.help_outline,title:"Poor things",income:2.9)
];
