import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:jomakhoroch/Contact_List/contact.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ContactListController extends GetxController {
  List<Contact> contactList = List<Contact>.empty(growable: true).obs;
  var isLoad = true.obs;

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
        .collection('Contacts')
        .where('Seller', isEqualTo: sellerPhone)
        .get();
    List<Contact> pList = List<Contact>.empty(growable: true);
    for (int i = 0; i < qSnap.docs.length; i++) {
      pList.add(Contact(
        qSnap.docs[i]['Phone'],
        qSnap.docs[i]['Name'],
        qSnap.docs[i]['Type'],
        qSnap.docs[i]['Emai;'],
        qSnap.docs[i]['Address'],
        qSnap.docs[i]['Note'],
        qSnap.docs[i]['imageUrl'],
        qSnap.docs[i]['Seller'],
        qSnap.docs[i].id,
      )
      );
    }
    contactList = pList;
    isLoad.value = false;
  }
}
