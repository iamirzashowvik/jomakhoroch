import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jomakhoroch/Lenden_Report/customer_report.dart';
import 'package:jomakhoroch/Lenden_Report/dashboard.dart';
import 'package:jomakhoroch/Lenden_Report/prod_report.dart';

class Report extends StatefulWidget {
  const Report({Key? key}) : super(key: key);
  @override
  _ReportState createState() => _ReportState();
}

class _ReportState extends State<Report> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Text('লেনদেন রিপোর্ট', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: [

          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  Get.to(ProdReport());
                },
                leading:
                    Image.asset('images/r2.png', height: 40.0, width: 40.0),
                trailing: Icon(Icons.arrow_forward, color: Colors.teal),
                title: Text('পণ্য অনুযায়ী বিক্রয় রিপোর্ট'),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  Get.to(CustomerReport());
                },
                leading:
                    Image.asset('images/r3.jpg', height: 40.0, width: 40.0),
                trailing: Icon(Icons.arrow_forward, color: Colors.teal),
                title: Text('কাস্টমার অনুযায়ী বিক্রয় রিপোর্ট'),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(12.0),
            child:
            Card(
              child: ListTile(
                onTap: () {
                  Get.to(DashBoard());
                },
                leading:
                    Image.asset('images/r1.jpg', height: 40.0, width: 40.0),
                trailing: Icon(Icons.arrow_forward, color: Colors.teal),
                title: Text('সাধারণ হিসাব বিবরণী'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
