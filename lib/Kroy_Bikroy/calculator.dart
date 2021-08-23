import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jomakhoroch/Kroy_Bikroy/calculator_controller.dart';
import 'package:jomakhoroch/Kroy_Bikroy/product_list_controller.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  TextEditingController pNameController = TextEditingController();
  final CalculatorController calculatorController =
  Get.put(CalculatorController());
  final ProductListController productListController =
  Get.put(ProductListController());

  Widget buildButton(String text) {

    return ElevatedButton(
      onPressed: () {
        if (text != '+') {
          calculatorController.btnCalculate(text, pNameController.text.trim());
        } else {
          setState(() {
            pNameController.clear();
            calculatorController.prodName.value = '';
          });
          calculatorController.btnClear1();
        }
      },
      child: Text(text),
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        onPrimary: (text == '+') ? Colors.green : Colors.black,
        textStyle: TextStyle(fontSize: 30.0),
        elevation: 0.0,
        shadowColor: Colors.white,
        minimumSize: Size(MediaQuery.of(context).size.width * 0.15,
            MediaQuery.of(context).size.height * 0.15),

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.0),
          side: BorderSide(
              color: Colors.grey, width: 0.5, style: BorderStyle.solid),
        ),

      ),
    );

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 26.0),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: TextButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          content: Container(
                            height: MediaQuery.of(context).size.width * 0.8,
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  TextField(
                                      decoration: InputDecoration(
                                        hintText: 'পণ্যের নাম',
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.teal,
                                                width: 1.0)),
                                      ),
                                      controller: pNameController),

                                  ElevatedButton(
                                    onPressed: () async {
                                      calculatorController.prodName.value =
                                          pNameController.text;
                                      Navigator.pop(context);
                                    },
                                    child: Text('যোগ করুন'),
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.teal[600],
                                      onPrimary: Colors.white,
                                    ),
                                  ),

                                  // prod list
                                  ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: productListController
                                        .productList.length,
                                    itemBuilder:
                                        (BuildContext context, int index) =>
                                        ListTile(
                                          onTap: () {
                                            calculatorController.prodName.value =
                                                productListController
                                                    .productList[index].product;
                                            pNameController.text =
                                                productListController
                                                    .productList[index].product;
                                            Navigator.pop(context);
                                          },
                                          title: Text(productListController
                                              .productList[index].product),
                                        ),

                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    child: Obx(() => (calculatorController.prodName.value == '')
                        ? Text('পণ্যের নাম',
                        style: TextStyle(color: Colors.grey[400]))
                        : Text(calculatorController.prodName.value,
                        style: TextStyle(color: Colors.grey[400]))),
                  ),
                ),
                Expanded(
                    flex: 4,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Obx(
                            () => Text(
                            '৳' + calculatorController.totalTk.value.toString(),
                            style: TextStyle(fontSize: 26.0)),
                      ),
                    )),
                Expanded(
                    flex: 1,
                    child: IconButton(
                        onPressed: () {
                          setState(() {
                            pNameController.clear();
                            calculatorController.prodName.value = '';
                          });
                          calculatorController.btnClear();
                        },
                        icon: Icon(Icons.clear))
                ),
              ],
            ),
          ),

          Table(
            children: [
              TableRow(children: [
                buildButton('7'),
                buildButton('8'),
                buildButton('9'),
              ]),
              TableRow(children: [
                buildButton('4'),
                buildButton('5'),
                buildButton('6'),
              ]),
              TableRow(children: [
                buildButton('1'),
                buildButton('2'),
                buildButton('3'),
              ]),
              TableRow(children: [
                buildButton('.'),
                buildButton('0'),
                buildButton('+'),
              ]),
            ],
          ),

        ],
      ),
    );
  }
}
