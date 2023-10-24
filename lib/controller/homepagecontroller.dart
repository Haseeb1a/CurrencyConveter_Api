import 'package:flutter/material.dart';

import '../model/ratesmodel.dart';
import '../services/function.dart';

class Homecontroller extends ChangeNotifier {
  late Future<RateModel> result;
  late Future<Map> allcurrencies;
  String backgroundimage = "assets/currecy2.png";

  fetchs() {
    result = fetchrates();
    allcurrencies = fetchcurrencies();
    notifyListeners();
  }

  void setImage(String url) {
    backgroundimage;
    // imageUrl = url;
    notifyListeners();
  }
}
