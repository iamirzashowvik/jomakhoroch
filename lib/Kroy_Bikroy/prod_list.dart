import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jomakhoroch/Kroy_Bikroy/calculator_controller.dart';
import 'package:jomakhoroch/Kroy_Bikroy/product_list_controller.dart';

class ProdList extends StatefulWidget {
  const ProdList({Key? key}) : super(key: key);

  @override
  _ProdListState createState() => _ProdListState();
}

class _ProdListState extends State<ProdList> {
  final ProductListController productListController =
      Get.put(ProductListController());
  final CalculatorController calculatorController =
      Get.put(CalculatorController());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Obx(() {
        if (productListController.isLoad.value == true) {
          return Center(
            child: CircularProgressIndicator(
              color: Colors.teal,
            ),
          );
        } else {
          return ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: productListController.productList.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListTile(
                    onTap: () {
                      calculatorController.btnCalculateList(
                          productListController.productList[index].sell,
                          productListController.productList[index].product);
                    },
                    tileColor: Colors.white,
                    leading: (productListController.productList[index].imgUrl
                                .toString() ==
                            'null')
                        ? Image.asset('images/box.png', height: 50, width: 50)
                        : Image.network(
                            productListController.productList[index].imgUrl,
                            height: 50,
                            width: 50),
                    title:
                        Text(productListController.productList[index].product),
                    trailing:
                        Text(productListController.productList[index].sell),
                  ),
                );
              });
        }
      }),
    );
  }
}
