import 'package:carousel_pro/carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jomakhoroch/HowToUse/howToUse.dart';
import 'package:jomakhoroch/Marketing&Promo/marketing.dart';
import 'package:jomakhoroch/Motamot&Poramoso/inbox.dart';
import 'package:jomakhoroch/View/bakir_khata.dart';
import 'package:jomakhoroch/Kroy_Bikroy/becha_bikri.dart';
import 'package:jomakhoroch/Kroy_Bikroy/contact_list.dart';
import 'package:jomakhoroch/Kroy_Bikroy/digital_payment.dart';
import 'package:jomakhoroch/View/online_store.dart';
import 'package:jomakhoroch/Tally_Khata/report.dart';
import 'package:jomakhoroch/Kroy_Bikroy/stock.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String name = 'shop';
  void fetchData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String sellerPhone = sharedPreferences.getString('Phone').toString();

    await FirebaseFirestore.instance
        .collection('Users')
        .doc(sellerPhone)
        .get()
        .then((value) {
      setState(() {
        name = value['Company'];
      });
    });
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.cyan[50],
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(36.0),
              child: AppBar(
                backgroundColor: Colors.teal[600],
                title: Row(
                  children: [
                    Expanded(
                        child: Text("জমা খরচ.কম",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold))),
                    Expanded(
                        child: Text(name,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold))),
                  ],
                ),
                centerTitle: false,
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(children: [
                  SizedBox(
                    height: 5.0,
                  ),
                  Container(
                    //width: 335,
                    child: GridView.count(
                      shrinkWrap: true,
                      primary: false,
                      padding: const EdgeInsets.all(20),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 2,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            //color: Colors.white,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                  15), //border corner radius
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey
                                      .withOpacity(0.2), //color of shadow
                                  spreadRadius: 5, //spread radius
                                  blurRadius: 7, // blur radius
                                  offset: Offset(
                                      0, 2), // changes position of shadow
                                ),
                              ],
                            ),
                            child: InkWell(
                              onTap: () {
                                Get.to(BechaBikri());
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 7),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Container(
                                          height: 90,
                                          width: 60,
                                          child:
                                              Image.asset("images/kroy.png")),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(8, 0, 8, 8),
                                    child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "ক্রয়-বিক্রয়",
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black),
                                        )),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            //color: Colors.white,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                  15), //border corner radius
                              boxShadow: [

                                BoxShadow(
                                  color: Colors.grey
                                      .withOpacity(0.2), //color of shadow
                                  spreadRadius: 5, //spread radius
                                  blurRadius: 7, // blur radius
                                  offset: Offset(
                                      0, 2), // changes position of shadow
                                ),

                              ],
                            ),
                            child: InkWell(
                              onTap: () {
                                Get.to(OnlineStore());
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 7),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Container(
                                          // height: 90,
                                          height: 90,
                                          width: 60,
                                          child:
                                              Image.asset("images/online.png")),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(8, 0, 8, 8),
                                    child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "অনলাইন স্টোর ",
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black),
                                        )),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            //color: Colors.white,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                  15), //border corner radius
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey
                                      .withOpacity(0.2), //color of shadow
                                  spreadRadius: 5, //spread radius
                                  blurRadius: 7, // blur radius
                                  offset: Offset(
                                      0, 2), // changes position of shadow
                                  //first paramerter of offset is left-right
                                  //second parameter is top to down
                                ),
                                //you can set more BoxShadow() here
                              ],
                            ),
                            child: InkWell(
                              onTap: () {
                                Get.to(DigitalPayment());
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 7),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Container(
                                          // height: 90,
                                          // width: 60,
                                          height: 90,
                                          width: 60,
                                          child: Image.asset(
                                              "images/digital.png")),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 5, 8, 5),
                                    child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "ডিজিটাল  লেনদেন",
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black),
                                        )),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                  15), //border corner radius
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey
                                      .withOpacity(0.2), //color of shadow
                                  spreadRadius: 5, //spread radius
                                  blurRadius: 7, // blur radius
                                  offset: Offset(
                                      0, 2), // changes position of shadow
                                ),
                                //you can set more BoxShadow() here
                              ],
                            ),
                            child: InkWell(
                              onTap: () {
                                Get.to(Report());
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 7),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Container(
                                          height: 90,
                                          width: 60,
                                          child:
                                              Image.asset("images/report.png")),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(8, 3.5, 8, 8),
                                    child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "লেনদেন রিপোর্ট",
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black),
                                        )),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 0,
                  ),

                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                        width: 300,
                        height: 160.0,
                        child:
                        Carousel(
                            images: [
                              AssetImage('images/f2.jpg'),
                              AssetImage('images/f3.jpg'),
                              //AssetImage('images/f1.jpg'),
                            ],
                            autoplay: false,
                            dotSize: 4,
                            dotSpacing: 15,
                            //dotColor: Colors.lightGreenAccent,
                            indicatorBgPadding: 0,
                            //dotBgColor: Colors.purple.withOpacity(0.5),
                            borderRadius: false,
                            moveIndicatorFromBottom: 180.0,
                            overlayShadow: false,
                            autoplayDuration: const Duration(seconds: 4)
                        ),
                    )
                  ),

                  SizedBox(
                    height: 0,
                  ),

                  Container(
                    child: GridView.count(
                      shrinkWrap: true,
                      primary: false,
                      padding: const EdgeInsets.all(20),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 3,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(2.5),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                  10), //border corner radius
                              boxShadow: [

                                BoxShadow(
                                  color: Colors.grey
                                      .withOpacity(0.2), //color of shadow
                                  spreadRadius: 5, //spread radius
                                  blurRadius: 7, // blur radius
                                  offset: Offset(
                                      0, 2), // changes position of shadow
                                ),

                                //you can set more BoxShadow() here
                              ],
                            ),
                            child: InkWell(
                              onTap: () {
                                Get.to(BakirKhata(true));
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Container(
                                          height: 50,
                                          width: 35,
                                          child:
                                              Image.asset("images/tali.png")),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(3, 4, 3, 0),
                                    child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "ট্যালী খাতা",
                                          style: TextStyle(
                                              fontSize: 15.5,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black),
                                        )),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.5),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                  10), //border corner radius
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey
                                      .withOpacity(0.2), //color of shadow
                                  spreadRadius: 5, //spread radius
                                  blurRadius: 7, // blur radius
                                  offset: Offset(
                                      0, 2), // changes position of shadow
                                ),
                                //you can set more BoxShadow() here
                              ],
                            ),
                            child: InkWell(
                              onTap: () {
                                Get.to(ContactList(false, true));
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Container(
                                          height: 50,
                                          width: 35,
                                          child:
                                              Image.asset("images/cont.png")),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(3, 4, 3, 0),
                                    child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "কন্টাক্ট লিস্ট",
                                          style: TextStyle(
                                              fontSize: 15.5,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black),
                                        )),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.5),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                  10), //border corner radius
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey
                                      .withOpacity(0.2), //color of shadow
                                  spreadRadius: 5, //spread radius
                                  blurRadius: 7, // blur radius
                                  offset: Offset(
                                      0, 2), // changes position of shadow
                                ),
                                //you can set more BoxShadow() here
                              ],
                            ),
                            child: InkWell(
                              onTap: () {
                                Get.to(Stock(true));
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Container(
                                          height: 50,
                                          width: 35,
                                          child:
                                              Image.asset("images/stock.png")),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(3, 4, 3, 0),
                                    child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "পণ্য স্টক",
                                          style: TextStyle(
                                              fontSize: 15.5,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black),
                                        )),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

