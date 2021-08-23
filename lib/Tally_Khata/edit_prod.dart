import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jomakhoroch/Kroy_Bikroy/product_list_controller.dart';
import 'package:jomakhoroch/Kroy_Bikroy/stock_controller.dart';
import 'package:jomakhoroch/Tally_Khata/product.dart';
import 'package:jomakhoroch/Kroy_Bikroy/stock.dart';

class EditProd extends StatefulWidget {
  final Product prod;
  const EditProd(this.prod);

  @override
  _EditProdState createState() => _EditProdState();
}

class _EditProdState extends State<EditProd> {
  TextEditingController productController = TextEditingController();
  TextEditingController buyController = TextEditingController();
  TextEditingController sellController = TextEditingController();
  TextEditingController discountController = TextEditingController();
  TextEditingController stockController = TextEditingController();
  TextEditingController desController = TextEditingController();

  List catagory = [
    'None',
    'Home Applicance',
    'Automobile/car',
    'Laundry',
    'IT Gadget',
    'Grocery',
    'Food',
    'Beauty',
    'Fashion',
    'Agro'
  ];
  String catagoryChoose = '';
  String hintText = 'ক্যাটাগরি সিলেক্ট করুন';
  bool isTap = false;

  void switchTap(bool value) {
    setState(() {
      if (isTap) {
        isTap = false;
      } else {
        isTap = true;
      }
    });
  }

  Widget buildTextFeild(controller, String label) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(fontSize: 16.0),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.teal, width: 2.0)),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    String p = widget.prod.product;
    String b = widget.prod.buy;
    String s = widget.prod.sell;
    String di = widget.prod.discount;
    String de = widget.prod.description;
    String st = widget.prod.stock;

    productController = TextEditingController(text: p);
    buyController = TextEditingController(text: b);
    sellController = TextEditingController(text: s);
    discountController = TextEditingController(text: di);
    desController = TextEditingController(text: de);
    stockController = TextEditingController(text: st);

    catagoryChoose = widget.prod.catagory;
    hintText = widget.prod.catagory;
    if (widget.prod.online == 'true')
      isTap = true;
    else
      isTap = false;
  }

  void btnTap() async {
    await FirebaseFirestore.instance
        .collection('Products')
        .doc(widget.prod.id)
        .update({
      'Product': productController.text.trim(),
      'Catagory': catagoryChoose,
      'BuyPrice': buyController.text.trim(),
      'SellPrice': sellController.text.trim(),
      'Discount': discountController.text.trim(),
      'Stock': stockController.text.trim(),
      'Online-Store': isTap.toString(),
      'Description': discountController.text.trim(),
    }).then((value) {
      Get.delete<ProductListController>();
      Get.delete<StockController>();
      Get.off((Stock(true)));
    }).onError((error, stackTrace) {
      Get.snackbar('Error', error.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 60.0,
        child: Padding(
          padding: const EdgeInsets.only(
              top: 8.0, bottom: 8.0, left: 20.0, right: 20.0),
          child: ElevatedButton(
            onPressed: btnTap,
            child: Text('এগিয়ে যান'),
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
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Text('এডিট করুন', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: btnTap,
              child: Text('সেভ করুন'),
              style: ElevatedButton.styleFrom(
                  primary: Colors.teal,
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  )),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(height: 40.0),
              Card(
                child: DropdownButton(
                  hint: Text(hintText),
                  icon: Icon(Icons.arrow_forward, color: Colors.teal),
                  iconSize: 25.0,
                  isExpanded: true,
                  onChanged: (value) {
                    setState(() {
                      catagoryChoose = value.toString();
                      hintText = value.toString();
                    });
                  },
                  items: catagory.map<DropdownMenuItem<String>>((value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 40.0),
              buildTextFeild(productController, 'পণ্যের নাম *'),
              Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: buildTextFeild(buyController, 'ক্রয় মূল্য')),
                  SizedBox(width: 15.0),
                ],
              ),
              Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: buildTextFeild(sellController, 'বিক্রয় মূল্য')),
                  SizedBox(width: 15.0),
                  Expanded(
                      flex: 1,
                      child:
                          buildTextFeild(discountController, 'চারের পরিমান')),
                ],
              ),
              buildTextFeild(stockController, 'স্টকের সংখ্যা'),
              SizedBox(height: 40.0),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Expanded(child: Text('অনলাইন স্টোরে পাবলিশ')),
                      Switch(
                        onChanged: switchTap,
                        value: isTap,
                        activeColor: Colors.teal,
                        activeTrackColor: Colors.grey[350],
                        inactiveThumbColor: Colors.grey[200],
                        inactiveTrackColor: Colors.grey[350],
                      )
                    ],
                  ),
                ),
              ),
              Card(
                child: Container(
                  color: Colors.yellow,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        Icon(Icons.query_stats),
                        SizedBox(width: 5.0),
                        Expanded(
                          child: Text(
                              'অনলাইন স্টোরে পাবলিশ করে আপনার ব্যবসা বৃদ্ধি করুন',
                              style: TextStyle(color: Colors.brown)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40.0),
              buildTextFeild(desController, 'পণ্যের বর্ণনা'),
            ],
          ),
        ),
      ),
    );
  }
}
