import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jomakhoroch/View/my_profile.dart';
import 'package:package_info/package_info.dart';
import 'package:jomakhoroch/Model/user.dart';
import 'package:jomakhoroch/View/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Tools extends StatefulWidget {
  const Tools({Key? key}) : super(key: key);
  @override
  _ToolsState createState() => _ToolsState();
}

class _ToolsState extends State<Tools> {
  bool isLoad = false;
  String version = 'loading';
  User user = User('loading', '', '', '', '', '', '', 'null');

  void getPackage() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String versionName = packageInfo.version;
    setState(() {
      version = 'version ' + versionName;
    });
  }

  void fetchData() async {
    setState(() {
      isLoad = true;
    });
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String sellerPhone = sharedPreferences.getString('Phone').toString();

    await FirebaseFirestore.instance
        .collection('Users')
        .doc(sellerPhone)
        .get()
        .then((value) {
      setState(() {
        user = new User(
            value['Phone'],
            value['Pin'],
            value['Company'],
            value['CompanyType'],
            value['Gender'],
            value['Name'],
            value['Online'],
            value['image']);
        isLoad = false;
      });
    });
  }

  void logoutTap() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
    Get.offAll(Login());
  }

  @override
  void initState() {
    super.initState();
    fetchData();
    getPackage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: (isLoad)
            ? CircularProgressIndicator(color: Colors.green)
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        width: double.infinity,
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              children: [
                                Expanded(
                                    flex: 2,
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Column(
                                        children: [
                                          Text(user.name,
                                              style: TextStyle(
                                                  fontSize: 22.0,
                                                  fontWeight:
                                                      FontWeight.bold)),
                                          TextButton.icon(
                                            onPressed: () {
                                              Get.to(MyProfile(user));
                                            },
                                            label:
                                            Text('আপনার প্রোফাইল দেখুন',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),),
                                            icon:
                                                Icon(Icons.arrow_forward_ios),

                                            style: TextButton.styleFrom(
                                              primary: Colors.green,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )),
                                Expanded(
                                    flex: 1,
                                    child: (user.url != 'null')
                                        ? Image.network(user.url,
                                            height: 80, width: 80)
                                        : Image.asset('images/profile.png',
                                            height: 80, width: 80)),
                              ],
                            ),
                          ),
                        )
                    ),

                    Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Column(
                          children: [


                            Align(
                              alignment: Alignment.topLeft,
                              child: Text('Full Name',
                                  style:
                                  TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18)),
                            ),

                          SizedBox(height: 10,),

                          Align(
                            alignment: Alignment.topLeft,
                              child: Text('Email',
                                  style:
                                  TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18)),
                            ),

                            SizedBox(height: 10,),

                            Align(
                              alignment: Alignment.topLeft,
                              child: Text('Phone',
                                  style:
                                  TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18)),
                            ),


                            SizedBox(height: 10,),

                            Align(
                              alignment: Alignment.topLeft,
                              child: Text('Address',
                                  style:
                                  TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18)),
                            ),

                            SizedBox(height: 10,),

                            Align(
                              alignment: Alignment.topLeft,
                              child: Text('About',
                                  style:
                                  TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18)),
                            ),


                            SizedBox(height: 10,),

                            Align(
                              alignment: Alignment.center,
                              child: TextButton.icon(
                                onPressed: logoutTap,
                                label: Text('Logout',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black), ),
                                icon: Icon(Icons.logout),

                                style: TextButton.styleFrom(
                                  primary: Colors.red[900],
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text(version),
                            ),
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              )
    );
  }
}
