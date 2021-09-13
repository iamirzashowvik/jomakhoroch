import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';

// class Register extends StatefulWidget {
//   const Register({Key? key}) : super(key: key);

//   @override
//   _RegisterState createState() => _RegisterState();
// }

// class _RegisterState extends State<Register> {
//   bool isLoad = false;
//   TextEditingController phoneController = TextEditingController();
//   TextEditingController pinController = TextEditingController();
//   FirebaseAuth auth = FirebaseAuth.instance;

//   void regTap() async {
//     setState(() {
//       isLoad = true;
//     });

//     String phoneNo = '+88' + phoneController.text.trim();
//     await auth.verifyPhoneNumber(
//       phoneNumber: phoneNo,
//       timeout: const Duration(seconds: 120),
//       verificationCompleted: (PhoneAuthCredential credential) async {
//         Get.dialog(
//             Container(
//               color: Colors.white,
//               child: Text('completing auto verification ...'),
//             ),
//             useSafeArea: true);
//         setState(() {
//           isLoad = true;
//         });
//         var result = await auth.signInWithCredential(credential);
//         if (result.user != null) {
//           Get.off(PinSubmit(phoneNo));
//         } else {
//           Get.snackbar('Verification failed', 'Can not auto verify phone no',
//               snackPosition: SnackPosition.BOTTOM);
//         }
//       },
//       verificationFailed: (FirebaseException e) {
//         print(e.toString());
//         Get.snackbar('Error', e.toString(),
//             snackPosition: SnackPosition.BOTTOM);
//       },
//       codeSent: (String verificationId, int) {
//         setState(() {
//           isLoad = false;
//         });

//         showDialog(
//           context: context,
//           builder: (context) => AlertDialog(
//             content: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: <Widget>[
//                 TextField(
//                   controller: pinController,
//                   decoration: InputDecoration(hintText: 'Verification Code'),
//                 ),
//                 ElevatedButton(
//                   onPressed: () async {
//                     var smsCode = pinController.text.trim();
//                     PhoneAuthCredential credential =
//                         PhoneAuthProvider.credential(
//                             verificationId: verificationId, smsCode: smsCode);

//                     var result = await auth.signInWithCredential(credential);
//                     if (result.user != null) {
//                       Get.off(PinSubmit(phoneNo));
//                     }
//                   },
//                   child: Text("Verify"),
//                   style: ElevatedButton.styleFrom(
//                     primary: Colors.teal,
//                     onPrimary: Colors.white,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );

//       },
//       codeAutoRetrievalTimeout: (String verificationId) {},
//     );
//   }

