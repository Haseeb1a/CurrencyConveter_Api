import 'package:currency/model/allcurrecncy.dart';
import 'package:currency/model/ratesmodel.dart';
import 'package:currency/utils/key.dart';
import 'package:http/http.dart' as http;

Future<Map> fetchcurrencies() async {
  // var response = await http.get
  var response = await http.get(
      Uri.parse("https://openexchangerates.org/api/currencies.json" + key));
  final allCurrences = allCurenciesFromJson(response.body);
  return allCurrences;
}

Future<RateModel> fetchrates() async {
  var response = await http.get(
  Uri.parse("https://openexchangerates.org/api/currencies.json" + key));
  final result = rateModelFromJson(response.body);
  return result;
}
//  https://openexchangerates.org/api/latest.json?app_id=7fa40647af764ff5aa4a3d10f22a5502