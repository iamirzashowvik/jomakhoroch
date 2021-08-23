import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jomakhoroch/Lenden_Report/report_controller.dart';
import 'package:jomakhoroch/Lenden_Report/report_result.dart';
import 'package:jomakhoroch/Lenden_Report/report_result1.dart';

class LoadingAnimation extends StatefulWidget {
  final String type;
  const LoadingAnimation(this.type);
  @override
  _LoadingAnimationState createState() => _LoadingAnimationState();
}

class _LoadingAnimationState extends State<LoadingAnimation> {
  final ReportController reportController = Get.put(ReportController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => (widget.type == 'Customer')
            ? ((reportController.isLoad2.value)
                ? Container(
                    color: Colors.white,
                    child: Center(
                        child: CircularProgressIndicator(color: Colors.teal)))
                : ReportResult(reportController.cusList))
            : ((reportController.isLoad1.value)
                ? Container(
                    color: Colors.white,
                    child: Center(
                        child: CircularProgressIndicator(color: Colors.teal)))
                : ReportResult1(reportController.prodList)),
      ),
    );
  }
}
/*

*/