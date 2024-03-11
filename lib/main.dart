import 'dart:js';

import 'package:flutter/material.dart';
import 'package:learning_flutter/controller/sample_list_controller.dart';
import 'package:learning_flutter/dashboard.dart';
import 'package:learning_flutter/edit_profile.dart';
import 'package:learning_flutter/list_view_screen.dart';
import 'package:learning_flutter/login.dart';
import 'package:learning_flutter/profile.dart';
import 'package:learning_flutter/register.dart';
import 'package:learning_flutter/sample_list_screen.dart';
import 'package:learning_flutter/splash.dart';
import 'package:learning_flutter/top_picks.dart';
import 'package:learning_flutter/users_list.dart';
import 'package:learning_flutter/utils/default_firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // this function is to initialize firebase in the app
  initializeFirebase();
  runApp(MaterialApp(
    title: 'Flutter App!!',
    theme: ThemeData(
      colorSchemeSeed: Colors.indigo,
      useMaterial3: false,
      brightness: Brightness.light,
    ),
    darkTheme: ThemeData(
      colorSchemeSeed: Colors.blue,
      useMaterial3: true,
      brightness: Brightness.dark,
    ),
    routes: {
      '/':( context) => Splash(),
      '/register':(context) => Register(),
      '/login':(context) => Login(),
      '/dashboard':(context)=>Dashboard(),
      '/listViewScreen':(context)=>ListViewScreen(),
      '/toppicks':(context)=>TopPicks(),
      '/profile':(context)=> Profile(),
      '/editprofile':(context)=> EditProfile(),
      '/userslist':(context)=>UsersList(),
      '/samplelist':(context)=> SampleListScreen()
    },
    initialRoute: '/' ,
    debugShowCheckedModeBanner: false,
  ));
}
void initializeFirebase ()async
{
  await Firebase.initializeApp(options: DefaultFirebaseOptions.web);
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CSIT3rd'),
        centerTitle: true,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed:()=> Navigator.of(context).pushNamed('/login') ,
              child: Text('Login'),
            ),
            SizedBox(width: 30,),
            ElevatedButton(
              onPressed: ()=> Navigator.of(context).pushNamed('/register'),
              child: Text('Register'),
            )
          ],
        ),
      ),
    );
  }
}