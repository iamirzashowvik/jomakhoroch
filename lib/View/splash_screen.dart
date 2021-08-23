import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jomakhoroch/View/home_page.dart';
import 'package:jomakhoroch/View/welcome_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SpalshScreen extends StatefulWidget {
  const SpalshScreen({Key? key}) : super(key: key);

  @override
  _SpalshScreenState createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SpalshScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 1), () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      if (prefs.containsKey('Phone')) {
        Get.off(HomePage());
      } else {
        Get.off(WelcomeScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Image.asset('images/mainlogo.png'),
        ),
      ),
    );
  }
}
