import 'dart:convert';

Map<String, String> allCurrenciesFromJson(String str) =>
    Map.from(jsonDecode(str)).map((key, value) => MapEntry<String, String>(key, value));

String allCurrenciesToJson(Map<String, String> data) =>
    jsonEncode(Map.from(data).map((key, value) => MapEntry<String, dynamic>(key, value)));
