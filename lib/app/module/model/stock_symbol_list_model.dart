// To parse this JSON data, do
//
//     final stockSymbolList = stockSymbolListFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

StockSymbolListModel stockSymbolListFromJson(String str) =>
    StockSymbolListModel.fromJson(json.decode(str));

String stockSymbolListToJson(StockSymbolListModel data) =>
    json.encode(data.toJson());

class StockSymbolListModel {
  final double c;
  final double d;
  final double dp;
  final double h;
  final double l;
  final double o;
  final double pc;
  final int t;
  final String changePercentage;

  StockSymbolListModel({
    required this.c,
    required this.d,
    required this.dp,
    required this.h,
    required this.l,
    required this.o,
    required this.pc,
    required this.t,
    required this.changePercentage,
  });

  factory StockSymbolListModel.fromJson(Map<String, dynamic> json) =>
      StockSymbolListModel(
        c: json["c"]?.toDouble(),
        d: json["d"]?.toDouble(),
        dp: json["dp"]?.toDouble(),
        h: json["h"]?.toDouble(),
        l: json["l"]?.toDouble(),
        o: json["o"]?.toDouble(),
        pc: json["pc"]?.toDouble(),
        t: json["t"],
        //? calculate change price percentage
        changePercentage:
            (((json['c'].toDouble() - json['pc'].toDouble()) / json['pc'] * 100)
                    .toStringAsFixed(2))
                .toString(),
      );

  Map<String, dynamic> toJson() => {
        "c": c,
        "d": d,
        "dp": dp,
        "h": h,
        "l": l,
        "o": o,
        "pc": pc,
        "t": changePercentage,
        "changePercentage": changePercentage,
      };
}
