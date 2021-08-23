import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jomakhoroch/View/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InfoSubmit extends StatefulWidget {
  final String phoneNo;
  final String pinCode;
  InfoSubmit(this.phoneNo, this.pinCode);

  @override
  _InfoSubmitState createState() => _InfoSubmitState();
}

class _InfoSubmitState extends State<InfoSubmit> {
  TextEditingController nameController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  String genderGroupValue = 'Male';
  String onlineGroupValue = 'Yes';
  List catagory = [
    'মুদির দোকান',
    'হার্ডওয়্যার দোকান',
    'ইলেকট্রনিক্স দোকান',
    'ষ্টেশনারী দোকান'
  ];
  String catagoryChoose = '';
  String hintText = 'আপনার ব্যবসা ধরণ *';

  void btnTap() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (catagoryChoose != '') {
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(widget.phoneNo)
          .set({
        'Phone': widget.phoneNo,
        'Pin': widget.pinCode,
        'Name': nameController.text.trim(),
        'Company': companyController.text.trim(),
        'CompanyType': catagoryChoose,
        'Gender': genderGroupValue,
        'Online': onlineGroupValue,
        'image': 'null',
      }).then((value) {
        sharedPreferences.setString('Phone', '+88' + widget.phoneNo);
        Get.offAll(HomePage());
      });
    } else {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                content: Text('সব কিছু সাবমিট করুন'),
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
          title: Text('আপনার তথ্য দিন', style: TextStyle(color: Colors.black)),
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
          color: Colors.grey[100],
          child: SingleChildScrollView(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 20.0, bottom: 20.0, left: 20.0, right: 20.0),
                child: Column(
                  children: [
                    TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        labelText: 'আপনার নাম *',
                        focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.green, width: 2.0)),
                      ),
                    ),
                    SizedBox(height: 25.0),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text('আপনার লিঙ্গ *')),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        children: [
                          Radio(
                            value: 'Male',
                            activeColor: Colors.green,
                            groupValue: genderGroupValue,
                            onChanged: (val) {
                              setState(() {
                                genderGroupValue = val.toString();
                              });
                            },
                          ),
                          Text('পুরুষ'),
                          SizedBox(width: 8.0),
                          Radio(
                            value: 'Female',
                            activeColor: Colors.green,
                            groupValue: genderGroupValue,
                            onChanged: (val) {
                              setState(() {
                                genderGroupValue = val.toString();
                              });
                            },
                          ),
                          Text('মহিলা'),
                          SizedBox(width: 8.0),
                          Radio(
                            value: 'Other',
                            activeColor: Colors.green,
                            groupValue: genderGroupValue,
                            onChanged: (val) {
                              setState(() {
                                genderGroupValue = val.toString();
                              });
                            },
                          ),
                          Text('অনন্যা'),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.0),
                    TextField(
                      controller: companyController,
                      decoration: InputDecoration(
                        labelText: 'আপনার ব্যবসা প্রতিষ্ঠানের নাম *',
                        focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.green, width: 2.0)),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    DropdownButton(
                      hint: Text(hintText),
                      icon: Icon(Icons.arrow_drop_down, color: Colors.green),
                      iconSize: 36.0,
                      isExpanded: true,
                      focusColor: Colors.green,
                      onChanged: (value) {
                        setState(() {
                          catagoryChoose = value.toString();
                          hintText = value.toString();
                        });
                      },
                      items: catagory.map<DropdownMenuItem<String>>((value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 20.0),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text('আপনি কি অনলাইনে ব্যবসা করতে চান? *')),
                    Row(
                      children: [
                        Radio(
                          value: 'Yes',
                          activeColor: Colors.green,
                          groupValue: onlineGroupValue,
                          onChanged: (val) {
                            setState(() {
                              onlineGroupValue = val.toString();
                            });
                          },
                        ),
                        Text('হ্যাঁ'),
                        SizedBox(width: 8.0),
                        Radio(
                          value: 'No',
                          activeColor: Colors.green,
                          groupValue: onlineGroupValue,
                          onChanged: (val) {
                            setState(() {
                              onlineGroupValue = val.toString();
                            });
                          },
                        ),
                        Text('না'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
