// import 'package:flutter/material.dart';
// import 'package:jomakhoroch/Model/product_report.dart';
//
// class ReportResult1 extends StatefulWidget {
//   final List<ProductReport> pList;
//   const ReportResult1(this.pList);
//
//   @override
//   _ReportResult1State createState() => _ReportResult1State();
// }
//
// class _ReportResult1State extends State<ReportResult1> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         iconTheme: IconThemeData(
//           color: Colors.black, //change your color here
//         ),
//         title: Text('পণ্য অনুযায়ী বিক্রয় রিপোর্ট',
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
//                       child:
//                           Text('পণ্যের নাম', style: TextStyle(fontSize: 14.0))),
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
//                   itemCount: widget.pList.length,
//                   itemBuilder: (BuildContext context, int index) {
//                     return Padding(
//                       padding: const EdgeInsets.only(top: 8.0),
//                       child: Row(
//                         children: [
//                           Expanded(
//                             flex: 2,
//                             child: (widget.pList[index].product == '' ||
//                                     widget.pList[index].product.isEmpty)
//                                 ? Text('Undefined')
//                                 : Text(widget.pList[index].product),
//                           ),
//                           Expanded(
//                               flex: 1,
//                               child: Text(widget.pList[index].quantity)),
//                           Align(
//                             alignment: Alignment.topRight,
//                             child: Expanded(
//                                 flex: 2,
//                                 child: Text(widget.pList[index].amount)),
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


import 'package:flutter/material.dart';
import 'package:jomakhoroch/Model/product_report.dart';

class ReportResult1 extends StatefulWidget {
  final List<ProductReport> pList;
  const ReportResult1(this.pList);

  @override
  _ReportResult1State createState() => _ReportResult1State();
}

class _ReportResult1State extends State<ReportResult1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Text('পণ্য অনুযায়ী বিক্রয় রিপোর্ট',
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
                      child:
                      Text('পণ্যের নাম', style: TextStyle(fontSize: 14.0))),
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
              child:

              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: widget.pList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(
                            flex: 4,
                            child: (widget.pList[index].product == '' ||
                                widget.pList[index].product.isEmpty)
                                ? Text('Undefined')
                                : Text(widget.pList[index].product),
                          ),
                          Expanded(
                              flex: 2,
                              child: Text(widget.pList[index].quantity)),
                          Expanded(
                              flex: 3, child: Text(widget.pList[index].amount)),
                        ],
                      ),
                    );
                  }
                  ),

            ),
          ],

        ),
      ),
    );
  }
}
