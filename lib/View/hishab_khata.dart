import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jomakhoroch/Lenden_Report/dash_controller.dart';
import 'package:jomakhoroch/View/hishab_daily.dart';
import 'package:jomakhoroch/View/hishab_monthy.dart';

import 'package:jomakhoroch/View/hishab_weekly.dart';
import 'package:jomakhoroch/View/hishab_yearly.dart';



class HishabKhata extends StatefulWidget {
  const HishabKhata({Key? key}) : super(key: key);

  @override
  _HishabKhataState createState() => _HishabKhataState();
}

class _HishabKhataState extends State<HishabKhata> {
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
          title: Text('হিসাব খাতা', style: TextStyle(color: Colors.black)),
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
              HishabDaily(
                dashController.dtotalCollec.value,
                dashController.dtotalBaki.value,
              ),
              HishabWeekly(
                dashController.wtotalCollec.value,
                dashController.wtotalBaki.value,
              ),
              HishabMonthly(
                dashController.mtotalCollec.value,
                dashController.mtotalBaki.value,
              ),
              HishabYearly(
                dashController.ytotalCollec.value,
                dashController.ytotalBaki.value,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
