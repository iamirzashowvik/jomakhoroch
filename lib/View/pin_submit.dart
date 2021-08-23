import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jomakhoroch/View/info_submit.dart';

class PinSubmit extends StatefulWidget {
  final String phoneNo;
  PinSubmit(this.phoneNo);

  @override
  _PinSubmitState createState() => _PinSubmitState();
}

class _PinSubmitState extends State<PinSubmit> {
  TextEditingController pinController1 = TextEditingController();
  TextEditingController pinController2 = TextEditingController();

  void btnTap() {
    if (pinController1.text == pinController2.text) {
      Get.off(InfoSubmit(widget.phoneNo, pinController1.text));
    } else {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                content: Text('পিন কোড  ম্যাচ করে নাই'),
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          title: Text('পিন সেটআপ', style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.white,
        ),
        bottomNavigationBar: Container(
          height: 60.0,
          child: Padding(
            padding: const EdgeInsets.only(
                top: 8.0, bottom: 8.0, left: 20.0, right: 20.0),
            child: ElevatedButton(
              onPressed: btnTap,
              child: Text('এগিয়ে যান'),
              style: ElevatedButton.styleFrom(
                onPrimary: Colors.white,
                primary: Colors.green,
                textStyle: TextStyle(fontSize: 20.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
          ),
        ),
        body: Container(
          color: Colors.grey[200],
          height: MediaQuery.of(context).size.height,
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(28.0),
              child: Column(
                children: [
                  TextField(
                    obscureText: true,
                    controller: pinController1,
                    decoration: InputDecoration(
                      labelText: 'নতুন পিন কোড লিখুন',
                      labelStyle: TextStyle(color: Colors.green),
                      prefixIcon: Icon(Icons.lock, color: Colors.green),
                      focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.green, width: 2.0)),
                    ),
                  ),
                  SizedBox(height: 25.0),
                  TextField(
                    obscureText: true,
                    controller: pinController2,
                    decoration: InputDecoration(
                      labelText: 'নতুন পিন কোডটি আবার লিখুন',
                      labelStyle: TextStyle(color: Colors.green),
                      prefixIcon: Icon(Icons.lock, color: Colors.green),
                      focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.green, width: 2.0)),
                    ),
                  ),
                  SizedBox(height: 25.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
