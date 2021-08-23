import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jomakhoroch/View/login.dart';
import 'package:jomakhoroch/View/pin_submit.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool isLoad = false;
  TextEditingController phoneController = TextEditingController();
  TextEditingController pinController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  void regTap() async {
    setState(() {
      isLoad = true;
    });

    String phoneNo = '+88' + phoneController.text.trim();
    await auth.verifyPhoneNumber(
      phoneNumber: phoneNo,
      timeout: const Duration(seconds: 120),
      verificationCompleted: (PhoneAuthCredential credential) async {
        Get.dialog(
            Container(
              color: Colors.white,
              child: Text('completing auto verification ...'),
            ),
            useSafeArea: true);
        setState(() {
          isLoad = true;
        });
        var result = await auth.signInWithCredential(credential);
        if (result.user != null) {
          Get.off(PinSubmit(phoneNo));
        } else {
          Get.snackbar('Verification failed', 'Can not auto verify phone no',
              snackPosition: SnackPosition.BOTTOM);
        }
      },
      verificationFailed: (FirebaseException e) {
        print(e.toString());
        Get.snackbar('Error', e.toString(),
            snackPosition: SnackPosition.BOTTOM);
      },
      codeSent: (String verificationId, int) {
        setState(() {
          isLoad = false;
        });

        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextField(
                  controller: pinController,
                  decoration: InputDecoration(hintText: 'Verification Code'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    var smsCode = pinController.text.trim();
                    PhoneAuthCredential credential =
                        PhoneAuthProvider.credential(
                            verificationId: verificationId, smsCode: smsCode);

                    var result = await auth.signInWithCredential(credential);
                    if (result.user != null) {
                      Get.off(PinSubmit(phoneNo));
                    }
                  },
                  child: Text("Verify"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.teal,
                    onPrimary: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        );

      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  void loginTap() {
    Get.to(Login());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Text('রেজিস্ট্রেশন', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
      ),
      bottomNavigationBar: Container(
        height: 60.0,
        child: Padding(
          padding: const EdgeInsets.only(
              top: 8.0, bottom: 8.0, left: 20.0, right: 20.0),
          child: ElevatedButton(
            onPressed: regTap,
            child: Text('রেজিস্টার করুন'),
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
      body: (isLoad)
          ? Center(child: CircularProgressIndicator(color: Colors.teal))
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    TextField(
                      controller: phoneController,
                      maxLength: 11,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'মোবাইল নম্বর দিন *',
                        labelStyle: TextStyle(color: Colors.teal),
                        prefixIcon: Icon(Icons.call, color: Colors.teal),
                        focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.teal, width: 2.0)),
                      ),
                    ),

                    SizedBox(height: 20.0),

                    Align(
                        alignment: Alignment.topLeft,
                        child: Text('একাউন্ট আছে?')
                    ),

                    Align(
                      alignment: Alignment.topLeft,
                      child: GestureDetector(
                        onTap: loginTap,
                        child: Text('লগইন করুন',
                            style: TextStyle(
                                color: Colors.teal,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0)),
                      ),
                    ),

                  ],
                ),
              ),
            ),
    );
  }
}
