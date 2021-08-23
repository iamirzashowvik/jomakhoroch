import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jomakhoroch/View/login.dart';
import 'package:jomakhoroch/View/register.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //logo

              ImageIcon(
                AssetImage('images/mainlogo.png'),
                size: 200,
              ),

              Align(
                  alignment: Alignment.center,
                  child: Text(
                    "জমা খরচ",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold),
                  )),
              SizedBox(
                height: 10.0,
              ),
              Align(
                  alignment: Alignment.center,
                  child: Text(
                    "আপনার ব্যবসার স্মার্ট সমাধান।",
                    style: TextStyle(color: Colors.black, fontSize: 20.0),
                  )
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "আপনার ব্যবসা প্রতিষ্ঠানের উন্নতি সাধনে আমরা প্রতিজ্ঞাবদ্ধ।",
                      style: TextStyle(color: Colors.black, fontSize: 24.0),
                      textAlign: TextAlign.center,
                    )),
              ),

              SizedBox(
                height: 20.0,
              ),

              Container(
                width: 250.0,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(25.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.teal,
                        //spreadRadius: 4,
                        //blurRadius: 10,
                        //offset: Offset(0, 3),
                      )
                    ]),
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      Get.to(Login());
                    },
                    child: Text(
                      'লগইন করুন',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: "Netflix",
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        letterSpacing: 0.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 20.0,
              ),

              Container(
                width: 250.0,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(25.0),
                    ),
                    border: Border.all(
                      color: Colors.teal,
                      width: 3,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white,
                        //spreadRadius: 4,
                        //blurRadius: 10,
                        //offset: Offset(0, 3),
                      )
                    ]),
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      Get.to(Register());
                    },
                    child: Text(
                      'ফ্রিতে রেজিস্ট্রেশন করুন',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: "Netflix",
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        letterSpacing: 0.0,
                        color: Colors.teal,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