//   void loginTap() {
//     Get.to(Login());
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         iconTheme: IconThemeData(
//           color: Colors.black, //change your color here
//         ),
//         title: Text('রেজিস্ট্রেশন', style: TextStyle(color: Colors.black)),
//         backgroundColor: Colors.white,
//       ),
//       bottomNavigationBar: Container(
//         height: 60.0,
//         child: Padding(
//           padding: const EdgeInsets.only(
//               top: 8.0, bottom: 8.0, left: 20.0, right: 20.0),
//           child: ElevatedButton(
//             onPressed: regTap,
//             child: Text('রেজিস্টার করুন'),
//             style: ElevatedButton.styleFrom(
//               onPrimary: Colors.white,
//               primary: Colors.teal,
//               textStyle: TextStyle(fontSize: 20.0),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(20.0),
//               ),
//             ),
//           ),
//         ),
//       ),
//       body: (isLoad)
//           ? Center(child: CircularProgressIndicator(color: Colors.teal))
//           : SingleChildScrollView(
//               child: Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Column(
//                   children: [
//                     TextField(
//                       controller: phoneController,
//                       maxLength: 11,
//                       keyboardType: TextInputType.number,
//                       decoration: InputDecoration(
//                         labelText: 'মোবাইল নম্বর দিন *',
//                         labelStyle: TextStyle(color: Colors.teal),
//                         prefixIcon: Icon(Icons.call, color: Colors.teal),
//                         focusedBorder: UnderlineInputBorder(
//                             borderSide:
//                                 BorderSide(color: Colors.teal, width: 2.0)),
//                       ),
//                     ),

//                     SizedBox(height: 20.0),

//                     Align(
//                         alignment: Alignment.topLeft,
//                         child: Text('একাউন্ট আছে?')
//                     ),

//                     Align(
//                       alignment: Alignment.topLeft,
//                       child: GestureDetector(
//                         onTap: loginTap,
//                         child: Text('লগইন করুন',
//                             style: TextStyle(
//                                 color: Colors.teal,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 16.0)),
//                       ),
//                     ),

//                   ],
//                 ),
//               ),
//             ),
//     );
//   }
// }

class Registration extends StatefulWidget {
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final regForm = GlobalKey<FormState>();
  var textEditingControllerDokanName = new TextEditingController();
  var textEditingControllerApnarNam = new TextEditingController();
  var textEditingControllerPhone = new TextEditingController();
  var textEditingControllerPin = new TextEditingController();
  var textEditingControllerPinNirchit = new TextEditingController();
  var textEditingControllerDokanCobi = new TextEditingController();
  late XFile _selectedFile;
  bool _inProcess = false;
  @override
  void initState() {
    super.initState();
  }

  getImage(ImageSource source) async {
    this.setState(() {
      _inProcess = true;
    });
    final ImagePicker _picker = ImagePicker();
    XFile? image = await _picker.pickImage(source: source);
    //getImage(source: source);
    if (image != null) {
      // File? cropped = await ImageCropper.cropImage(
      //     sourcePath: image.path,
      //     aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
      //     compressQuality: 100,
      //     maxWidth: 700,
      //     maxHeight: 700,
      //     compressFormat: ImageCompressFormat.jpg,
      //     androidUiSettings: AndroidUiSettings(
      //       toolbarColor: Colors.deepOrange,
      //       toolbarTitle: "Crop Your Image",
      //       statusBarColor: Colors.deepOrange.shade900,
      //       backgroundColor: Colors.white,
      //     ));

      this.setState(() {
        _selectedFile = image;
        _inProcess = false;
      });
    } else {
      this.setState(() {
        _inProcess = false;
      });
    }
  }

  Widget getImageWidget() {
    return Text('f');
  }

  gg() {
    if (_selectedFile != null) {
      return Image.file(
        File(_selectedFile.path),
        width: 250,
        height: 250,
        fit: BoxFit.cover,
      );
    } else {
      return Image.asset(
        "images/d.png",
        width: 150,
        height: 150,
        fit: BoxFit.cover,
      );
    }
  }

//https://camo.githubusercontent.com/1ac901163b1b3843204a77f5ab49f839fc97b56d59036e0582e3e492f174dfcb/68747470733a2f2f677076632e6172747572696f2e6465762f546168616e696d61
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
          child: Form(
            key: regForm,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 25.0,
                ),
                Center(
                  child: Container(
                    child: Text(
                      "রেজিষ্ট্রেশন করুন",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'আপনার দোকানের নাম দিন';
                    }

                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'আপনার দোকানের নাম',
                    labelStyle: TextStyle(
                      color: Colors.black, // <-- Change this
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                    ),
                    hintText: "দোকানের নাম",
                    hintStyle: TextStyle(
                      color: Colors.black, // <-- Change this
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  controller: textEditingControllerDokanName,
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'আপনার নাম দিন';
                    }

                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'আপনার নাম',
                    labelStyle: TextStyle(
                      color: Colors.black, // <-- Change this
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                    ),
                    hintText: "আপনার নাম",
                    hintStyle: TextStyle(
                      color: Colors.black, // <-- Change this
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  controller: textEditingControllerApnarNam,
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  maxLength: 11,
                  validator: (value) {
                    if (value!.length != 11) {
                      return '১১ ডিজিটের মোবাইল নাম্বার দিন';
                    }

                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'আপনার মোবাইল নাম্বার',
                    labelStyle: TextStyle(
                      color: Colors.black, // <-- Change this
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                    ),
                    hintText: "01234567890",
                    hintStyle: TextStyle(
                      color: Colors.black, // <-- Change this
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  controller: textEditingControllerPhone,
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'পাঁচ সংখ্যার পিন নাম্বার দিন';
                    }

                    return null;
                  },
                  maxLength: 5,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'পাঁচ সংখ্যার পিন নাম্বার দিন',
                    labelStyle: TextStyle(
                      color: Colors.black, // <-- Change this
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                    ),
                    hintText: "XXXXX",
                    hintStyle: TextStyle(
                      color: Colors.black, // <-- Change this
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  controller: textEditingControllerPin,
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'পিন নাম্বার নির্শ্চিত করুন';
                    }

                    return null;
                  },
                  maxLength: 5,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "পিন নাম্বার নির্শ্চিত করুন",
                    labelStyle: TextStyle(
                      color: Colors.black, // <-- Change this
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                    ),
                    hintText: "",
                    hintStyle: TextStyle(
                      color: Colors.black, // <-- Change this
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  controller: textEditingControllerPinNirchit,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      "দোকানের ছবি বা লগো",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                // Center(
                //   child: Container(
                //     height: 50,
                //     width: 50,
                //     margin: const EdgeInsets.all(15.0),
                //     padding: const EdgeInsets.all(3.0),
                //     decoration:
                //         BoxDecoration(border: Border.all(color: Colors.black)),
                //     child: Text('My Awesome Border'),
                //   ),
                // ),
                Stack(
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        getImageWidget(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            MaterialButton(
                                color: Colors.green,
                                child: Text(
                                  "Camera",
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () {
                                  getImage(ImageSource.camera);
                                }),
                            MaterialButton(
                                color: Colors.deepOrange,
                                child: Text(
                                  "Gallery",
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () {
                                  getImage(ImageSource.gallery);
                                })
                          ],
                        )
                      ],
                    ),
                    (_inProcess)
                        ? Container(
                            color: Colors.white,
                            height: MediaQuery.of(context).size.height * 0.95,
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          )
                        : Center()
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      // registrationX();
                      // if (regForm.currentState!.validate()) {
                      //   registrationX();
                      // } else {}
                      registrationX();
                    },
                    child: Container(
                      width: 200,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: Colors.purple[300],
                        borderRadius:
                            BorderRadius.circular(10), //border corner radius
                        boxShadow: [
                          BoxShadow(
                            color:
                                Colors.grey.withOpacity(0.2), //color of shadow
                            spreadRadius: 5, //spread radius
                            blurRadius: 7, // blur radius
                            offset: Offset(0, 2), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Center(
                          child: Text("সেইভ করুন",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500))),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  registrationX() async {
    if (1 == 1
        // textEditingControllerPin.text == textEditingControllerPinNirchit.text
        ) {
      try {
        Map<String, String> body = {
          "email": "showvikmirza@gmail.com",
          "password": "12345678",
          "confirmed": "12345678",
          "delivery_fee": "50",
          "delivery_range": "20",
          "phone": "01710427095",
          "mobile": "01644819157",
          "address": "demo Address",
          "latitude": "3543",
          "longitude": "35346",
          "description": "demo description",
          "closed": "1",
          "available_for_delivery": "1",
        };
        final mineData =
            lookupMimeType(_selectedFile.path, headerBytes: [0xFF, 0xD8])!
                .split("/");
        var image = await http.MultipartFile.fromPath(
            "image", _selectedFile.path,
            contentType: MediaType(mineData[0], mineData[1]));
        //SharedPreferences pref = await SharedPreferences.getInstance();
        String url = "https://dokanhub.xyz/api/shop-register";
        Map<String, String> headers = <String, String>{
          'Content-Type': 'application/json'
        };
        Map<String, String> requestBody = body;
        var uri = Uri.parse(url);
        var request = http.MultipartRequest('POST', uri)
          ..headers.addAll(headers)
          ..files.add(image)
          ..fields.addAll(requestBody);

        var res = await request.send();
        http.Response response = await http.Response.fromStream(res);
        var data = json.decode(response.body);
        print(data);
        // if (response.statusCode == 200) {
        //   Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => Animal_list(
        //               token: widget.token,
        //             )),
        //   );
        // } else {
        //   setState(() {
        //     i = 0;
        //   });
        // }
      } catch (e) {
        print(e);
      }
    } else {
      Get.snackbar('ভিন্ন পিন!', 'পিন নম্বর একই হতে হবে');
    }
  }
}
