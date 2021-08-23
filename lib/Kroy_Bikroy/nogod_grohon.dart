import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jomakhoroch/Kroy_Bikroy/calculator_controller.dart';
import 'package:jomakhoroch/View/home_page.dart';

class NagadGrohon extends StatefulWidget {
  const NagadGrohon({Key? key}) : super(key: key);

  @override
  _NagadGrohonState createState() => _NagadGrohonState();
}

class _NagadGrohonState extends State<NagadGrohon> {
  final CalculatorController calculatorController =
      Get.put(CalculatorController());

  Widget buildText(double size, String text) {
    return Text(
      text,
      style: TextStyle(fontSize: size),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Container(
          height: 60.0,
          child: Padding(
            padding: const EdgeInsets.only(
                top: 8.0, bottom: 8.0, left: 20.0, right: 20.0),
            child: ElevatedButton(
              onPressed: () {
                Get.offAll(HomePage());
              },
              child: Text('নতুন বিক্রি শুরু করুন'),
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 70.0),
              Icon(Icons.check_rounded, color: Colors.teal, size: 50.0),
              SizedBox(height: 40.0),
              buildText(26.0, 'বিক্রয় সম্পন্ন হয়েছে'),
              SizedBox(height: 10.0),
              Container(
                color: Colors.grey[100],
                child: Padding(
                  padding: const EdgeInsets.only(top: 14.0, bottom: 14.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            buildText(26,
                                '৳' + calculatorController.totalSum.toString()),
                            buildText(20, 'মোট'),
                          ],
                        ),
                      ),
                      SizedBox(
                          height: 45.0,
                          child: VerticalDivider(
                              color: Colors.grey, thickness: 1.2)),
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            buildText(26, '৳0.00'),
                            buildText(20, 'ফেরত'),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
