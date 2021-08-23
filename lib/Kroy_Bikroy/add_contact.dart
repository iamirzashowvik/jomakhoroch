import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jomakhoroch/Kroy_Bikroy/baki_controller.dart';
import 'package:jomakhoroch/Kroy_Bikroy/contact_list_controller.dart';
import 'package:jomakhoroch/Kroy_Bikroy/contact_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddContact extends StatefulWidget {
  final String type;
  const AddContact(this.type);
  @override
  _AddContactState createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addController = TextEditingController();
  TextEditingController noteController = TextEditingController();

  bool more = false;
  var image;
  String onlineGroupValue = 'Customer';

  void btnTap() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String sellerPhone = sharedPreferences.getString('Phone').toString();

    if (phoneController.text.trim() == '' || nameController.text.trim() == '') {
      Get.snackbar('Error', 'Please fill mobile number and name');
    } else {
      if (image == null) {
        await FirebaseFirestore.instance.collection('Contacts').doc().set({
          'Phone': '+88' + phoneController.text.trim(),
          'Name': nameController.text.trim(),
          'imageUrl': 'null',
          'Emai;': emailController.text.trim(),
          'Address': addController.text.trim(),
          'Note': noteController.text.trim(),
          'Type': onlineGroupValue,
          'Seller': sellerPhone,
        }).then((value) {
          Get.delete<ContactListController>();
          if (widget.type == 'Baki') {
            Get.off(ContactList(true, false));
          } else {
            Get.off(ContactList(false, true));
          }
        });
      } else {
        print('ekhane asche !!!!!!!!!!!!');
        var snapshot = await FirebaseStorage.instance
            .ref()
            .child(
                'Profile/+88${phoneController.text.trim()}${nameController.text.trim()}${DateTime.now()}')
            .putFile(image);
        snapshot.ref.getDownloadURL().then((value) async {
          print(value);
          await FirebaseFirestore.instance.collection('Contacts').doc().set({
            'Phone': '+88' + phoneController.text.trim(),
            'Name': nameController.text.trim(),
            'imageUrl': value,
            'Emai;': emailController.text.trim(),
            'Address': addController.text.trim(),
            'Note': noteController.text.trim(),
            'Type': onlineGroupValue,
            'Seller': sellerPhone,
          }).then((value) {
            Get.delete<ContactListController>();
            Get.delete<BakiController>();
            if (widget.type == 'Baki') {
              Get.off(ContactList(true, false));
            } else {
              Get.off(ContactList(false, true));
            }
          });
        }).onError((error, stackTrace) {
          Get.snackbar('Error', error.toString());
        });
      }
    }
  }

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
  }

  void moreTap() {
    setState(() {
      if (more) {
        more = false;
      } else {
        more = true;
      }
    });
  }

  Widget buildTextFeild(controller, String label, bool icon) {
    return TextField(
      maxLength: (icon) ? 11 : null,
      controller: controller,
      keyboardType: (icon) ? TextInputType.number : TextInputType.text,
      decoration: InputDecoration(
        suffixIcon:
            (icon) ? Icon(Icons.contact_page, color: Colors.teal) : null,
        labelText: label,
        labelStyle: TextStyle(fontSize: 16.0),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.teal, width: 2.0)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 60.0,
        child: Padding(
          padding: const EdgeInsets.only(
              top: 8.0, bottom: 8.0, left: 20.0, right: 20.0),
          child: ElevatedButton(
            onPressed: btnTap,
            child: Text('সেভ করুন'),
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
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Text('নতুন কন্টাক্ট', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.grey[400],
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  buildTextFeild(phoneController, 'মোবাইল নম্বর', true),
                  buildTextFeild(nameController, 'নাম', false),
                  SizedBox(height: 25.0),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Column(
                        children: [
                          Align(
                              alignment: Alignment.topLeft,
                              child: Text('কন্টাক্টের ধরণ নির্বাচন করুন')),
                          Row(
                            children: [
                              Radio(
                                value: 'Customer',
                                activeColor: Colors.teal,
                                groupValue: onlineGroupValue,
                                onChanged: (val) {
                                  setState(() {
                                    onlineGroupValue = val.toString();
                                  });
                                },
                              ),
                              Text('কাস্টমার'),
                              SizedBox(width: 8.0),
                              Radio(
                                value: 'Supplier',
                                activeColor: Colors.teal,
                                groupValue: onlineGroupValue,
                                onChanged: (val) {
                                  setState(() {
                                    onlineGroupValue = val.toString();
                                  });
                                },
                              ),
                              Text('সাপ্লাইয়ের'),
                            ],
                          ),
                        ],
                      )),
                  TextButton.icon(
                    icon: Icon(Icons.arrow_downward, color: Colors.teal),
                    onPressed: moreTap,
                    label:
                        Text('আরো তথ্য', style: TextStyle(color: Colors.teal)),
                  ),
                  (more)
                      ? Column(
                          children: [
                            (image == null)
                                ? IconButton(
                                    onPressed: cameraTap,
                                    icon: Icon(Icons.camera_alt_rounded,
                                        color: Colors.teal, size: 40.0))
                                : Image.file(image, height: 100, width: 100),
                            buildTextFeild(emailController, 'ইমেইল', false),
                            buildTextFeild(addController, 'ঠিকানা', false),
                            buildTextFeild(noteController, 'নোট', false),
                            SizedBox(height: 20.0),
                          ],
                        )
                      : Text(''),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
