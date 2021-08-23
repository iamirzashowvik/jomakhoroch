import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:jomakhoroch/Tally_Khata/Baki.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:pdf/pdf.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:pdf/widgets.dart' as pw;
// ignore: import_of_legacy_library_into_null_safe
import 'package:pdf/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PdfApi {
  static Future<File> generateFile(
      List<Baki> list, String totalBaki, String totalJoma) async {
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
                children: [
                  pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: [
                        pw.Text(sellerPhone),
                        pw.Image(pw.MemoryImage(byteList),
                            height: 100, width: 100),
                      ]),
                  pw.SizedBox(height: 20),
                  pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: [
                        pw.Align(
                          alignment: pw.Alignment.topLeft,
                          child: pw.Column(
                            children: [
                              pw.Align(
                                alignment: pw.Alignment.topLeft,
                                child: pw.Text(
                                    'Date: ' + DateTime.now().toString()),
                              ),
                              pw.Align(
                                alignment: pw.Alignment.topLeft,
                                child: pw.Text('No. of Transactions: ' +
                                    list.length.toString()),
                              ),
                              pw.Align(
                                alignment: pw.Alignment.topLeft,
                                child: pw.Text('Final Balance: ' + totalJoma),
                              ),
                            ],
                          ),
                        ),
                        pw.Align(
                          alignment: pw.Alignment.topRight,
                          child: pw.Column(
                            children: [
                              pw.Text('Deposit: ' + totalJoma,
                                  style: pw.TextStyle(
                                      color: PdfColor.fromHex('#00FF00'))),
                              pw.Text('Due: ' + totalBaki,
                                  style: pw.TextStyle(
                                      color: PdfColor.fromHex('#FF0000'))),
                            ],
                          ),
                        ),
                      ]),
                  pw.SizedBox(height: 20),
                  pw.Row(
                    children: [
                      pw.Expanded(
                        flex: 1,
                        child: pw.Text('No.'),
                      ),
                      pw.Expanded(
                        flex: 4,
                        child: pw.Text('Mobile'),
                      ),
                      pw.Expanded(
                        flex: 2,
                        child: pw.Text('Deposit'),
                      ),
                      pw.Expanded(
                        flex: 2,
                        child: pw.Text('Due'),
                      ),
                    ],
                  ),
                  pw.ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (pw.Context context, int index) {
                      return pw.Row(
                        children: [
                          pw.Expanded(
                            flex: 1,
                            child: pw.Text((index + 1).toString()),
                          ),
                          pw.Expanded(
                            flex: 4,
                            child: pw.Text(list[index].account),
                          ),
                          pw.Expanded(
                            flex: 2,
                            child: pw.Text(list[index].deposit,
                                style: pw.TextStyle(
                                    color: PdfColor.fromHex('#00FF00'))),
                          ),
                          pw.Expanded(
                            flex: 2,
                            child: pw.Text(list[index].amount,
                                style: pw.TextStyle(
                                    color: PdfColor.fromHex('#FF0000'))),
                          ),
                        ],
                      );
                    },
                  ),
                  pw.SizedBox(height: 5),
                  pw.Row(
                    children: [
                      pw.Expanded(
                        flex: 1,
                        child: pw.Text(''),
                      ),
                      pw.Expanded(
                        flex: 4,
                        child: pw.Text('Total'),
                      ),
                      pw.Expanded(
                        flex: 2,
                        child: pw.Text('0',
                            style: pw.TextStyle(
                                color: PdfColor.fromHex('#00FF00'))),
                      ),
                      pw.Expanded(
                        flex: 2,
                        child: pw.Text(totalBaki,
                            style: pw.TextStyle(
                                color: PdfColor.fromHex('#FF0000'))),
                      ),
                    ],
                  ),
                ],
              ),
            ];
          }),
    );
    return saveDocument(name: 'Bikri_report.pdf', pdf: pdf);
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