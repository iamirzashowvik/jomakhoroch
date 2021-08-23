import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jomakhoroch/Kroy_Bikroy/contact_list_controller.dart';
import 'package:jomakhoroch/Contact_List/contact.dart';
import 'package:jomakhoroch/Kroy_Bikroy/contact_list.dart';
import 'package:jomakhoroch/View/edit_contact.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class ContactDetails extends StatefulWidget {
  final Contact contact;
  const ContactDetails(this.contact);
  @override
  _ContactDetailsState createState() => _ContactDetailsState();
}

class _ContactDetailsState extends State<ContactDetails> {
  void phoneCall() async {
    await UrlLauncher.launch('tel:+${widget.contact.phone}');
  }

  void sentSms() async {
    await UrlLauncher.launch('sms:+${widget.contact.phone}');
  }

  void sentMail() async {
    await UrlLauncher.launch('mailto:+${widget.contact.email}');
  }

  Widget partOne() {
    return Container(
      width: double.infinity,
      child: Card(
        elevation: 0.0,
        shape: RoundedRectangleBorder(),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              SizedBox(height: 10.0),
              (widget.contact.imageUrl.isEmpty ||
                      widget.contact.imageUrl == '' ||
                      widget.contact.imageUrl == 'null')
                  ? Container(
                      height: 140,
                      width: 140,
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
                      height: 140,
                      width: 140,
                      decoration: new BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                          image: new NetworkImage(widget.contact.imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
              SizedBox(height: 10.0),
              Text(widget.contact.name, style: TextStyle(fontSize: 20.0)),
              SizedBox(height: 5.0),
              Text(widget.contact.phone, style: TextStyle(fontSize: 18.0)),
              SizedBox(height: 5.0),
              Container(
                color: Colors.yellow[800],
                child: Text(widget.contact.type,
                    style: TextStyle(color: Colors.white)),
              ),
              SizedBox(height: 12.0),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        phoneCall();
                      },
                      child: Card(
                        elevation: 0.0,
                        color: Colors.green[50],
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            children: [
                              Icon(Icons.call, color: Colors.teal),
                              Text('কল', style: TextStyle(color: Colors.teal))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        sentSms();
                      },
                      child: Card(
                        elevation: 0.0,
                        color: Colors.green[50],
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            children: [
                              Icon(Icons.message, color: Colors.teal),
                              Text('মেসেজ',
                                  style: TextStyle(color: Colors.teal))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        sentMail();
                      },
                      child: Card(
                        elevation: 0.0,
                        color: Colors.green[50],
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            children: [
                              Icon(Icons.mail, color: Colors.teal),
                              Text('মেইল',
                                  style: TextStyle(color: Colors.teal))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget partTwo() {
    return Container(
      width: double.infinity,
      child: Card(
        elevation: 0.0,
        shape: RoundedRectangleBorder(),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text('অন্যান্য তথ্যাবলী',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              SizedBox(height: 15.0),
              Row(
                children: [
                  Expanded(flex: 1, child: Text('ইমেইল')),
                  Expanded(
                      flex: 3,
                      child: (widget.contact.email.isEmpty ||
                              widget.contact.email == '')
                          ? Text('N/A')
                          : Text(widget.contact.email)),
                ],
              ),
              Divider(),
              Row(
                children: [
                  Expanded(flex: 1, child: Text('ঠিকানা')),
                  Expanded(
                      flex: 3,
                      child: (widget.contact.address.isEmpty ||
                              widget.contact.address == '')
                          ? Text('N/A')
                          : Text(widget.contact.address)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget partThree() {
    return Container(
      width: double.infinity,
      child: Card(
        elevation: 0.0,
        shape: RoundedRectangleBorder(),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: Text('নোট',
                      style: TextStyle(fontWeight: FontWeight.bold))),
              SizedBox(height: 15.0),
              Align(
                  alignment: Alignment.topLeft,
                  child:
                      (widget.contact.note == '' || widget.contact.note.isEmpty)
                          ? Text('N/A')
                          : Text(widget.contact.note)),
            ],
          ),
        ),
      ),
    );
  }

  void deleteTap() async {
    await FirebaseFirestore.instance
        .collection('Contacts')
        .doc(widget.contact.id)
        .delete()
        .then((value) {
      Get.delete<ContactListController>();
      Get.off(ContactList(false, true));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Text('কন্টাক্ট ডিটেলস', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {
                Get.to(EditContact(widget.contact));
              },
              icon: Icon(Icons.edit, color: Colors.teal)),
          PopupMenuButton(
              offset: Offset(0, 40),
              onSelected: (value) {
                if (value.toString() == 'delete') {
                  deleteTap();
                }
              },
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    value: 'delete',
                    child: Row(
                      children: [
                        Icon(Icons.delete, color: Colors.red[900]),
                        Expanded(child: Text('ডিলিট')),
                      ],
                    ),
                  )
                ];
              })
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 8.0),
            partOne(),
            partTwo(),
            partThree(),
          ],
        ),
      ),
    );
  }
}
