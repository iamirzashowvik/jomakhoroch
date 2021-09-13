// @dart=2.9

import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jomakhoroch/View/splash_screen.dart';

import 'View/secondpage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Joma khoroch',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SpalshScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Second())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 170,
          ),
          Center(
            child: Container(
                height: 250,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Image(
                    image: AssetImage(
                      "assets/d.png",
                    ),
                    fit: BoxFit.cover,
                  ),
                )),
          ),
        ],
      ),
    )

        //   Image.asset(
        //   "assets/bdnews.jpg",
        //   fit: BoxFit.cover,
        // ),

        );
  }
}
