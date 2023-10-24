import 'package:flutter/material.dart';

import '../services/function.dart';

class AnyTOAny extends ChangeNotifier {
  String dropdownValue1 = 'AUD';
  String dropdownValue2 = 'AUD';
  String answer = 'Converted Currency will be shown here :';
  TextEditingController amountController = TextEditingController();
  void setDropdownValue(String newValue) {
    dropdownValue1 = newValue;
    notifyListeners();
  }

  void setDrodewnavalue2(String newvalue) {
    dropdownValue2 = newvalue;
     notifyListeners();
  }
   void convertAndSetAnswer(String amount, Map<String, double> rates) {
    // Perform the conversion logic here and set the answer
    answer = amount +
        ' ' +
        dropdownValue1 +
        ' ' +
        convertany(rates, amount, dropdownValue1, dropdownValue2) +
        ' ' +
        dropdownValue2;

    notifyListeners();
  }
  }

