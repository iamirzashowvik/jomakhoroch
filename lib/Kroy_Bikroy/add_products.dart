import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jomakhoroch/Kroy_Bikroy/product_list_controller.dart';
import 'package:jomakhoroch/Kroy_Bikroy/stock_controller.dart';
import 'package:jomakhoroch/Kroy_Bikroy/stock.dart';
import 'package:jomakhoroch/View/online_store.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddProducts extends StatefulWidget {
  final String type;
  const AddProducts(this.type);

  @override
  _AddProductsState createState() => _AddProductsState();
}

class _AddProductsState extends State<AddProducts> {
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
  String catagoryChoose = 'None';
  String hintText = 'ক্যাটাগরি সিলেক্ট করুন';

  bool isTap = false;

  var image;

  void switchTap(bool value) {
    setState(() {
      if (isTap) {
        isTap = false;
      } else {
        isTap = true;
      }
    });
  }

  void btnTap() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String sellerPhone = sharedPreferences.getString('Phone').toString();

    //image == null ||
    if (productController.text.trim() == '') {
      Get.snackbar('Error', 'Please fill product name');
    } else {
      if (image == null) {
        await FirebaseFirestore.instance.collection('Products').doc().set({
          'Product': productController.text.trim(),
          'imageUrl': 'null',
          'Catagory': catagoryChoose,
          'BuyPrice': buyController.text.trim(),
          'SellPrice':
              (sellController.text.isEmpty) ? '0' : sellController.text.trim(),
          'Discount': discountController.text.trim(),
          'Stock': stockController.text.trim(),
          'Online-Store': isTap.toString(),
          'Description': discountController.text.trim(),
          'Seller': sellerPhone,
        }).then((value) {
          Get.delete<ProductListController>();
          Get.delete<StockController>();
          Get.delete<OnlineStore>();
          Get.off(Stock(true));
        });
      } else {
        var snapshot = await FirebaseStorage.instance
            .ref()
            .child('Products/${productController.text.trim()}${DateTime.now()}')
            .putFile(image);
        snapshot.ref.getDownloadURL().then((value) async {
          await FirebaseFirestore.instance.collection('Products').doc().set({
            'Product': productController.text.trim(),
            'imageUrl': value,
            'Catagory': catagoryChoose,
            'BuyPrice': buyController.text.trim(),
            'SellPrice': (sellController.text.isEmpty)
                ? '0'
                : sellController.text.trim(),
            'Discount': discountController.text.trim(),
            'Stock': stockController.text.trim(),
            'Online-Store': isTap.toString(),
            'Description': discountController.text.trim(),
            'Seller': sellerPhone,
          }).then((value) {
            Get.delete<ProductListController>();
            Get.delete<StockController>();
            Get.delete<OnlineStore>();
            Get.off(Stock(true));
            // if (widget.type == 'Stock') {
            //   Get.off(Stock(true));
            // } else {
            //   Get.off(BechaBikri());
            // }
          });
        }).onError((error, stackTrace) {
          Get.snackbar('Error', error.toString());
        });
      }
    }
  }

  void cameraTap() async {
    final pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
      } else {
        print('No image selected');
      }
    });
  }

  Widget buildTextFeild(controller, String label) {
    return TextField(
      controller: controller,
      keyboardType: (label == 'পণ্যের নাম *' || label == 'পণ্যের বর্ণনা')
          ? TextInputType.name
          : TextInputType.number,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(fontSize: 16.0),
        focusedBorder:

        UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.teal, width: 2.0)
        ),

      ),
    );
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
        title: Text('পণ্য যোগ করুন', style: TextStyle(color: Colors.black)),
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
              Align(
                  alignment: Alignment.topLeft,
                  child: Text('পণ্যের ছবি যোগ করুন')),
              Align(
                alignment: Alignment.topLeft,
                child: Row(
                  children: [
                    IconButton(
                        onPressed: cameraTap,
                        icon: Icon(Icons.camera_alt_rounded,
                            color: Colors.teal, size: 45.0)),
                    (image == null)
                        ? Text('')
                        : Image.file(image, height: 100, width: 100),
                  ],
                ),
              ),
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
                          buildTextFeild(discountController, 'ছাড়ের পরিমান')),
                ],
              ),
              buildTextFeild(stockController, 'স্টকের সংখ্যা'),
              SizedBox(height: 40.0),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Expanded(child: Text('অনলাইন স্টোরে ছাড়ুন')),
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

              SizedBox(
                height: 10.0,
              ),

              Card(
                child: Container(
                  color: Colors.teal,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        Icon(Icons.query_stats),
                        SizedBox(width: 10.0),
                        Expanded(
                          child: Text(
                              'অনলাইন স্টোরে পণ্য পাবলিশ করে আপনার ব্যবসার পরিধি বৃদ্ধি করুন ',
                              style: TextStyle(color: Colors.white,fontSize: 16.0)),
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
