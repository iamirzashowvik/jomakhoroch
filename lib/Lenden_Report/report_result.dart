// import 'package:flutter/material.dart';
// import 'package:jomakhoroch/Lenden_Report/customer_model.dart';
//
// class ReportResult extends StatefulWidget {
//   final List<CustomerModel> cList;
//   const ReportResult(this.cList);
//
//   @override
//   _ReportResultState createState() => _ReportResultState();
// }
//
// class _ReportResultState extends State<ReportResult> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         iconTheme: IconThemeData(
//           color: Colors.black, //change your color here
//         ),
//         title: Text('কাস্টমার অনুযায়ী বিক্রয় রিপোর্ট',
//             style: TextStyle(color: Colors.black)),
//         backgroundColor: Colors.white,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             SizedBox(height: 10.0),
//             Padding(
//               padding: const EdgeInsets.all(12.0),
//               child: Row(
//                 children: [
//                   Expanded(
//                       flex: 2,
//                       child: Text('গ্রাহকের নাম',
//                           style: TextStyle(fontSize: 14.0))),
//                   Expanded(
//                       flex: 1,
//                       child: Text('অর্ডার সংখ্যা',
//                           style: TextStyle(fontSize: 14.0))),
//                   Align(
//                       alignment: Alignment.topRight,
//                       child: Expanded(
//                           flex: 2,
//                           child: Text('বিক্রিমূল্য',
//                               style: TextStyle(fontSize: 14.0)))),
//                 ],
//               ),
//             ),
//             Divider(),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: ListView.builder(
//                   physics: NeverScrollableScrollPhysics(),
//                   shrinkWrap: true,
//                   itemCount: widget.cList.length,
//                   itemBuilder: (BuildContext context, int index) {
//                     return Padding(
//                       padding: const EdgeInsets.only(top: 8.0),
//                       child: Row(
//                         children: [
//                           Expanded(
//                               flex: 2,
//                               child: (widget.cList[index].name != 'null')
//                                   ? Text(widget.cList[index].name)
//                                   : Text('Undefined')),
//                           Expanded(
//                               flex: 1,
//                               child: Text(widget.cList[index].quantity)),
//                           Align(
//                             alignment: Alignment.topRight,
//                             child: Expanded(
//                                 flex: 2,
//                                 child: Text(widget.cList[index].amount)),
//                           ),
//                         ],
//                       ),
//                     );
//                   }),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// /*
//
//  */


import 'package:flutter/material.dart';
import 'package:jomakhoroch/Lenden_Report/customer_model.dart';

class ReportResult extends StatefulWidget {
  final List<CustomerModel> cList;
  const ReportResult(this.cList);

  @override
  _ReportResultState createState() => _ReportResultState();
}

class _ReportResultState extends State<ReportResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Text('কাস্টমার অনুযায়ী বিক্রয় রিপোর্ট',
            style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Expanded(
                      flex: 4,
                      child: Text('গ্রাহকের নাম',
                          style: TextStyle(fontSize: 14.0))),
                  Expanded(
                      flex: 2,
                      child: Text('অর্ডার সংখ্যা',
                          style: TextStyle(fontSize: 14.0))),
                  Expanded(
                      flex: 3,
                      child: Text('বিক্রিমূল্য',
                          style: TextStyle(fontSize: 14.0))),
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: widget.cList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 4,
                              child: (widget.cList[index].name != 'null')
                                  ? Text(widget.cList[index].name)
                                  : Text('Undefined')),
                          Expanded(
                              flex: 2,
                              child: Text(widget.cList[index].quantity)),
                          Expanded(
                              flex: 3, child: Text(widget.cList[index].amount)),
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
