import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnlineStoreController extends GetxController {
  var isLoad = true.obs;
  var totalProd = 0.obs;
  var onlineProd = 0.obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String sellerPhone = sharedPreferences.getString('Phone').toString();

    FirebaseFirestore instance = FirebaseFirestore.instance;
    var qSnap = await instance
        .collection('Products')
        .where('Seller', isEqualTo: sellerPhone)
        .get();

    totalProd.value = qSnap.docs.length;

    for (int i = 0; i < qSnap.docs.length; i++) {
      if (qSnap.docs[i]['Online-Store'] == 'true') {
        onlineProd.value = onlineProd.value + 1;
      }
    }

    isLoad.value = false;
  }
}
