import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:jomakhoroch/Model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyProfileController extends GetxController {
  var isLoad = true.obs;
  var user = User('', '', '', '', '', '', '', '').obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  fetchData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String sellerPhone = sharedPreferences.getString('Phone').toString();

    await FirebaseFirestore.instance
        .collection('Users')
        .doc(sellerPhone)
        .get()
        .then((value) {
      user.value = User(
          value['Phone'],
          value['Pin'],
          value['Company'],
          value['CompanyType'],
          value['Gender'],
          value['Name'],
          value['Online'],
          value['image']);
    });

    isLoad.value = false;
  }
}
