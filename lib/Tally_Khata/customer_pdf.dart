import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:jomakhoroch/Tally_Khata/baki_info.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomerPdf {
  static Future<File> generateFile(String customerPhone, String amount,
      List<BakiInfo> list, String netAmount) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String sellerPhone = sharedPreferences.getString('Phone').toString();

    final pdf = pw.Document();

    final ByteData bytes = await rootBundle.load('images/mainlogo.png');
    final Uint8List byteList = bytes.buffer.asUint8List();

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return [
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              mainAxisAlignment: pw.MainAxisAlignment.start,
              children: [
                pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Text(sellerPhone),
                      pw.Image(pw.MemoryImage(byteList),
                          height: 100, width: 100),
                    ]),
                pw.SizedBox(height: 20),
                pw.Text('Customer : ' + customerPhone),
                pw.RichText(
                  text: pw.TextSpan(text: 'Due: ', children: [
                    pw.TextSpan(
                        text: amount,
                        style:
                            pw.TextStyle(color: PdfColor.fromHex('#FF0000'))),
                  ]),
                ),
                pw.RichText(
                  text: pw.TextSpan(text: 'Net Due: ', children: [
                    pw.TextSpan(
                        text: netAmount,
                        style:
                            pw.TextStyle(color: PdfColor.fromHex('#FF0000'))),
                  ]),
                ),
                pw.SizedBox(height: 10.0),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.start,
                  children: [
                    pw.Expanded(flex: 1, child: pw.Text('SL.')),
                    pw.Expanded(flex: 3, child: pw.Text('Entry')),
                    pw.Expanded(flex: 1, child: pw.Text('Due')),
                    pw.Expanded(flex: 1, child: pw.Text('Deposit')),
                  ],
                ),
                pw.ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (pw.Context context, int index) {
                    return pw.Padding(
                      padding: pw.EdgeInsets.only(top: 10.0),
                      child: pw.Row(
                        children: [
                          pw.Expanded(
                            flex: 1,
                            child: pw.Text('#' + (index + 1).toString()),
                          ),
                          pw.Expanded(
                            flex: 3,
                            child: pw.Column(
                                mainAxisAlignment: pw.MainAxisAlignment.start,
                                crossAxisAlignment: pw.CrossAxisAlignment.start,
                                children: [
                                  pw.Text(list[index].date),
                                  pw.Text(list[index].product),
                                ]),
                          ),
                          pw.Expanded(
                              flex: 1,
                              child: (list[index].type == 'Debt')
                                  ? pw.Text(list[index].amount)
                                  : pw.Text('')),
                          pw.Expanded(
                              flex: 1,
                              child: (list[index].type == 'DebtWithCash')
                                  ? pw.Text(list[index].amount)
                                  : pw.Text('')),
                        ],
                      ),
                    );
                  },
                )
              ],
            )
          ];
        },
      ),
    );

    return saveDocument(name: 'Customer_report.pdf', pdf: pdf);
  }

  static Future<File> saveDocument({
    required String name,
    required Document pdf,
  }) async {
    final bytes = await pdf.save();
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$name');
    await file.writeAsBytes(bytes);
    return file;
  }

  static Future openFile(File file) async {
    final url = file.path;
    await OpenFile.open(url);
  }
}
