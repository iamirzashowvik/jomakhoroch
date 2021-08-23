import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:jomakhoroch/Tally_Khata/Baki.dart';
import 'package:jomakhoroch/Tally_Khata/baki_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BakiController extends GetxController {
  List<BakiInfo> bakiDetailsList = List<BakiInfo>.empty(growable: true).obs;
  List<Baki> bakiList = List<Baki>.empty(growable: true).obs;
  var isLoad = true.obs;
  var isLoad1 = true.obs;
  var totalBaki = '0'.obs;
  var totalJoma = '0'.obs;
  var bakiCash = '0'.obs;

  @override
  void onInit() {
    super.onInit();
    getProduct();
  }

  void getProduct() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String sellerPhone = sharedPreferences.getString('Phone').toString();

    FirebaseFirestore instance = FirebaseFirestore.instance;
    var qSnap = await instance
        .collection('Sales')
        .where('Seller', isEqualTo: sellerPhone)
        .get();
    var cSnap = await instance
        .collection('Contacts')
        .where('Seller', isEqualTo: sellerPhone)
        .get();

    List<Baki> pList = List<Baki>.empty(growable: true);
    Set<String> phonenoList = {};

    for (int i = 0; i < qSnap.docs.length; i++) {
      phonenoList.add(qSnap.docs[i]['Account'].toString());
      if (qSnap.docs[i]['Type'].toString() == 'Debt') {
        //print(qSnap.docs[i]['Amount'].toString() + ' object');
        // totalBaki.value = (double.parse(totalBaki.value) +
        //         double.parse(qSnap.docs[i]['Amount'].toString()))
        //     .toString();
      } else {
        totalJoma.value = (double.parse(totalJoma.value) +
                double.parse(qSnap.docs[i]['Amount'].toString()))
            .toString();
        print('sesh ------------------------');
      }
    }

    phonenoList.forEach((element) {
      double total = 0.0;
      double deposit = 0.0;
      for (int i = 0; i < qSnap.docs.length; i++) {
        if (qSnap.docs[i]['Account'] == element) {
          if (qSnap.docs[i]['Type'].toString() == 'Debt') {
            total = total + double.parse(qSnap.docs[i]['Amount']);
          }
          if (qSnap.docs[i]['Type'].toString() == 'DebtWithCash') {
            deposit = deposit + double.parse(qSnap.docs[i]['Amount']);
            total = total - double.parse(qSnap.docs[i]['Amount']);
          }
        }
      }
      if (total > 0.0) {
        String contactName = 'Undefined';
        String imageUrl = 'null';
        for (int i = 0; i < cSnap.docs.length; i++) {
          if (element == cSnap.docs[i]['Phone']) {
            contactName = cSnap.docs[i]['Name'];
            imageUrl = cSnap.docs[i]['imageUrl'];
            break;
          }
        }
        totalBaki.value = (double.parse(totalBaki.value) + total).toString();
        pList.add(Baki(contactName, element, total.toString(),
            deposit.toString(), imageUrl));
      }
    });

    bakiList = pList;
    isLoad.value = false;
  }

  void getDetails(String custPhone) async {
    List<BakiInfo> pDetailsList = List<BakiInfo>.empty(growable: true);
    bakiCash.value = '0';

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String sellerPhone = sharedPreferences.getString('Phone').toString();

    FirebaseFirestore instance = FirebaseFirestore.instance;
    var qSnap = await instance
        .collection('Sales')
        .where('Seller', isEqualTo: sellerPhone)
        .orderBy('Date', descending: true)
        .get();

    for (int i = 0; i < qSnap.docs.length; i++) {
      Timestamp timeStamp = qSnap.docs[i]['Date'];
      DateTime toDate = timeStamp.toDate();
      String realDate = toDate.day.toString() +
          '-' +
          toDate.month.toString() +
          '-' +
          toDate.year.toString();
      if (qSnap.docs[i]['Account'] == custPhone) {
        if (qSnap.docs[i]['Type'] == 'Debt' ||
            qSnap.docs[i]['Type'] == 'DebtWithCash') {
          if (qSnap.docs[i]['Type'] == 'DebtWithCash') {
            bakiCash.value = (double.parse(bakiCash.value) +
                    double.parse(qSnap.docs[i]['Amount']))
                .toString();
          }
          pDetailsList.add(BakiInfo(
            account: qSnap.docs[i]['Account'],
            amount: qSnap.docs[i]['Amount'],
            product: qSnap.docs[i]['Product'],
            date: realDate,
            type: qSnap.docs[i]['Type'],
            seller: qSnap.docs[i]['Seller'],
          ));
        }
      }
    }

    bakiDetailsList = pDetailsList;
    isLoad1.value = false;
  }
}
