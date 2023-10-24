import 'package:flutter/material.dart';

import '../model/ratesmodel.dart';
import '../services/function.dart';

class Homecontroller extends ChangeNotifier {
  Homecontroller() {
    fetchs();
  }
  late Future<RateModel> result;
  late Future<Map> allcurrencies;

  void fetchs() {
    result = fetchrates();
    allcurrencies = fetchcurrencies();
    notifyListeners();
  }
}
