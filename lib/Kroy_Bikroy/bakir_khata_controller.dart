import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jomakhoroch/Model/sales.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BakirKhataController extends GetxController {
  var isLoad = true.obs;
  List<Saless> sList = List<Saless>.empty(growable: true).obs;

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  void getData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String sellerPhone = sharedPreferences.getString('Phone').toString();

    FirebaseFirestore instance = FirebaseFirestore.instance;
    var qSnap = await instance
        .collection('Sales')
        .where('Seller', isEqualTo: sellerPhone)
        .get();

    List<Saless> pList = List<Saless>.empty(growable: true);

    for (int i = 0; i < qSnap.docs.length; i++) {
      int miliseconds = qSnap.docs[i]['Date'].seconds * 1000;
      var date = DateTime.fromMillisecondsSinceEpoch(miliseconds);
      var formattedDate = DateFormat.yMMMd().format(date).toString();

      String day = formattedDate[4];
      String month = formattedDate.substring(0, 3);
      String year = formattedDate.substring(7, 11);

      pList.add
        (Saless
        (
          qSnap.docs[i]['Account'],
          qSnap.docs[i]['Amount'],
          day + '/' + month + '/' + year,
          qSnap.docs[i]['Product'],
          qSnap.docs[i]['Seller'],
          qSnap.docs[i]['Type']
      )
      );
    }

    sList = pList;
    isLoad.value = false;
  }
}
