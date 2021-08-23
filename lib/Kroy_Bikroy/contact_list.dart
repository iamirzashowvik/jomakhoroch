import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jomakhoroch/Kroy_Bikroy/calculator_controller.dart';
import 'package:jomakhoroch/Kroy_Bikroy/contact_list_controller.dart';
import 'package:jomakhoroch/Contact_List/contact.dart';
import 'package:jomakhoroch/Kroy_Bikroy/add_contact.dart';
import 'package:jomakhoroch/Kroy_Bikroy/baki_rakhun.dart';
import 'package:jomakhoroch/Kroy_Bikroy/contact_details.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ContactList extends StatefulWidget {
  final bool bakiache, details;
  const ContactList(this.bakiache, this.details);
  @override
  _ContactListState createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  final ContactListController contactListController =
      Get.put(ContactListController());
  final CalculatorController calculatorController =
      Get.put(CalculatorController());

  bool isSearch = false;
  String searchText = '';
  TextEditingController searchController = TextEditingController();

  tileTap(String phone, Contact contact) async {
    if (widget.details == true) {
      Get.to(ContactDetails(contact));
    } else if (widget.bakiache == true) {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      String sellerPhone = sharedPreferences.getString('Phone').toString();
      await FirebaseFirestore.instance.collection('Sales').doc().set({
        'Seller': sellerPhone,
        'Amount': calculatorController.totalSum.toString(),
        'Date': DateTime.now(),
        'Type': 'Debt',
        'Account': phone,
        'Product': calculatorController.prodName.value.toString(),
      }).then((value) {
        Get.to(BakiRakhun());
      });
    } else {
      // ********** //
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        label: Text(
          'নতুন কন্টাক্ট',
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
        icon: Icon(Icons.add),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        onPressed: () {
          if (widget.bakiache == true) {
            Get.to(AddContact('Baki'));
          } else {
            Get.to(AddContact('none'));
          }
        },
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: (isSearch)
            ? TextField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: "Search..",
                ),
                onChanged: (value) {
                  setState(() {
                    searchText = searchController.text.trim();
                  });
                },
              )
            : Text('কন্টাক্ট লিস্ট', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        actions: [
          (isSearch)
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      searchController.clear();
                      isSearch = false;
                      searchText = '';
                    });
                  },
                  icon: Icon(Icons.clear),
                )
              : IconButton(
                  onPressed: () {
                    setState(() {
                      isSearch = true;
                    });
                  },
                  icon: Icon(Icons.search),
                ),
        ],
      ),
      body: Container(
        //color: Colors.grey[400],
        height: MediaQuery.of(context).size.height,
        child: Obx(() {
          if (contactListController.isLoad.value == true) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.teal,
              ),
            );
          } else {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: contactListController.contactList.length,
              itemBuilder: (BuildContext context, int index) {
                if (contactListController.contactList[index].name
                        .contains(searchText) ||
                    contactListController.contactList[index].phone
                        .contains(searchText)) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ListTile(
                      onTap: () {
                        tileTap(
                            contactListController.contactList[index].phone
                                .toString(),
                            contactListController.contactList[index]);
                      },
                      tileColor: Colors.white,
                      leading: (contactListController
                                  .contactList[index].imageUrl ==
                              'null')
                          ? Container(
                              height: 50,
                              width: 50,
                              decoration: new BoxDecoration(
                                color: Colors.grey,
                                shape: BoxShape.circle,
                                image: new DecorationImage(
                                  image: new AssetImage('images/contact.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )
                          : Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey,
                                image: DecorationImage(
                                    image: NetworkImage(contactListController
                                        .contactList[index].imageUrl),
                                    fit: BoxFit.fill),
                              ),
                            ),
                      trailing: Icon(Icons.arrow_forward, color: Colors.teal),
                      title: Text(contactListController.contactList[index].name
                          .toString()),
                      subtitle: Row(
                        children: [
                          Text(contactListController.contactList[index].phone
                              .toString()),
                          SizedBox(width: 5.0),
                          Container(
                              height: 25,
                              width: 80,
                              color: Colors.teal[600],
                              child: Center(
                                child: Text(
                                  contactListController.contactList[index].type
                                      .toString(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                        ],
                      ),
                    ),
                  );
                } else {
                  return Container();
                }
              },
            );
          }
        }),
      ),
    );
  }
}
