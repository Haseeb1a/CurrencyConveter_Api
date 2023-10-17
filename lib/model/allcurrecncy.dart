// To parse this JSON data, do
//
//     final welcome = allCurenciesFromJson(jsonString);

import 'dart:convert';

Map<String, String> allCurenciesFromJson(String str) => Map.from(json.decode(str)).map((k, v) => MapEntry<String, String>(k, v));

String allCurenciesToJson(Map<String, String> data) => json.encode(Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v)));
