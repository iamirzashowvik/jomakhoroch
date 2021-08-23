import 'package:flutter/material.dart';

class Monthly extends StatefulWidget {
  final String cntS, totalS, cntC, totalC, cntB, totalB;
  Monthly(
      this.cntS, this.totalS, this.cntC, this.totalC, this.cntB, this.totalB);

  @override
  _MothlyState createState() => _MothlyState();
}

class _MothlyState extends State<Monthly> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.grey[200],
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(top: 5.0),
              child: Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(top: 14.0, bottom: 14.0),
                  child: Column(
                    children: [
                      Text('সর্বমোট সেলস',
                          style: TextStyle(fontSize: 16.0, color: Colors.grey)),
                      SizedBox(height: 10.0),
                      Text('৳ ${widget.totalS}',
                          style: TextStyle(
                              fontSize: 24.0, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 2.0),
            Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 14.0, bottom: 14.0, left: 8.0, right: 8.0),
                child: Column(
                  children: [
                    Text('বেচা বিক্রি রিপোর্ট',
                        style: TextStyle(fontSize: 16.0, color: Colors.grey)),
                    SizedBox(height: 18.0),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Row(
                            children: [
                              Container(
                                height: 10.0,
                                width: 10.0,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: Colors.red),
                              ),
                              SizedBox(width: 5.0),
                              Expanded(
                                  child: Text('মোট বিক্রি - ${widget.cntS}')),
                            ],
                          ),
                        ),
                        Expanded(
                            flex: 1,
                            child: Text(
                              '৳ ${widget.totalS}',
                              textAlign: TextAlign.right,
                            )),
                      ],
                    ),
                    Divider(),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Row(
                            children: [
                              Container(
                                height: 10.0,
                                width: 10.0,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: Colors.blue),
                              ),
                              SizedBox(width: 5.0),
                              Expanded(
                                  child: Text('মোট কালেকশন - ${widget.cntC}')),
                            ],
                          ),
                        ),
                        Expanded(
                            flex: 1,
                            child: Text(
                              '৳ ${widget.totalC}',
                              textAlign: TextAlign.right,
                            )),
                      ],
                    ),
                    Divider(),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Row(
                            children: [
                              Container(
                                height: 10.0,
                                width: 10.0,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: Colors.purple),
                              ),
                              SizedBox(width: 5.0),
                              Expanded(
                                  child: Text('মোট বাকি - ${widget.cntB}')),
                            ],
                          ),
                        ),
                        Expanded(
                            flex: 1,
                            child: Text(
                              '৳ ${widget.totalB}',
                              textAlign: TextAlign.right,
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}