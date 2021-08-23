import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jomakhoroch/Kroy_Bikroy/baki_controller.dart';
import 'package:jomakhoroch/Tally_Khata/Baki.dart';
import 'package:jomakhoroch/Tally_Khata/customer_pdf.dart';
import 'package:jomakhoroch/View/bakir_khata.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BakiDetails extends StatefulWidget {
  final Baki baki;
  const BakiDetails({required this.baki});

  @override
  _BakiDetailsState createState() => _BakiDetailsState();
}

class _BakiDetailsState extends State<BakiDetails> {
  TextEditingController jomaController = TextEditingController();
  final BakiController bakiController = BakiController();

  @override
  void initState() {
    super.initState();
    bakiController.getDetails(widget.baki.account);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 60,
        child: Padding(
          padding: const EdgeInsets.only(
              top: 8.0, bottom: 8.0, left: 20.0, right: 20.0),
          child: ElevatedButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: 'এমাউন্ট লিখুন',
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.teal, width: 1.0)),
                                ),
                                controller: jomaController),
                            ElevatedButton(
                              onPressed: () async {
                                SharedPreferences sharedPreferences =
                                    await SharedPreferences.getInstance();
                                String sellerPhone = sharedPreferences
                                    .getString('Phone')
                                    .toString();
                                await FirebaseFirestore.instance
                                    .collection('Sales')
                                    .doc()
                                    .set({
                                  'Account': widget.baki.account,
                                  'Amount': jomaController.text.trim(),
                                  'Date': DateTime.now(),
                                  'Product': '',
                                  'Seller': sellerPhone,
                                  'Type': 'DebtWithCash',
                                }).then((value) {
                                  Get.delete<BakiController>();
                                  Navigator.pop(context);
                                  Get.off(BakirKhata(true));
                                });
                              },
                              child: Text('জমা রাখুন'),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.teal[600],
                                onPrimary: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ));
            },
            child: Text('জমা'),
            style: ElevatedButton.styleFrom(
              primary: Colors.teal,
              onPrimary: Colors.white,
              textStyle: TextStyle(fontSize: 22.0),
            ),
          ),
        ),
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: ListTile(
          title: Text(widget.baki.name, style: TextStyle(color: Colors.black)),
          subtitle:
              Text(widget.baki.account, style: TextStyle(color: Colors.black)),
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () async {
                final pdfFile = await CustomerPdf.generateFile(
                    widget.baki.account,
                    widget.baki.amount,
                    bakiController.bakiDetailsList,
                    (double.parse(widget.baki.amount) -
                            double.parse(bakiController.bakiCash.value))
                        .toString());
                CustomerPdf.openFile(pdfFile);
              },
              icon: Icon(Icons.picture_as_pdf)),
        ],
      ),
      body: Obx(
        () => (bakiController.isLoad1.value)
            ? Center(child: CircularProgressIndicator(color: Colors.teal))
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text.rich(
                                  TextSpan(
                                    text: 'ব্যালান্স: ',
                                    children: <InlineSpan>[
                                      TextSpan(
                                          text: '৳' +
                                              (double.parse(
                                                          widget.baki.amount) +
                                                      double.parse(
                                                          bakiController
                                                              .bakiCash.value))
                                                  .toString(),
                                          style: TextStyle(
                                              color: Colors.red[800])),

                                      TextSpan(
                                          text: ' (আপনি বাকি দিয়েছেন)',
                                          style: TextStyle(
                                              color: Colors.grey[400])
                                      ),

                                    ],
                                  ),
                                ),
                                Text.rich(
                                  TextSpan(
                                    text: 'মোট বাকি পাবেন: ',
                                    children: <InlineSpan>[
                                      TextSpan(
                                          text: '৳' + widget.baki.amount,
                                          style: TextStyle(
                                              color: Colors.red[800])),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Row(
                        children: [
                          Expanded(flex: 3, child: Text('  এন্ট্রি গুলো')),
                          Expanded(flex: 1, child: Text('বাকি')),
                          Expanded(flex: 1, child: Text('জমা')),
                        ],
                      ),
                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: bakiController.bakiDetailsList.length,
                        itemBuilder: (BuildContext context, int index) => Card(
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              children: [
                                Expanded(
                                    flex: 3,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(bakiController
                                            .bakiDetailsList[index].date),
                                        Text(bakiController
                                            .bakiDetailsList[index].product),
                                      ],
                                    )),
                                Expanded(
                                    flex: 1,
                                    child: (bakiController
                                                .bakiDetailsList[index].type ==
                                            'Debt')
                                        ? Text(
                                            '৳' +
                                                bakiController
                                                    .bakiDetailsList[index]
                                                    .amount,
                                            style: TextStyle(
                                                color: Colors.red[800]))
                                        : Text('')),
                                Expanded(
                                    flex: 1,
                                    child: (bakiController
                                                .bakiDetailsList[index].type ==
                                            'DebtWithCash')
                                        ? Text(
                                            '৳' +
                                                bakiController
                                                    .bakiDetailsList[index]
                                                    .amount,
                                            style:
                                                TextStyle(color: Colors.teal))
                                        : Text('')),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
