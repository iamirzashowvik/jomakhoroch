// @dart=2.9
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key key}) : super(key: key);
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.pink[50],
            body: SingleChildScrollView(
              child: Padding(
                //padding: const EdgeInsets.all(5.0),
                padding: const EdgeInsets.all(0.0),
                child: Column(children: [
                  ///////////////////
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.red[400],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(0),
                        bottomRight: Radius.circular(30.0),
                        bottomLeft: Radius.circular(30.0),
                      ), //border corner radius
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2), //color of shadow
                          spreadRadius: 5, //spread radius
                          blurRadius: 7, // blur radius
                          offset: Offset(0, 2), // changes position of shadow
                        ),
                      ],
                    ),
                    //padding: const EdgeInsets.all(20),
                    height: 130,
                    width: 360,
                    //color: Colors.red[400],
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Text(
                                    "আজকের বিক্রি",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    "১০,৫০০ টাকা",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.blueAccent,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                            const VerticalDivider(
                              color: Colors.grey,
                              thickness: 1,
                              indent: 20,
                              endIndent: 0,
                              width: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Text(
                                    "অনলাইন বিক্রি",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    "৫০০ টাকা",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.blueAccent,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15.0),
                              topRight:
                                  Radius.circular(15.0)), //border corner radius
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey
                                  .withOpacity(0.2), //color of shadow
                              spreadRadius: 5, //spread radius
                              blurRadius: 7, // blur radius
                              offset:
                                  Offset(0, 2), // changes position of shadow
                            ),
                          ],
                        ),

                        height: 65,
                        width: 280,
                        //color: Colors.white,
                      ),
                    ),
                  ),

                  Container(
                    child: Column(
                      children: [
                        Divider(
                          height: 12,
                          thickness: 2,
                          indent: 10,
                          endIndent: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "বিক্রি ইতিহাস",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w200),
                            ),
                            Text(
                              " অনলাইন ইতিহাস",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w200),
                            ),
                          ],
                        )
                      ],
                    ),

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15.0),
                          bottomRight:
                              Radius.circular(15.0)), //border corner radius
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2), //color of shadow
                          spreadRadius: 5, //spread radius
                          blurRadius: 7, // blur radius
                          offset: Offset(0, 2), // changes position of shadow
                        ),
                      ],
                    ),

                    width: 280,
                    //color: Colors.white,
                    height: 30,
                  ),
                  ///////////////////

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
                              // onTap: () {
                              //   Get.to(BechaBikri());
                              // },
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
                                        const EdgeInsets.fromLTRB(8, 4, 8, 8),
                                    child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "বিক্রয় করুন",
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
                              // onTap: () {
                              //   Get.to(OnlineStore());
                              // },
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
                                              Image.asset("images/store.png")),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(8, 4, 8, 8),
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
                              // onTap: () {
                              //   Get.to(DigitalPayment());
                              // },
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
                                          child:
                                              Image.asset("assets/report.png")),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(4, 5, 8, 5),
                                    child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "রিপোর্ট",
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
                              // onTap: () {
                              //   Get.to(Report());
                              // },
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
                                          //height: 90,
                                          height: 90,
                                          //width: 60,
                                          width: 50,
                                          child: Image.asset(
                                              "assets/prolist.png")),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(8, 3.5, 8, 8),
                                    child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "প্রোডাক্ট লিস্ট",
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

                  Container(
                    child: GridView.count(
                      shrinkWrap: true,
                      primary: false,
                      padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
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
                              // onTap: () {
                              //   Get.to(BakirKhata(true));
                              // },
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
                                              Image.asset("assets/hisab.png")),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(3, 4, 3, 0),
                                    child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "বিক্রয় হিসাব",
                                          style: TextStyle(
                                              fontSize: 14,
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
                              // onTap: () {
                              //   Get.to(ContactList(false, true));
                              // },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Container(
                                          //height: 50,
                                          height: 50,
                                          //width: 35,
                                          width: 35,
                                          child: Image.asset("assets/p.png")),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(3, 4, 3, 0),
                                    child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "ফোনবুক",
                                          style: TextStyle(
                                              fontSize: 14,
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
                              // onTap: () {
                              //   Get.to(Stock(true));
                              // },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Container(
                                          //height: 50,
                                          height: 40,
                                          width: 35,
                                          child: Image.asset(
                                              "assets/payment.png")),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        //const EdgeInsets.fromLTRB(3, 4, 3, 0),
                                        const EdgeInsets.fromLTRB(3, 4, 0, 0),
                                    child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "  ডিজিটাল \n   পেমেন্ট",
                                          style: TextStyle(
                                              //fontSize: 15.5,
                                              fontSize: 14,
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

                  Container(
                    child: GridView.count(
                      shrinkWrap: true,
                      primary: false,
                      padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
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
                              // onTap: () {
                              //   Get.to(BakirKhata(true));
                              // },
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
                                          child: Image.asset("assets/cal.png")),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(3, 4, 3, 0),
                                    child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "ক্যালকুলেটর",
                                          style: TextStyle(
                                              fontSize: 14,
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
                              // onTap: () {
                              //   Get.to(ContactList(false, true));
                              // },
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
                                          child: Image.asset(
                                              "assets/contact.png")),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(3, 4, 3, 0),
                                    child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "কন্ট্রাক্ট নাম্বার",
                                          style: TextStyle(
                                              fontSize: 14,
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
                              // onTap: () {
                              //   Get.to(Stock(true));
                              // },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Container(
                                          //height: 50,
                                          height: 40,
                                          width: 35,
                                          child:
                                              Image.asset("assets/promo.png")),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        //const EdgeInsets.fromLTRB(3, 4, 3, 0),
                                        const EdgeInsets.fromLTRB(3, 2, 0, 0),
                                    child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "  মার্কেটিং \n  প্রোমো",
                                          style: TextStyle(
                                              //fontSize: 15.5,
                                              fontSize: 14,
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
                    height: 20,
                  ),

                  Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: 300,
                        height: 130,
                        child: Carousel(
                            images: [
                              AssetImage('assets/c1.png'),
                              //AssetImage('images/f3.jpg'),
                              //AssetImage('images/f1.jpg'),
                            ],
                            autoplay: false,
                            dotSize: 0,
                            dotSpacing: 15,
                            //dotColor: Colors.lightGreenAccent,
                            indicatorBgPadding: 0,
                            //dotBgColor: Colors.purple.withOpacity(0.5),
                            borderRadius: false,
                            moveIndicatorFromBottom: 180.0,
                            overlayShadow: false,
                            autoplayDuration: const Duration(seconds: 4)),
                      )),

                  SizedBox(
                    height: 0,
                  ),

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
                              // onTap: () {
                              //   Get.to(InBox());
                              // },
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
                                          child: Image.asset(
                                              "assets/motamot.png")),
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
                              // onTap: () {
                              //   Get.to(Use());
                              // },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    //padding: const EdgeInsets.only(top: 7),
                                    padding: const EdgeInsets.only(top: 12),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Container(
                                          // height: 90,
                                          height: 70,
                                          width: 60,
                                          child: CircleAvatar(
                                              child: Image.asset(
                                                  "assets/kivabe.png"))),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding:
                                          //const EdgeInsets.fromLTRB(8, 0, 8, 8),
                                          const EdgeInsets.fromLTRB(
                                              12, 3.5, 8, 8),
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
