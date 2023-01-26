import 'package:app/models/all_currencies_model.dart';
import 'package:app/services/api_keys.dart';
import 'package:http/http.dart' as http;

import '../models/rates_model.dart';

Future<RatesModel> fetchRates() async {
  var response = await http.get(Uri.parse(ratesURL));

  final result = ratesModelFromJson(response.body);
  return result;
}

Future<Map> fetchCurrencies() async {
  var response = await http.get(Uri.parse(currencyURL));

  final allCurrencies = allCurrenciesFromJson(response.body);
  return allCurrencies;
}

String convertUsd(Map exchangeRates, String usd, String currency) {
  String output = ((exchangeRates[currency] * double.parse(usd)).toStringAsFixed(2)).toString();
  return output;
}

String convertAny(Map exchangeRates, String amount, String currencyBase, String currencyFinal) {
  String output = (double.parse(amount) / exchangeRates[currencyBase] * exchangeRates[currencyFinal]).toStringAsFixed(2).toString();

  return output;
}
