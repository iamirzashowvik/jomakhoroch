import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jomakhoroch/Kroy_Bikroy/bakir_khata_controller.dart';
import 'package:jomakhoroch/Kroy_Bikroy/baki_list.dart';
import 'package:jomakhoroch/Kroy_Bikroy/porishodh.dart';
import 'package:jomakhoroch/Kroy_Bikroy/sales.dart';

class BikrirKhata extends StatefulWidget {
  const BikrirKhata({Key? key}) : super(key: key);
  @override
  _BikrirKhataState createState() => _BikrirKhataState();
}

class _BikrirKhataState extends State<BikrirKhata> {
  final BakirKhataController bakirKhataController = Get.put(BakirKhataController());
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          title: Text('বিক্রির খাতা', style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.white,
          bottom: TabBar(
            labelColor: Colors.black,
            indicatorColor: Colors.teal,
            tabs: [
              Tab(text: 'সেলস'),
              Tab(text: 'পরিশোধকৃত'),
              Tab(text: 'বাকি'),
            ],
          ),
        ),
        body: Obx(() => (bakirKhataController.isLoad.value)
            ? Center(
                child: CircularProgressIndicator(color: Colors.teal),
              )
            : TabBarView(children: [
                Sales(bakirKhataController.sList),
                Porishod(bakirKhataController.sList),
                BakiList(bakirKhataController.sList),
              ])),
      ),
    );
  }
}
