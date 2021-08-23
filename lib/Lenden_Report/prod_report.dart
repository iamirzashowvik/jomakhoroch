// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:jomakhoroch/Lenden_Report/report_controller.dart';
// import 'package:jomakhoroch/Lenden_Report/loading_animation.dart';
//
// class ProdReport extends StatefulWidget {
//   const ProdReport({Key? key}) : super(key: key);
//
//   @override
//   _ProdReportState createState() => _ProdReportState();
// }
//
// class _ProdReportState extends State<ProdReport> {
//   final ReportController reportController = Get.put(ReportController());
//
//   DateTime selectedDate1 = DateTime.now();
//   DateTime selectedDate2 = DateTime.now();
//
//   String catagoryChoose = '';
//   String hintText = 'তারিখ অনুযায়ী';
//   List catagory = ['আজ', 'এই সপ্তাহ', 'এই মাস', 'এই বছর', 'তারিখ অনুযায়ী'];
//
//   @override
//   void initState() {
//     super.initState();
//     selectedDate1 = DateTime.now();
//     selectedDate2 = DateTime.now();
//   }
//
//   Future<void> datePick1(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//         context: context,
//         initialDate: selectedDate1,
//         firstDate: DateTime(2019, 1),
//         lastDate: DateTime(2101));
//     if (picked != null && picked != selectedDate1)
//       setState(() {
//         selectedDate1 = picked;
//       });
//   }
//
//   Future<void> datePick2(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//         context: context,
//         initialDate: selectedDate2,
//         firstDate: DateTime(2019, 1),
//         lastDate: DateTime(2101));
//     if (picked != null && picked != selectedDate2)
//       setState(() {
//         selectedDate2 = picked;
//       });
//   }
//
//   Widget buildText(String text) {
//     return Align(
//       alignment: Alignment.topLeft,
//       child: Text(text, style: TextStyle(color: Colors.grey)),
//     );
//   }
//
//   String dateFormat(DateTime selectedDate1) {
//     return selectedDate1.day.toString() +
//         '/' +
//         selectedDate1.month.toString() +
//         '/' +
//         selectedDate1.year.toString();
//   }
//
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
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Card(
//           child: Padding(
//             padding: const EdgeInsets.only(
//                 top: 22.0, bottom: 22.0, left: 10.0, right: 10.0),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 buildText('সময়সীমা'),
//                 DropdownButton(
//                   hint: Text(hintText),
//                   icon: Icon(Icons.arrow_downward, color: Colors.green),
//                   iconSize: 25.0,
//                   isExpanded: true,
//                   onChanged: (value) {
//                     setState(() {
//                       catagoryChoose = value.toString();
//                       hintText = value.toString();
//                       if (value == 'আজ') {
//                         selectedDate1 = selectedDate2 = DateTime.now();
//                       } else if (value == 'এই মাস') {
//                         selectedDate1 = DateTime(
//                             DateTime.now().year, DateTime.now().month, 1);
//                         selectedDate2 = DateTime(
//                             DateTime.now().year, DateTime.now().month, 30);
//                       } else if (value == 'এই বছর') {
//                         selectedDate1 = DateTime(DateTime.now().year, 1, 1);
//                         selectedDate2 = DateTime(DateTime.now().year, 12, 31);
//                       } else if (value == 'এই সপ্তাহ') {
//                         selectedDate1 = DateTime(DateTime.now().year,
//                             DateTime.now().month, DateTime.now().weekday);
//                         selectedDate2 = DateTime(DateTime.now().year,
//                             DateTime.now().month, DateTime.now().weekday + 6);
//                       }
//                     });
//                   },
//                   items: catagory.map<DropdownMenuItem<String>>((value) {
//                     return DropdownMenuItem<String>(
//                       value: value,
//                       child: Text(value),
//                     );
//                   }).toList(),
//                 ),
//                 SizedBox(height: 20.0),
//                 buildText('শুরুর তারিখ'),
//                 Row(
//                   children: [
//                     Expanded(child: Text(dateFormat(selectedDate1))),
//                     Align(
//                       alignment: Alignment.topRight,
//                       child: Expanded(
//                           child: IconButton(
//                               onPressed: () => datePick1(context),
//                               icon: Icon(Icons.calendar_today,
//                                   color: Colors.green))),
//                     )
//                   ],
//                 ),
//                 Divider(),
//                 SizedBox(height: 20.0),
//                 buildText('শেষ তারিখ'),
//                 Row(
//                   children: [
//                     Expanded(flex: 1, child: Text(dateFormat(selectedDate2))),
//                     Align(
//                       alignment: Alignment.topRight,
//                       child: Expanded(
//                           flex: 1,
//                           child: IconButton(
//                               onPressed: () => datePick2(context),
//                               icon: Icon(Icons.calendar_today,
//                                   color: Colors.green))),
//                     )
//                   ],
//                 ),
//                 Divider(),
//                 SizedBox(height: 20.0),
//                 ElevatedButton.icon(
//                     onPressed: () {
//                       reportController.prodData(selectedDate1, selectedDate2);
//                       Get.off(LoadingAnimation('Product'));
//                     },
//                     icon: Icon(Icons.settings),
//                     label: Text('রিপোর্ট রেডি করুন'),
//                     style: ElevatedButton.styleFrom(
//                       primary: Colors.blue,
//                       onPrimary: Colors.white,
//                       minimumSize:
//                           Size(MediaQuery.of(context).size.width * 0.9, 50),
//                     )),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jomakhoroch/Lenden_Report/report_controller.dart';
import 'package:jomakhoroch/Lenden_Report/loading_animation.dart';

class ProdReport extends StatefulWidget {
  const ProdReport({Key? key}) : super(key: key);

  @override
  _ProdReportState createState() => _ProdReportState();
}

class _ProdReportState extends State<ProdReport> {
  final ReportController reportController = Get.put(ReportController());

  DateTime selectedDate1 = DateTime.now();
  DateTime selectedDate2 = DateTime.now();

  String catagoryChoose = '';
  String hintText = 'তারিখ অনুযায়ী';
  List catagory = ['আজ', 'এই সপ্তাহ', 'এই মাস', 'এই বছর', 'তারিখ অনুযায়ী'];

  @override
  void initState() {
    super.initState();
    selectedDate1 = DateTime.now();
    selectedDate2 = DateTime.now();
  }

  Future<void> datePick1(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate1,
        firstDate: DateTime(2019, 1),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate1)
      setState(() {
        selectedDate1 = picked;
      });
  }

  Future<void> datePick2(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate2,
        firstDate: DateTime(2019, 1),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate2)
      setState(() {
        selectedDate2 = picked;
      });
  }

  Widget buildText(String text) {
    return Text(text, style: TextStyle(color: Colors.grey));
  }

  String dateFormat(DateTime selectedDate1) {
    return selectedDate1.day.toString() +
        '/' +
        selectedDate1.month.toString() +
        '/' +
        selectedDate1.year.toString();
  }

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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.only(
                top: 22.0, bottom: 22.0, left: 10.0, right: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                buildText('সময়সীমা'),
                DropdownButton(
                  hint: Text(hintText),
                  icon: Icon(Icons.arrow_downward, color: Colors.teal),
                  iconSize: 25.0,
                  isExpanded: true,
                  onChanged: (value) {
                    setState(() {
                      catagoryChoose = value.toString();
                      hintText = value.toString();
                      if (value == 'আজ') {
                        selectedDate1 = selectedDate2 = DateTime.now();
                      } else if (value == 'এই মাস') {
                        selectedDate1 = DateTime(
                            DateTime.now().year, DateTime.now().month, 1);
                        selectedDate2 = DateTime(
                            DateTime.now().year, DateTime.now().month, 30);
                      } else if (value == 'এই বছর') {
                        selectedDate1 = DateTime(DateTime.now().year, 1, 1);
                        selectedDate2 = DateTime(DateTime.now().year, 12, 31);
                      } else if (value == 'এই সপ্তাহ') {
                        selectedDate1 = DateTime(DateTime.now().year,
                            DateTime.now().month, DateTime.now().weekday);
                        selectedDate2 = DateTime(DateTime.now().year,
                            DateTime.now().month, DateTime.now().weekday + 6);
                      }
                    });
                  },
                  items: catagory.map<DropdownMenuItem<String>>((value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                SizedBox(height: 20.0),
                buildText('শুরুর তারিখ'),
                Row(
                  children: [
                    Text(dateFormat(selectedDate1)),
                    Spacer(),
                    IconButton(
                        onPressed: () => datePick1(context),
                        icon: Icon(Icons.calendar_today, color: Colors.teal))
                  ],
                ),
                Divider(),
                SizedBox(height: 20.0),
                buildText('শেষ তারিখ'),
                Row(
                  children: [
                    Text(dateFormat(selectedDate2)),
                    Spacer(),
                    IconButton(
                        onPressed: () => datePick2(context),
                        icon: Icon(Icons.calendar_today, color: Colors.teal))
                  ],
                ),
                Divider(),
                SizedBox(height: 20.0),

                ElevatedButton.icon(
                    onPressed: () {
                      reportController.prodData(selectedDate1, selectedDate2);
                      Get.off(LoadingAnimation('Product'));
                    },
                    icon: Icon(Icons.settings),
                    label: Text('রিপোর্ট রেডি করুন'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.teal,
                      onPrimary: Colors.white,
                      minimumSize:
                      Size(MediaQuery.of(context).size.width * 0.9, 50),
                    )
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
