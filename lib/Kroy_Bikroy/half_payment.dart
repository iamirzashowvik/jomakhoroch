import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jomakhoroch/View/home_page.dart';

class HalfPayment extends StatefulWidget {
  final String phone, seller, totalAmount, product;
  const HalfPayment(
      {required this.phone,
        required this.seller,
        required this.totalAmount,
        required this.product});

  @override
  _HalfPaymentState createState() => _HalfPaymentState();
}

class _HalfPaymentState extends State<HalfPayment> {
  final TextEditingController amount = TextEditingController();

  void btnTap() async {
    double netAmount =
        double.parse(widget.totalAmount) - double.parse(amount.text);
    if (netAmount > 0) {
      await FirebaseFirestore.instance.collection('Sales').doc().set({
        'Seller': widget.seller,
        'Amount': netAmount.toString(),
        'Date': DateTime.now(),
        'Type': 'Debt',
        'Account': widget.phone,
        'Product': widget.product,
      }).then((value) async {
        Get.offAll(HomePage());

      }).onError((error, stackTrace) {
        Get.snackbar('Error', error.toString());
      });
    }

    else {
      Get.snackbar('Error', 'আপনি ক্রেতার থেকে বেশি টাকা নিচ্ছেন ।');
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Text('আংশিক পরিশোধ', style: TextStyle(color: Colors.black)),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Padding(
                padding: const EdgeInsets.all(20),
                child: TextField(
                  controller: amount,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'টাকার পরিমান'
                  ),
                ),
              ),

              SizedBox(
                height: 20.0,
              ),

              Container(
                width: 120,
                height: 40,
                color: Colors.teal[600],
                child: ElevatedButton(
                  onPressed: btnTap,
                  child: Center(child: Text('সাবমিট',style: TextStyle(fontSize: 24),)),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}


//'টাকার পরিমান',