/////////////////////////////////////////////////////////////////////
                  Padding(
                    padding: const EdgeInsets.all(2.5),
                    child: Container(
                      height: 85,
                      width: 310,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.circular(12), //border corner radius
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
                      child: InkWell(
                        onTap: () {
                          Get.to(Marketing());
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //SizedBox(height: 15,),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(15, 10, 0, 10),
                              child: Align(
                                alignment: Alignment.center,
                                child: Container(
                                    height: 70,
                                    width: 60,
                                    child: Image.asset("images/dgm.png")),
                              ),
                            ),

                            Container(
                              //width: 220,
                              width: 230,
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 15, 5, 15),
                                child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "মার্কেটিং ও প্রোমো",
                                      style: TextStyle(
                                          fontSize: 22.0,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black),
                                    )),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
/////////////////////////////////////////////////////////////////////////

                  SizedBox(
                    height: 15,
                  ),

                  Container(
                    //width: 320,
                    width: 330,
                    child: GridView.count(
                      shrinkWrap: true,
                      primary: false,
                      padding: const EdgeInsets.all(0),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 2,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            //color: Colors.white,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                  15), //border corner radius
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey
                                      .withOpacity(0.2), //color of shadow
                                  spreadRadius: 5, //spread radius
                                  blurRadius: 7, // blur radius
                                  offset: Offset(
                                      0, 2), // changes position of shadow
                                ),
                              ],
                            ),
                            child: InkWell(
                              onTap: () {
                                Get.to(InBox());
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 7),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Container(
                                          height: 90,
                                          width: 60,
                                          child:
                                              Image.asset("images/prosno.png")),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(8, 0, 8, 8),
                                    child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "মতামত ও পরামর্শ",
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black),
                                        )),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            //color: Colors.white,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                  15), //border corner radius
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey
                                      .withOpacity(0.2), //color of shadow
                                  spreadRadius: 5, //spread radius
                                  blurRadius: 7, // blur radius
                                  offset: Offset(
                                      0, 2), // changes position of shadow
                                ),
                              ],
                            ),
                            child: InkWell(
                              onTap: () {
                                Get.to(Use());
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 7),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Container(
                                          // height: 90,
                                          height: 70,
                                          width: 60,
                                          child: CircleAvatar(
                                              child: Image.asset(
                                                  "images/kivabe.png"))),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(8, 0, 8, 8),
                                      child: Text(
                                        "কীভাবে ব্যাবহার করবেন?",
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 15,
                  )
                ]),
              ),
            )));
  }
}
