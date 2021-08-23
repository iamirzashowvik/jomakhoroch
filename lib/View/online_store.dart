import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jomakhoroch/Online_Store/online_store_controller.dart';
import 'package:jomakhoroch/Kroy_Bikroy/add_products.dart';
import 'package:jomakhoroch/Kroy_Bikroy/stock.dart';

class OnlineStore extends StatefulWidget {
  const OnlineStore({Key? key}) : super(key: key);
  @override
  _OnlineStoreState createState() => _OnlineStoreState();
}

class _OnlineStoreState extends State<OnlineStore> {
  final OnlineStoreController onlineStoreController =
      Get.put(OnlineStoreController());

  Widget buildButton(Function, String text, IconData icon1, IconData icon2) {
    return ElevatedButton.icon(
      onPressed: Function,
      icon: Icon(icon1),
      label: Text(text),
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        onPrimary: Colors.black,
        minimumSize: Size(MediaQuery.of(context).size.width * 0.925, 50),
        alignment: Alignment(-1, 0),
      ),
    );
  }

  Widget buildCard(String text1, String text2) {
    return Card(
      shape: RoundedRectangleBorder(
        side: (text1 == 'মোট অর্ডার' || text1 == 'মোট বিক্রি')
            ? BorderSide.none
            : BorderSide(color: Colors.green),
        borderRadius: BorderRadius.circular(5.0),
      ),
      color: (text1 == 'মোট অর্ডার')
          ? Colors.blue[100]
          : ((text1 == 'মোট বিক্রি') ? Colors.brown[100] : Colors.green[100]),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Align(
                alignment: Alignment.topLeft,
                child: Text(text1, style: TextStyle(fontSize: 14.0))),
            SizedBox(height: 5.0),
            Align(
                alignment: Alignment.topLeft,
                child: Text(text2, style: TextStyle(fontSize: 22.0))),
          ],
        ),
      ),
    );
  }



  void addBtn() {
    Get.to(AddProducts('none'));
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Text('অনলাইন স্টোর', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,


      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Obx(
            () => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // buildButton(settingBtn, 'অনলাইন স্টোরে সেটিং', Icons.settings,
                //     Icons.arrow_forward_ios_outlined),
                SizedBox(height: 15.0),
                Container(
                  color: Colors.teal,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Align(
                              alignment: Alignment.topLeft,
                              child: Text('অনলাইন স্টোরের হিসাব',style: TextStyle(fontSize: 17.0,color:Colors.black,fontWeight: FontWeight.bold))
                          ),
                          Row(
                            children: [

                              Expanded(
                                child: buildCard('মোট অর্ডার', '0'),
                              ),

                              Expanded(
                                child: buildCard('মোট বিক্রি', '0'),
                              ),

                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15.0),
                Container(
                  color: Colors.teal,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Align(
                              alignment: Alignment.topLeft,
                              child: Text('বর্তমান অর্ডার',
                                  style: TextStyle(fontSize: 17.0,color:Colors.black,fontWeight: FontWeight.bold))
                          ),

                          Row(
                            children: [
                              Expanded(
                                child: buildCard('নতুন', '0'),
                              ),
                              Expanded(
                                child: buildCard('চলতি কমপ্লিট', '0'),
                              ),
                              Expanded(
                                child: buildCard('কমপ্লিট', '0'),
                              )
                            ],
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15.0),
                Container(
                  color: Colors.teal,
                  child: GestureDetector(
                    onTap: () {
                      Get.to(Stock(true));
                    },
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [

                            Align(
                                alignment: Alignment.topLeft,
                                child: Text('পণ্যের হিসাব',
                                    style: TextStyle(fontSize: 17.0,color:Colors.black,fontWeight: FontWeight.bold))
                            ),

                            Row(
                              children: [
                                Expanded(
                                  child: buildCard('মোট পণ্য',
                                      onlineStoreController.totalProd.toString()),
                                ),
                                Expanded(
                                  child: buildCard(
                                      'পাবলিশড পণ্য',
                                      onlineStoreController.onlineProd
                                          .toString()),
                                ),
                              ],
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 20.0),

                Container(
                  color: Colors.teal,
                  child: buildButton(
                      addBtn, 'পণ্য এন্ট্রি করুন', Icons.add_box,
                      Icons.add_circle_outline
                  ),
                ),

                SizedBox(height: 10.0),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
/*
*/