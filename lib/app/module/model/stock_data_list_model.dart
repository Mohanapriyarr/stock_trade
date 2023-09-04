// To parse this JSON data, do
//
//     final stockDataList = stockDataListFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<StockDataListModel> stockDataListFromJson(String str) =>
    List<StockDataListModel>.from(
        json.decode(str).map((x) => StockDataListModel.fromJson(x)));

String stockDataListToJson(List<StockDataListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StockDataListModel {
  final String currency;
  final String description;
  final String displaySymbol;
  final String figi;
  final dynamic isin;
  final String mic;
  final String shareClassFigi;
  final String symbol;
  final String symbol2;
  final String type;

  StockDataListModel({
    required this.currency,
    required this.description,
    required this.displaySymbol,
    required this.figi,
    required this.isin,
    required this.mic,
    required this.shareClassFigi,
    required this.symbol,
    required this.symbol2,
    required this.type,
  });

  factory StockDataListModel.fromJson(Map<String, dynamic> json) =>
      StockDataListModel(
        currency: json["currency"],
        description: json["description"],
        displaySymbol: json["displaySymbol"],
        figi: json["figi"],
        isin: json["isin"],
        mic: json["mic"],
        shareClassFigi: json["shareClassFIGI"],
        symbol: json["symbol"],
        symbol2: json["symbol2"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "currency": currency,
        "description": description,
        "displaySymbol": displaySymbol,
        "figi": figi,
        "isin": isin,
        "mic": mic,
        "shareClassFIGI": shareClassFigi,
        "symbol": symbol,
        "symbol2": symbol2,
        "type": type,
      };
}
