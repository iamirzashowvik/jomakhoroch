import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:jomakhoroch/Lenden_Report/customer_model.dart';
import 'package:jomakhoroch/Model/product_report.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReportController extends GetxController {
  var isLoad1 = false.obs;
  var isLoad2 = false.obs;
  List<ProductReport> prodList = List<ProductReport>.empty(growable: true).obs;
  List<CustomerModel> cusList = List<CustomerModel>.empty(growable: true).obs;

  String getMno(String month) {
    String num = '';
    if (month == 'Jan')
      num = '1';
    else if (month == 'Feb')
      num = '2';
    else if (month == 'Mar')
      num = '3';
    else if (month == 'Apr')
      num = '4';
    else if (month == 'May')
      num = '5';
    else if (month == 'Jun')
      num = '6';
    else if (month == 'Jul')
      num = '7';
    else if (month == 'Aug')
      num = '8';
    else if (month == 'Sep')
      num = '9';
    else if (month == 'Oct')
      num = '10';
    else if (month == 'Nov')
      num = '11';
    else
      num = '12';
    return num;
  }

  void prodData(DateTime date1, DateTime date2) async {

    isLoad1.value = true;

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String sellerPhone = sharedPreferences.getString('Phone').toString();

    //fireBase
    FirebaseFirestore instance = FirebaseFirestore.instance;
    var qSnap = await instance
        .collection('Sales')
        .where('Seller', isEqualTo: sellerPhone)
        .get();

    Set<String> prod = {};

    String day1 = date1.day.toString();
    String month1 = date1.month.toString();
    String year1 = date1.year.toString();
    String day2 = date2.day.toString();
    String month2 = date2.month.toString();
    String year2 = date2.year.toString();

    for (int i = 0; i < qSnap.docs.length; i++) {
      Timestamp nowww = qSnap.docs[i]['Date'];
      DateTime dateNow = nowww.toDate();

      String day = dateNow.day.toString();
      String month = dateNow.month.toString();
      String year = dateNow.year.toString();

      if (int.parse(year) >= int.parse(year1) &&
          int.parse(year) <= int.parse(year2)) {
        if (int.parse(month) >= int.parse(month1) &&
            int.parse(month) <= int.parse(month2)) {
          if (int.parse(day) >= int.parse(day1) &&
              int.parse(day) <= int.parse(day2)) {
            prod.add(qSnap.docs[i]['Product']);
          }
        }
      }

      List<ProductReport> tList = List<ProductReport>.empty(growable: true);
      for (var elem in prod) {
        double price = 0.0;
        int qnty = 0;
        for (int i = 0; i < qSnap.docs.length; i++) {
          if (qSnap.docs[i]['Product'] == elem) {
            price = price + double.parse(qSnap.docs[i]['Amount']);
            qnty = qnty + 1;
          }
        }
        tList.add(ProductReport(elem, qnty.toString(), price.toString()));
      }

      prodList = tList;
      isLoad1.value = false;
    }
  }

  void custData(DateTime date1, DateTime date2) async {
    isLoad2.value = true;

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String sellerPhone = sharedPreferences.getString('Phone').toString();

    FirebaseFirestore instance = FirebaseFirestore.instance;
    var qSnap = await instance
        .collection('Sales')
        .where('Seller', isEqualTo: sellerPhone)
        .get();

    Set<String> cust = {};

    String day1 = date1.day.toString();
    String month1 = date1.month.toString();
    String year1 = date1.year.toString();
    String day2 = date2.day.toString();
    String month2 = date2.month.toString();
    String year2 = date2.year.toString();

    for (int i = 0; i < qSnap.docs.length; i++) {
      Timestamp nowww = qSnap.docs[i]['Date'];
      DateTime dateNow = nowww.toDate();

      String day = dateNow.day.toString();
      String month = dateNow.month.toString();
      String year = dateNow.year.toString();

      if (int.parse(year) >= int.parse(year1) &&
          int.parse(year) <= int.parse(year2)) {
        if (int.parse(month) >= int.parse(month1) &&
            int.parse(month) <= int.parse(month2)) {
          if (int.parse(day) >= int.parse(day1) &&
              int.parse(day) <= int.parse(day2)) {
            cust.add(qSnap.docs[i]['Account']);
          }
        }
      }

      List<CustomerModel> tList = List<CustomerModel>.empty(growable: true);
      for (var elem in cust) {
        double price = 0.0;
        int qnty = 0;
        for (int i = 0; i < qSnap.docs.length; i++) {
          if (qSnap.docs[i]['Account'] == elem) {
            price = price + double.parse(qSnap.docs[i]['Amount']);
            qnty = qnty + 1;
          }
        }
        tList.add(CustomerModel(elem, qnty.toString(), price.toString()));
      }

      cusList = tList;
      isLoad2.value = false;
    }
  }
}
