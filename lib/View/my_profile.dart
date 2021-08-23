import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jomakhoroch/Model/user.dart';
import 'package:jomakhoroch/View/tools.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyProfile extends StatefulWidget {
  final User user;
  const MyProfile(this.user);

  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  var image;
  bool isLoad = false;

  void cameraTap() async {
    final pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
      } else {
        print('No image selected');
      }
    });
    if (pickedFile != null) {
      uploadImage();
    }
  }

  void uploadImage() async {
    setState(() {
      isLoad = true;
    });

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String sellerPhone = sharedPreferences.getString('Phone').toString();

    var snapshot = await FirebaseStorage.instance
        .ref()
        .child('Profile/$sellerPhone${DateTime.now()}')
        .putFile(image);
    snapshot.ref.getDownloadURL().then((value) async {
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(sellerPhone)
          .update({'image': value}).then((value) {
        setState(() {
          isLoad = false;
        });
        Get.off(Tools());
      });
    });
  }

  Widget profilePic() {
    return Stack(
      overflow: Overflow.visible,
      children: [
        Container(
          color: Colors.blue[600],
          width: double.infinity,
          height: 250,
          child: Center(
            child: Text(widget.user.name,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0)),
          ),
        ),
        Positioned(
          left: MediaQuery.of(context).size.width / 2.9,
          bottom: -50,
          child: GestureDetector(
            onTap: cameraTap,
            child: Container(
              height: 130,
              width: 130,
              color: Colors.grey[400],
              child: (widget.user.url != 'null')
                  ? Image.network(widget.user.url)
                  : Image.asset('images/profile.png'),
            ),
          ),
        ),
      ],
    );
  }

  Widget partOne() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.settings),
              Text('Basic information'),
            ],
          ),
          SizedBox(height: 10.0),
          Row(
            children: [
              Expanded(
                  child: Text('Phone ',
                      style: TextStyle(fontWeight: FontWeight.bold))),
              Expanded(child: Text(widget.user.phone)),
            ],
          ),
          Row(
            children: [
              Expanded(
                  child: Text('Company ',
                      style: TextStyle(fontWeight: FontWeight.bold))),
              Expanded(child: Text(widget.user.company)),
            ],
          ),
        ],
      ),
    );
  }

  Widget partTwo() {
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.blue[600],
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: (isLoad)
            ? Center(child: CircularProgressIndicator(color: Colors.green))
            : SingleChildScrollView(
                child: Column(
                  children: [
                    profilePic(),
                    SizedBox(height: 60.0),
                    partOne(),
                    partTwo(),
                  ],
                ),
              ),
      ),
    );
  }
}
