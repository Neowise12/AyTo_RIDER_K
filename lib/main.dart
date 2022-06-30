import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rider/LoginPages/login_Page.dart';
import 'package:rider/Utilites/routers.dart';
import 'package:rider/mainPage/mainpage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  User? user = await FirebaseAuth.instance.currentUser;
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //initialRoute: "mainpage",

      //FirebaseAuth.instance.currentUser == null ?"login":"mainpage",

      routes: {
        'login':(context)=>LoginPage(),
        'mainpage':(context)=>MainPage(),
      },

      home: MainPage(),

    );
  }
}
