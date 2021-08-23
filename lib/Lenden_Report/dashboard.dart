import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jomakhoroch/Lenden_Report/dash_controller.dart';
import 'package:jomakhoroch/Lenden_Report/daily.dart';
import 'package:jomakhoroch/Lenden_Report/monthly.dart';
import 'package:jomakhoroch/Lenden_Report/weekly.dart';
import 'package:jomakhoroch/Lenden_Report/yearly.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  final DashController dashController = Get.put(DashController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          title: Text('ড্যাশবোর্ড', style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.white,
          bottom: TabBar(
            labelColor: Colors.black,
            tabs: [
              Tab(text: 'দৈনিক'),
              Tab(text: 'সাপ্তাহিক'),
              Tab(text: 'মাসিক'),
              Tab(text: 'বাৎসরিক'),
            ],
          ),
        ),
        body: Obx(
              () => (dashController.isLoad.value)
              ? Center(
            child: CircularProgressIndicator(color: Colors.green),
          )
              : TabBarView(
            children: [
              Daily(
                dashController.dtotalSale.value,
                dashController.dtotalCollec.value,
                dashController.dcntCollec.value,
                dashController.dtotalCash.value,
                dashController.dcntBaki.value,
                dashController.dtotalBaki.value,
              ),
              Weekly(
                dashController.wtotalSale.value,
                dashController.wtotalCollec.value,
                dashController.wcntCollec.value,
                dashController.wtotalCash.value,
                dashController.wcntBaki.value,
                dashController.wtotalBaki.value,
              ),
              Monthly(
                dashController.mtotalSale.value,
                dashController.mtotalCollec.value,
                dashController.mcntCollec.value,
                dashController.mtotalCash.value,
                dashController.mcntBaki.value,
                dashController.mtotalBaki.value,
              ),
              Yearly(
                dashController.ytotalSale.value,
                dashController.ytotalCollec.value,
                dashController.ycntCollec.value,
                dashController.ytotalCash.value,
                dashController.ycntBaki.value,
                dashController.ytotalBaki.value,
              ),
            ],
          ),
        ),
      ),
    );
  }
}