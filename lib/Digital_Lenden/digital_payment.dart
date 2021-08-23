import 'package:flutter/material.dart';

class DigitalPayment extends StatefulWidget {
  const DigitalPayment({Key? key}) : super(key: key);

  @override
  _DigitalPaymentState createState() => _DigitalPaymentState();
}

class _DigitalPaymentState extends State<DigitalPayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        label: Text('নতুন লিংক',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17.0,color:Colors.white),),
        icon: Icon(Icons.add),
        backgroundColor: Colors.teal[600],
        foregroundColor: Colors.white,
        onPressed: () {},
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Text('ডিজিটাল লেনদেন', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
      ),
    body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Image.asset('images/collection.png',
                          height: 90, width: 90)),
                  SizedBox(width: 8.0),
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'ডিজিটাল লেনদেন',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            )),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                              'ডিজিটাল লেনদেনের মাধ্যমে আপনার লেন্দেন নিরাপদ করুন!'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                  color: Colors.grey[200],
                ),
                padding: EdgeInsets.only(
                    top: 12.0, bottom: 12.0, left: 25.0, right: 25.0),
                child: Text('https:/payment.jomakhoroch/@user-name'),
              ),
              SizedBox(height: 30),
              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.share),
                label: Text('শেয়ার করুন',style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,color: Colors.white),),
                style: ElevatedButton.styleFrom(
                  primary: Colors.teal[700],
                  onPrimary: Colors.white,
                  minimumSize:
                      Size(MediaQuery.of(context).size.width * 0.8, 40),
                ),
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {},
                      child: Card(
                        color: Colors.green[100],
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            children: [
                              Icon(Icons.qr_code, color: Colors.teal[700]),
                              Text('QR কোড',
                                  style: TextStyle(color: Colors.teal[700])),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {},
                      child: Card(
                        color: Colors.green[100],
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            children: [
                              Icon(Icons.copy, color: Colors.teal[700]),
                              Text('কপি করুন',
                                  style: TextStyle(color: Colors.teal[700])),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {},
                      child: Card(
                        color: Colors.green[100],
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            children: [
                              Icon(Icons.more, color: Colors.teal[700]),
                              Text('বিস্তারিত',
                                  style: TextStyle(color: Colors.teal[700])),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.dashboard_customize),
                label: Text('কাস্টম লিংকের তালিকা',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0,color:Colors.black),),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.black,
                  minimumSize:
                      Size(MediaQuery.of(context).size.width * 0.92, 50),
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.question_answer),
                label: Text('ডিজিটাল কলেকশনের বিস্তারিত',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0,color:Colors.black)),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.black,
                  minimumSize:
                      Size(MediaQuery.of(context).size.width * 0.92, 50),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
