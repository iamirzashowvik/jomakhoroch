import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jomakhoroch/View/login.dart';
import 'package:jomakhoroch/View/register.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SecondX extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smooth Page Indicator Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePagess(),
    );
  }
}

class HomePagess extends StatefulWidget {
  @override
  _HomePagessState createState() => _HomePagessState();
}

class _HomePagessState extends State<HomePagess> {
  final controller = PageController(viewportFraction: 0.8, keepPage: true);

  @override
  Widget build(BuildContext context) {
    final pages = List.generate(
        6,
        (index) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.grey.shade300,
              ),
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              child: Container(
                height: 280,
                child: Center(
                    child: Text(
                  "Page $index",
                  style: TextStyle(color: Colors.red),
                )),
              ),
            ));
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 200),
              Align(
                alignment: Alignment.center,
                child: SmoothPageIndicator(
                  controller: controller,
                  count: pages.length,
                  effect: WormEffect(
                      dotHeight: 16,
                      dotWidth: 16,
                      type: WormType.thin,
                      dotColor: Colors.red
                      // strokeWidth: 5,
                      ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      "আপনার একাউন্ট থেকে থাকলে লগইন করুন",
                      style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                    ),
                  )),
              Container(
                height: 40,
                width: 220,
                decoration: BoxDecoration(
                  color: Colors.red[500],
                  borderRadius:
                      BorderRadius.circular(10), //border corner radius
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2), //color of shadow
                      spreadRadius: 5, //spread radius
                      blurRadius: 7, // blur radius
                      offset: Offset(0, 2), // changes position of shadow
                    ),
                  ],
                ),
                //color: Colors.cyan[700],
                child: InkWell(
                  onTap: () {
                    Get.to(Login());
                  },
                  child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "লগইন করুন",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      )),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      "দোকান হাবে নতুন হলে রেজিষ্ট্রেশন করুন",
                      style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                    ),
                  )),
              Container(
                height: 40,
                width: 220,
                decoration: BoxDecoration(
                  color: Colors.lightBlue[900],
                  borderRadius:
                      BorderRadius.circular(10), //border corner radius
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2), //color of shadow
                      spreadRadius: 5, //spread radius
                      blurRadius: 7, // blur radius
                      offset: Offset(0, 2), // changes position of shadow
                    ),
                  ],
                ),
                //color: Colors.cyan[700],
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Registration()));
                  },
                  child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "রেজিষ্ট্রেশন করুন",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
