import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jomakhoroch/Kroy_Bikroy/baki_controller.dart';
import 'package:jomakhoroch/Tally_Khata/baki_details.dart';
import 'package:jomakhoroch/Tally_Khata/pdf_api.dart';
import 'package:jomakhoroch/Kroy_Bikroy/contact_list.dart';
import 'package:jomakhoroch/Tally_Khata/report.dart';
import 'package:jomakhoroch/Kroy_Bikroy/stock.dart';

class BakirKhata extends StatefulWidget {
  const BakirKhata(bool bool, {Key? key}) : super(key: key);
  @override
  _BakirKhataState createState() => _BakirKhataState();
}

class _BakirKhataState extends State<BakirKhata> {
  final BakiController bakiController = Get.put(BakiController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        label: Text(
          'নতুন দেনাদার/পাওনাদার',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        icon: Icon(Icons.add),
        backgroundColor: Colors.teal[600],
        foregroundColor: Colors.white,
        onPressed: () {
          Get.to(ContactList(false, false));
        },
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Text('বাকির খাতা', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        actions: [
          PopupMenuButton(
              offset: Offset(0, 40),
              onSelected: (value) {
                if (value.toString() == 'pdf') {
                  //Get.to(Subs());
                } else if (value.toString() == 'how') {
                  //Get.to(Subs());
                } else if (value.toString() == 'faq') {
                  //Get.to(Subs());
                } else {
                  Get.to(Stock(true));
                }
              },
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    value: 'pdf',
                    child: Row(
                      children: [
                        Icon(Icons.add_sharp, color: Colors.green),
                        Text('পিডিএফ রিপোর্ট'),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 'stock',
                    child: Row(
                      children: [
                        Icon(Icons.backpack, color: Colors.green),
                        Text('স্টক তালিকা'),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 'how',
                    child: Row(
                      children: [
                        Icon(Icons.account_box, color: Colors.green),
                        Text('কিভাবে ব্যবহার করবো'),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 'faq',
                    child: Row(
                      children: [
                        Icon(Icons.account_circle, color: Colors.green),
                        Text('সাধারণ জিজ্ঞাসা'),
                      ],
                    ),
                  ),
                ];
              }),
        ],
      ),
      body: SingleChildScrollView(
          child: Obx(
        () => (bakiController.isLoad.value)
            ? Center(child: CircularProgressIndicator(color: Colors.green))
            : Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.topLeft,

                                    child: Text(
                                        'মোট বাকি  ' +
                                            '৳ ' +
                                            bakiController.totalBaki.toString(),
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18)
                                    ),

                                  ),
                                  Align(
                                    alignment: Alignment.topLeft,

                                    child: Text(
                                        'মোট জমা  ' +
                                            '৳ ' +
                                            bakiController.totalJoma.toString(),
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18)
                                    ),

                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                                flex: 2,
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    textStyle: TextStyle(
                                        color: Colors.black, fontSize: 17),
                                  ),
                                  onPressed: () {
                                    Get.to(Report());
                                  },
                                  child: Text('রিপোর্ট দেখুন'),
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Card(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Text(bakiController.bakiList.length
                                          .toString() +
                                      ' জন গ্রাহক',style: TextStyle(color: Colors.black),)
                              ),
                              SizedBox(width: 5.0),
                              Expanded(
                                  flex: 2,
                                  child: GestureDetector(
                                    onTap: () async {
                                      final pdfFile = await PdfApi.generateFile(
                                          bakiController.bakiList,
                                          bakiController.totalBaki.toString(),
                                          bakiController.totalJoma.toString());
                                      PdfApi.openFile(pdfFile);
                                    },
                                    child: Text('পিডিএফ',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold)),
                                  )),
                            ],
                          ),
                        ),
                        Divider(),
                        ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: bakiController.bakiList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  top: 10.0, bottom: 10.0),
                              child: ListTile(
                                onTap: () {
                                  Get.to(BakiDetails(
                                      baki: bakiController.bakiList[index]));
                                },
                                leading: (bakiController
                                            .bakiList[index].imageUrl ==
                                        'null')
                                    ? Container(
                                        height: 50,
                                        width: 50,
                                        decoration: new BoxDecoration(
                                          color: Colors.grey,
                                          shape: BoxShape.circle,
                                          image: new DecorationImage(
                                            image: new AssetImage(
                                                'images/contact.png'),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      )
                                    : Container(
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                          color: Colors.grey,
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: NetworkImage(bakiController
                                                  .bakiList[index].imageUrl),
                                              fit: BoxFit.fill),
                                        ),
                                      ),
                                title:
                                    Text(bakiController.bakiList[index].name),
                                subtitle: Text(
                                    bakiController.bakiList[index].account),
                                trailing: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [

                                    Text(
                                        '৳ ' +
                                            bakiController
                                                .bakiList[index].amount,
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18)
                                    ),

                                    Text('বাকি আছে',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold)
                                    ),

                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                        SizedBox(height: 80.0),
                      ],
                    ),
                  ),
                ],
              ),
      )),
    );
  }
}
