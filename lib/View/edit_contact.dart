import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jomakhoroch/Kroy_Bikroy/contact_list_controller.dart';
import 'package:jomakhoroch/Contact_List/contact.dart';
import 'package:jomakhoroch/Kroy_Bikroy/contact_list.dart';

class EditContact extends StatefulWidget {
  final Contact contact;
  const EditContact(this.contact);

  @override
  _EditContactState createState() => _EditContactState();
}

class _EditContactState extends State<EditContact> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addController = TextEditingController();
  TextEditingController noteController = TextEditingController();

  bool more = false;
  var image;
  String onlineGroupValue = 'Customer';

  @override
  void initState() {
    super.initState();

    String phone = widget.contact.phone;
    String name = widget.contact.name;
    String email = widget.contact.email;
    String add = widget.contact.address;
    String note = widget.contact.note;

    phoneController = TextEditingController(text: phone);
    nameController = TextEditingController(text: name);
    emailController = TextEditingController(text: email);
    addController = TextEditingController(text: add);
    noteController = TextEditingController(text: note);

    onlineGroupValue = widget.contact.type;
  }

  Widget buildTextFeild(controller, String label, bool icon) {
    return TextField(
      enabled: (label == 'মোবাইল নম্বর') ? false : true,
      maxLength: (icon) ? 14 : null,
      controller: controller,
      keyboardType: (icon) ? TextInputType.number : TextInputType.text,
      decoration: InputDecoration(
        suffixIcon:
            (icon) ? Icon(Icons.contact_page, color: Colors.green) : null,
        labelText: label,
        labelStyle: TextStyle(fontSize: 16.0),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.green, width: 2.0)),
      ),
    );
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

  void btnTap() async {
    if (image == null) {
      await FirebaseFirestore.instance
          .collection('Contacts')
          .doc(widget.contact.id)
          .update({
        'Name': nameController.text.trim(),
        'Emai;': emailController.text.trim(),
        'Address': addController.text.trim(),
        'Note': noteController.text.trim(),
        'Type': onlineGroupValue,
      }).then((value) {
        Get.delete<ContactListController>();
        Get.off(ContactList(false, true));
      }).onError((error, stackTrace) {
        Get.snackbar('Error', error.toString());
      });
    } else {
      var snapshot = await FirebaseStorage.instance
          .ref()
          .child(
              'Profile/+88${phoneController.text.trim()}${nameController.text.trim()}${DateTime.now()}')
          .putFile(image);
      snapshot.ref.getDownloadURL().then((value) async {
        await FirebaseFirestore.instance
            .collection('Contacts')
            .doc(widget.contact.id)
            .update({
          'Name': nameController.text.trim(),
          'Emai;': emailController.text.trim(),
          'Address': addController.text.trim(),
          'Note': noteController.text.trim(),
          'Type': onlineGroupValue,
          'imageUrl': value,
        }).then((value) {
          Get.delete<ContactListController>();
          Get.off(ContactList(false, true));
        });
      }).onError((error, stackTrace) {
        Get.snackbar('Error', error.toString());
      });
    }
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
              primary: Colors.green,
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
        title: Text('এডিট কন্টাক্ট', style: TextStyle(color: Colors.black)),
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
                                activeColor: Colors.green,
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
                                activeColor: Colors.green,
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
                    icon: Icon(Icons.arrow_downward, color: Colors.green),
                    onPressed: moreTap,
                    label:
                        Text('আরো তথ্য', style: TextStyle(color: Colors.green)),
                  ),
                  (more)
                      ? Column(
                          children: [
                            (image == null)
                                ? IconButton(
                                    onPressed: cameraTap,
                                    icon: Icon(Icons.camera_alt_rounded,
                                        color: Colors.green, size: 40.0))
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
