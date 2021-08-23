import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:jomakhoroch/Tally_Khata/product.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductListController extends GetxController {
  List<Product> productList = List<Product>.empty(growable: true).obs;
  var isLoad = true.obs;

  @override
  void onInit() {
    super.onInit();
    getProduct();
  }

  void getProduct() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String sellerPhone = sharedPreferences.getString('Phone').toString();

    //fireBase
    FirebaseFirestore instance = FirebaseFirestore.instance;

    var qSnap = await instance
        .collection('Products')
        .where('Seller', isEqualTo: sellerPhone)
        .get();

    List<Product> pList = List<Product>.empty(growable: true);
    for (int i = 0; i < qSnap.docs.length; i++) {
      pList.add(Product(
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
          qSnap.docs[i].id)
      );
    }
    productList = pList;
    isLoad.value = false;
  }
}
