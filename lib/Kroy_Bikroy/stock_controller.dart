import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:jomakhoroch/Tally_Khata/catagory.dart';
import 'package:jomakhoroch/Tally_Khata/product.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StockController extends GetxController {
  List<Product> productList = List<Product>.empty(growable: true).obs;
  List<Catagory> catList = List<Catagory>.empty(growable: true).obs;
  var isLoad = true.obs;
  var totalP = 0.obs;
  var totalC = 0.obs;
  var totalB = '0'.obs;
  var cntB = 0.obs;

  @override
  void onInit() {
    getProduct();
    super.onInit();
  }

  void getProduct() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String sellerPhone = sharedPreferences.getString('Phone').toString();

    FirebaseFirestore instance = FirebaseFirestore.instance;
    var qSnap = await instance
        .collection('Products')
        .where('Seller', isEqualTo: sellerPhone)
        .get();

    totalP.value = qSnap.docs.length;
    Set<String> cat = {};
    List<Product> pList = List<Product>.empty(growable: true);

    for (int i = 0; i < qSnap.docs.length; i++) {
      cat.add(qSnap.docs[i]['Catagory']);
      if (qSnap.docs[i]['BuyPrice'] != "" &&
          qSnap.docs[i]['BuyPrice'] != "null") {
        cntB.value = int.parse(cntB.value.toString()) + int.parse('1');
        totalB.value = (double.parse(totalB.value) +
                double.parse(qSnap.docs[i]['BuyPrice']))
            .toString();
      }

      pList.add(
          Product
            (
          qSnap.docs[i]['Product'],
          qSnap.docs[i]['imageUrl'],
          qSnap.docs[i]['BuyPrice'],
          qSnap.docs[i]['SellPrice'],
          qSnap.docs[i]['Discount'],
          qSnap.docs[i]['Description'],
          qSnap.docs[i]['Catagory'],
          qSnap.docs[i]['Online-Store'],
          qSnap.docs[i]['Stock'],
          qSnap.docs[i]['Seller'],
          qSnap.docs[i].id
          )
      );

    }

    for (var elem in cat) {
      int count = 0;
      for (int i = 0; i < qSnap.docs.length; i++) {
        if (elem.toString() == qSnap.docs[i]['Catagory']) {
          count = count + 1;
        }
      }
      catList.add(Catagory(elem, count));
    }

    totalC.value = cat.length;
    productList = pList;
    isLoad.value = false;
  }
}
