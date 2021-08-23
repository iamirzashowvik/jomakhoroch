import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jomakhoroch/View/home_page.dart';
import 'package:jomakhoroch/View/register.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController pinController = TextEditingController();

  void loginTap() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (phoneController.text != '' && pinController.text != '') {
      await FirebaseFirestore.instance
          .collection('Users')
          .doc('+88' + phoneController.text)
          .get()
          .then((value) {
        if (value.exists) {
          if (value['Pin'] == pinController.text) {
            sharedPreferences.setString('Phone', '+88' + phoneController.text);
            Get.offAll(HomePage());
          } else {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      content: Text('ভুল পাসওয়ার্ড'),
                    ));
          }
        } else {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    content: Text('কোনো নম্বর পাওয়া যায় নাই'),
                  ));
        }
      });
    } else {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                content: Text('সব পূরণ করুন'),
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Text('লগইন করুন', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
      ),
      bottomNavigationBar: Container(
        height: 60.0,
        child: Padding(
          padding: const EdgeInsets.only(
              top: 8.0, bottom: 8.0, left: 20.0, right: 20.0),
          child: ElevatedButton(
            onPressed: loginTap,
            child: Text('লগইন'),
            style: ElevatedButton.styleFrom(
              onPrimary: Colors.white,
              primary: Colors.teal,
              textStyle: TextStyle(fontSize: 20.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
        ),
      ),
      body: Container(
        color: Colors.grey[300],
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Image.asset('images/mainlogo.png'),
                      SizedBox(height: 40.0),
                      TextField(
                        controller: phoneController,
                        maxLength: 11,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'মোবাইল নম্বর*',
                          labelStyle: TextStyle(color: Colors.teal),
                          prefixIcon: Icon(Icons.call, color: Colors.teal),
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.teal, width: 2.0)),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      TextField(
                        controller: pinController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'পিন কোড *',
                          labelStyle: TextStyle(color: Colors.teal),
                          prefixIcon: Icon(Icons.lock, color: Colors.teal),
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.teal, width: 2.0)),
                        ),
                      ),
                      SizedBox(height: 25.0),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text('আপনি কি পিন কোড ভুলে গিয়েছেন?',
                              style: TextStyle(fontSize: 14.0))),
                      GestureDetector(
                        onTap: () {},
                        child: Row(
                          children: [
                            Text('পিন কোড সেট করুন',
                                style: TextStyle(
                                    color: Colors.teal,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.0)),
                            SizedBox(width: 8.0),
                            Icon(Icons.arrow_forward, color: Colors.teal),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 12.0),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Row(
                        children: [
                          Text('আপনি '),
                          Text('নিয়ম ও শর্তসমূহে ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.teal)),
                          Text('রাজি আছেন'),
                        ],
                      ),
                    ),
                    SizedBox(height: 8.0),
                    GestureDetector(
                      onTap: () {
                        Get.to(Register());
                      },
                      child: Row(
                        children: [
                          Text('একাউন্ট নেই? '),
                          Text('ফ্রিতে রেজিস্ট্রেশন করুন',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.teal)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
