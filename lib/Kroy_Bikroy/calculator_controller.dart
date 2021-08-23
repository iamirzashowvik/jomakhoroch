import 'package:get/get.dart';

class CalculatorController extends GetxController {
  var totalTk = '0'.obs;
  var totalSum = '0'.obs;
  bool poinTap = false;
  var prodName = ''.obs;

  @override
  void onInit() {
    totalSum.value = '0';
    totalTk.value = '0';
    poinTap = false;
    prodName.value = '';
    super.onInit();
  }

  void btnClear() {
    print(totalSum.toString() + ' xxxxxxxx ' + totalTk.toString());
    if (double.parse(totalSum.value) > 0.0) {
      totalSum.value =
          ((double.parse(totalSum.value) - double.parse(totalTk.value))
                  .toStringAsFixed(2))
              .toString();
    }
    totalTk.value = '0';
    poinTap = false;
    prodName.value = '';
  }

  void btnClear1() {
    totalTk.value = '0';
    poinTap = false;
    //prodName.value = '';
  }

  void btnCalculateList(String number, String product) {
    prodName.value = product;
    totalSum.value =
        (double.parse(totalSum.value) + double.parse(number)).toString();
  }

  void btnCalculate(String number, String product) {
    prodName.value = product;
    if (totalTk.value.length < 10) {
      if (number == '.' && poinTap == false) {
        poinTap = true;
        totalTk.value = totalTk.value
            .toString()
            .substring(0, totalTk.value.toString().length - 1);
      } else {
        totalSum.value =
            (double.parse(totalSum.value) - double.parse(totalTk.value))
                .toString();
        if (poinTap == true) {
          totalTk.value = totalTk.value.toString() + number;
          totalTk.value =
              double.parse(totalTk.value).toStringAsFixed(2).toString();
        } else {
          double ans =
              double.parse(totalTk.value) * 10.0 + double.parse(number);
          totalTk.value = ans.toString();
        }
        totalSum.value =
            (double.parse(totalSum.value) + double.parse(totalTk.value))
                .toString();
      }
    }
  }
}
