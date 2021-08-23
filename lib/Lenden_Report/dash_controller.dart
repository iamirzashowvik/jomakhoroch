import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class DashController extends GetxController {
  DateTime now = DateTime.now();
  var isLoad = true.obs;

  var dtotalSale = '0'.obs;
  var dtotalCollec = '0'.obs;
  var dtotalBaki = '0'.obs;
  var dtotalCash = '0'.obs;
  var dcntCollec = '0'.obs;
  var dcntBaki = '0'.obs;

  var wtotalSale = '0'.obs;
  var wtotalCollec = '0'.obs;
  var wtotalBaki = '0'.obs;
  var wtotalCash = '0'.obs;
  var wcntCollec = '0'.obs;
  var wcntBaki = '0'.obs;

  var mtotalSale = '0'.obs;
  var mtotalCollec = '0'.obs;
  var mtotalBaki = '0'.obs;
  var mtotalCash = '0'.obs;
  var mcntCollec = '0'.obs;
  var mcntBaki = '0'.obs;

  var ytotalSale = '0'.obs;
  var ytotalCollec = '0'.obs;
  var ytotalBaki = '0'.obs;
  var ytotalCash = '0'.obs;
  var ycntCollec = '0'.obs;
  var ycntBaki = '0'.obs;

  @override
  void onInit() {
    super.onInit();
    getData1();
  }

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

  void getData1() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String sellerPhone = sharedPreferences.getString('Phone').toString();

    FirebaseFirestore instance = FirebaseFirestore.instance;
    var qSnap = await instance
        .collection('Sales')
        .where('Seller', isEqualTo: sellerPhone)
        .get();

    for (int i = 0; i < qSnap.docs.length; i++) {
      Timestamp nowww = qSnap.docs[i]['Date'];
      DateTime dateNow = nowww.toDate();

      String day = dateNow.day.toString();
      String month = dateNow.month.toString();
      String year = dateNow.year.toString();

      print(day + ' - ' + month + ' - ' + year);
      print(now.day.toString() +
          ' - ' +
          now.month.toString() +
          ' - ' +
          now.year.toString());

      // year cal
      if (year == now.year.toString()) {
        ytotalSale.value =
            (int.parse(ytotalSale.value) + int.parse('1')).toString();
        ytotalCollec.value = (double.parse(ytotalCollec.value) +
                double.parse(qSnap.docs[i]['Amount']))
            .toString();
        if (qSnap.docs[i]['Type'] == 'Debt') {
          ycntBaki.value =
              (int.parse(ycntBaki.value) + int.parse('1')).toString();
          ytotalBaki.value = (double.parse(ytotalBaki.value) +
                  double.parse(qSnap.docs[i]['Amount']))
              .toString();
        } else {
          ycntCollec.value =
              (int.parse(ycntCollec.value) + int.parse('1')).toString();
          ytotalCash.value = (double.parse(ytotalCash.value) +
                  double.parse(qSnap.docs[i]['Amount']))
              .toString();
        }
      }

      // month cal
      if (year == now.year.toString() && month == now.month.toString()) {
        mtotalSale.value =
            (int.parse(mtotalSale.value) + int.parse('1')).toString();
        mtotalCollec.value = (double.parse(mtotalCollec.value) +
                double.parse(qSnap.docs[i]['Amount']))
            .toString();
        if (qSnap.docs[i]['Type'] == 'Debt') {
          mcntBaki.value =
              (int.parse(mcntBaki.value) + int.parse('1')).toString();
          mtotalBaki.value = (double.parse(mtotalBaki.value) +
                  double.parse(qSnap.docs[i]['Amount']))
              .toString();
        } else {
          mcntCollec.value =
              (int.parse(mcntCollec.value) + int.parse('1')).toString();
          mtotalCash.value = (double.parse(mtotalCash.value) +
                  double.parse(qSnap.docs[i]['Amount']))
              .toString();
        }
      }

      // day cal
      if (year == now.year.toString() &&
          month == now.month.toString() &&
          day == now.day.toString()) {
        dtotalSale.value =
            (int.parse(dtotalSale.value) + int.parse('1')).toString();
        dtotalCollec.value = (double.parse(dtotalCollec.value) +
                double.parse(qSnap.docs[i]['Amount']))
            .toString();
        if (qSnap.docs[i]['Type'] == 'Debt') {
          dcntBaki.value =
              (int.parse(dcntBaki.value) + int.parse('1')).toString();
          dtotalBaki.value = (double.parse(dtotalBaki.value) +
                  double.parse(qSnap.docs[i]['Amount']))
              .toString();
        } else {
          dcntCollec.value =
              (int.parse(dcntCollec.value) + int.parse('1')).toString();
          dtotalCash.value = (double.parse(dtotalCash.value) +
                  double.parse(qSnap.docs[i]['Amount']))
              .toString();
        }
      }

      // week cal
      if (year == now.year.toString() &&
          month == now.month.toString() &&
          day == now.day.toString()) {
        if ((int.parse(day) ~/ 7) == (int.parse(now.day.toString()) ~/ 7)) {
          wtotalSale.value =
              (int.parse(wtotalSale.value) + int.parse('1')).toString();
          wtotalCollec.value = (double.parse(wtotalCollec.value) +
                  double.parse(qSnap.docs[i]['Amount']))
              .toString();
          if (qSnap.docs[i]['Type'] == 'Debt') {
            wcntBaki.value =
                (int.parse(wcntBaki.value) + int.parse('1')).toString();
            wtotalBaki.value = (double.parse(wtotalBaki.value) +
                    double.parse(qSnap.docs[i]['Amount']))
                .toString();
          } else {
            wcntCollec.value =
                (int.parse(wcntCollec.value) + int.parse('1')).toString();
            wtotalCash.value = (double.parse(wtotalCash.value) +
                    double.parse(qSnap.docs[i]['Amount']))
                .toString();
          }
        }
      }
      isLoad.value = false;
    }
  }

  void getData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String sellerPhone = sharedPreferences.getString('Phone').toString();

    FirebaseFirestore instance = FirebaseFirestore.instance;
    var qSnap = await instance
        .collection('Sales')
        .where('Seller', isEqualTo: sellerPhone)
        .get();

    for (int i = 0; i < qSnap.docs.length; i++) {
      print(qSnap.docs[i]['Date'].toDate().toString() + ' xxxdate');
      int miliseconds = qSnap.docs[i]['Date'].seconds * 1000;
      var date = DateTime.fromMillisecondsSinceEpoch(miliseconds);
      var formattedDate = DateFormat.yMMMd().format(date).toString();

      String day = formattedDate[4];
      String month = formattedDate.substring(0, 3);
      String year = formattedDate.substring(7, 11);

      // week cal
      if (int.parse(day) ~/ 7 == int.parse(now.day.toString()) ~/ 7) {
        wtotalSale.value =
            (int.parse(wtotalSale.value) + int.parse('1')).toString();
        wtotalCollec.value = (double.parse(wtotalCollec.value) +
                double.parse(qSnap.docs[i]['Amount']))
            .toString();
        if (qSnap.docs[i]['Type'] == 'Debt') {
          wcntBaki.value =
              (int.parse(wcntBaki.value) + int.parse('1')).toString();
          wtotalBaki.value = (double.parse(wtotalBaki.value) +
                  double.parse(qSnap.docs[i]['Amount']))
              .toString();
        } else {
          wcntCollec.value =
              (int.parse(wcntCollec.value) + int.parse('1')).toString();
          wtotalCash.value = (double.parse(wtotalCash.value) +
                  double.parse(qSnap.docs[i]['Amount']))
              .toString();
        }
      }

      // day cal
      if (now.day.toString() == day) {
        dtotalSale.value =
            (int.parse(dtotalSale.value) + int.parse('1')).toString();
        dtotalCollec.value = (double.parse(dtotalCollec.value) +
                double.parse(qSnap.docs[i]['Amount']))
            .toString();
        if (qSnap.docs[i]['Type'] == 'Debt') {
          dcntBaki.value =
              (int.parse(dcntBaki.value) + int.parse('1')).toString();
          dtotalBaki.value = (double.parse(dtotalBaki.value) +
                  double.parse(qSnap.docs[i]['Amount']))
              .toString();
        } else {
          dcntCollec.value =
              (int.parse(dcntCollec.value) + int.parse('1')).toString();
          dtotalCash.value = (double.parse(dtotalCash.value) +
                  double.parse(qSnap.docs[i]['Amount']))
              .toString();
        }
      }

      // month cal
      if (getMno(month) == now.month.toString()) {
        mtotalSale.value =
            (int.parse(mtotalSale.value) + int.parse('1')).toString();
        mtotalCollec.value = (double.parse(mtotalCollec.value) +
                double.parse(qSnap.docs[i]['Amount']))
            .toString();
        if (qSnap.docs[i]['Type'] == 'Debt') {
          mcntBaki.value =
              (int.parse(mcntBaki.value) + int.parse('1')).toString();
          mtotalBaki.value = (double.parse(mtotalBaki.value) +
                  double.parse(qSnap.docs[i]['Amount']))
              .toString();
        } else {
          mcntCollec.value =
              (int.parse(mcntCollec.value) + int.parse('1')).toString();
          mtotalCash.value = (double.parse(mtotalCash.value) +
                  double.parse(qSnap.docs[i]['Amount']))
              .toString();
        }
      }
      //

      // year cal
      if (year == now.year.toString()) {
        ytotalSale.value =
            (int.parse(ytotalSale.value) + int.parse('1')).toString();
        ytotalCollec.value = (double.parse(ytotalCollec.value) +
                double.parse(qSnap.docs[i]['Amount']))
            .toString();
        if (qSnap.docs[i]['Type'] == 'Debt') {
          ycntBaki.value =
              (int.parse(ycntBaki.value) + int.parse('1')).toString();
          ytotalBaki.value = (double.parse(ytotalBaki.value) +
                  double.parse(qSnap.docs[i]['Amount']))
              .toString();
        } else {
          ycntCollec.value =
              (int.parse(ycntCollec.value) + int.parse('1')).toString();
          ytotalCash.value = (double.parse(ytotalCash.value) +
                  double.parse(qSnap.docs[i]['Amount']))
              .toString();
        }
      }
    }
    isLoad.value = false;
  }
}
