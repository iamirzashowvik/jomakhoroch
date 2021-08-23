import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jomakhoroch/Kroy_Bikroy/calculator_controller.dart';
import 'package:jomakhoroch/Kroy_Bikroy/cash_contact_list.dart';
import 'package:jomakhoroch/Kroy_Bikroy/contact_list.dart';

class TkMethod extends StatefulWidget {
  const TkMethod({Key? key}) : super(key: key);
  @override
  _TkMethodState createState() => _TkMethodState();
}

class _TkMethodState extends State<TkMethod> {
  final CalculatorController calculatorController =
      Get.put(CalculatorController());

  void cashTap() {
    Get.to(CashContactList(half: false));
  }

  void halfTap() {
    Get.to(CashContactList(half: true));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title:
            Text('টাকা পরিশোধের মাধ্যম', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Text('সর্বমোট',style: TextStyle(fontSize: 22,color: Colors.black),),
              Text('৳ ' + calculatorController.totalSum.toString(),
                  style: TextStyle(fontSize: 30.0,color: Colors.red)),

              SizedBox(height: 20.0),
              Align(
                  alignment: Alignment.topLeft, child: Text('গৃহীত ক্যাশ',style: TextStyle(fontSize: 20,color: Colors.black))
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: Text(calculatorController.totalSum.toString(),style:TextStyle(fontSize: 23.0,color: Colors.red))
              ),

              SizedBox(height: 10.0),



              ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [

                  SizedBox(height: 15.0),

                  Container(
                    color: Colors.white,
                    child: ListTile(
                      tileColor: Colors.grey[200],
                      title: Text('নগদ গ্রহণ',style: TextStyle(fontSize: 18,color: Colors.black),),
                      leading: Icon(Icons.money,size: 30,),
                      trailing: Icon(Icons.arrow_forward),
                      onTap: cashTap,
                    ),
                  ),
                  SizedBox(height: 15.0),
                  /*ListTile(
                    tileColor: Colors.grey[200],
                    title: Text('ডিজিটাল পেমেন্ট'),
                    leading: Icon(Icons.mobile_friendly),
                    trailing: Icon(Icons.arrow_forward),
                    onTap: () {
                      Get.to(DigitalPayment());
                    },
                  ),
                  SizedBox(height: 15.0),*/
                  Container(
                    color: Colors.white,
                    child: ListTile(
                      tileColor: Colors.grey[200],
                      title: Text('বাকি রাখুন',style: TextStyle(fontSize: 18,color: Colors.black),),
                      leading: Icon(Icons.note,size: 30,),
                      trailing: Icon(Icons.arrow_forward),
                      onTap: () {
                        Get.to(ContactList(true, false));
                      },
                    ),
                  ),
                  SizedBox(height: 15.0),

                  Container(
                    color: Colors.white,
                    child: ListTile(
                      tileColor: Colors.grey[200],
                      title: Text('আংশিক পরিশোধ',style: TextStyle(fontSize: 18,color: Colors.black),),
                      leading: Icon(Icons.monetization_on,size: 30,),
                      trailing: Icon(Icons.arrow_forward),
                      onTap: halfTap,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  // ListTile(
                  //   tileColor: Colors.grey[200],
                  //   title: Text('কিস্তি'),
                  //   leading: Icon(Icons.calendar_today),
                  //   trailing: Icon(Icons.arrow_forward),
                  //   onTap: () {
                  //     //Get.to(Kisti());
                  //   },
                  // ),
                  // SizedBox(height: 15.0),
                  // ListTile(
                  //   tileColor: Colors.grey[200],
                  //   title: Text('আপনার QR কোড সেট করুন'),
                  //   leading: Icon(Icons.qr_code),
                  //   trailing: Icon(Icons.arrow_forward),
                  //   onTap: () {},
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
