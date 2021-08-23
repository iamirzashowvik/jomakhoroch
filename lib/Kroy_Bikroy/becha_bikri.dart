import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jomakhoroch/Kroy_Bikroy/calculator_controller.dart';
import 'package:jomakhoroch/Kroy_Bikroy/add_contact.dart';
import 'package:jomakhoroch/Kroy_Bikroy/add_products.dart';
import 'package:jomakhoroch/Kroy_Bikroy/bikrir_khata.dart';
import 'package:jomakhoroch/Kroy_Bikroy/calculator.dart';
import 'package:jomakhoroch/Kroy_Bikroy/contact_list.dart';
import 'package:jomakhoroch/Kroy_Bikroy/prod_list.dart';
import 'package:jomakhoroch/Kroy_Bikroy/stock.dart';
import 'package:jomakhoroch/View/tk_method.dart';

class BechaBikri extends StatefulWidget {
  const BechaBikri({Key? key}) : super(key: key);
  @override
  _BechaBikriState createState() => _BechaBikriState();
}

class _BechaBikriState extends State<BechaBikri> {
  final CalculatorController calculatorController =
      Get.put(CalculatorController());

  int _currentIndex = 0;
  final _pages = [Calculator(), ProdList()];
  final appbarTitle = ['ক্যালকুলেটর', 'লিস্ট'];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          title: Text(appbarTitle[_currentIndex],
              style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.white,
          actions: [
            IconButton(
                onPressed: () {
                  Get.to(ContactList(false, true));
                },
                icon: Icon(Icons.account_box)),
            PopupMenuButton(
                offset: Offset(0, 40),
                onSelected: (value) {
                  if (value.toString() == 'add-prod') {
                    Get.to(AddProducts('Becha-Bikri'));
                  } else if (value.toString() == 'stock') {
                    Get.to(Stock(true));
                  } else if (value.toString() == 'add-customer') {
                    Get.to(AddContact('none'));
                  } else if (value.toString() == 'customer') {
                    Get.to(ContactList(false, true));
                  } else if (value.toString() == 'bikri-khata') {
                    Get.to(BikrirKhata());
                  } else if (value.toString() == 'how') {
                    //Get.to(Subs());
                  } else {
                    //Get.to(Subs());
                  }
                },
                itemBuilder: (BuildContext context) {
                  return [
                    PopupMenuItem(
                      value: 'add-prod',
                      child: Row(
                        children: [
                          Icon(Icons.add_sharp, color: Colors.teal),
                          Text('নতুন পণ্য যোগ করুন'),
                        ],
                      ),
                    ),

                    PopupMenuItem(
                      value: 'customer',
                      child: Row(
                        children: [
                          Icon(Icons.account_circle, color: Colors.teal),
                          Text('কাস্টমার'),
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      value: 'bikri-khata',
                      child: Row(
                        children: [
                          Icon(Icons.pages, color: Colors.teal),
                          Text('বিক্রির খাতা'),
                        ],
                      ),
                    ),

                    PopupMenuItem(
                      value: 'stock',
                      child: Row(
                        children: [
                          Icon(Icons.backpack, color: Colors.teal),
                          Text('স্টক তালিকা'),
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      value: 'add-customer',
                      child: Row(
                        children: [
                          Icon(Icons.account_box, color: Colors.teal),
                          Text('নতুন কাস্টমার'),
                        ],
                      ),
                    ),

                  ];
                }),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          selectedItemColor: Colors.teal[700],
          //unselectedItemColor: Colors.black,
          iconSize: 30,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.calculate,
              ),
              label: 'শর্টকাট',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.list, color: Colors.teal[700]),
                label: 'লিস্ট'),
          ],
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Obx(
                  () => ElevatedButton(
                    onPressed: (calculatorController.totalSum.value
                                    .toString() ==
                                '0' ||
                            calculatorController.totalSum.value.toString() ==
                                '0.00')
                        ? null
                        : () {
                            Get.to(TkMethod());
                          },
                    child: Text(
                      'মোট ৳' + calculatorController.totalSum.value.toString(),
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    style: ElevatedButton.styleFrom(
                      onPrimary: Colors.white,
                      primary: Colors.teal[600],
                      textStyle: TextStyle(fontSize: 20.0),
                      minimumSize:
                          Size(MediaQuery.of(context).size.width * 0.9, 60),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
              ),
              _pages[_currentIndex],
            ],
          ),
        ),
      ),
    );
  }
}
