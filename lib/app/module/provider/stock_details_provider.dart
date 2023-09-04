import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../data/service/api/stock_profile_api.dart';
import '../../data/service/api/stock_symbol_list_api.dart';
import '../model/stock_profile_model.dart';
import '../model/stock_symbol_list_model.dart';

class StockDetailsProvider extends ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;

  String _symbol = '';
  String get symbol => _symbol;

  String _imgPath = '';
  String get imgPath => _imgPath;

  StockSymbolListModel? stockSymbolList;
  StockProfileModel? stockProfileModel;
  List<ChartSampleData>? listData;
  TrackballBehavior? trackballBehavior;

  StockDetailsProvider(String symbol, String imgPath) {
    setSymbol(symbol);
    initSate();
  }

  Future<void> initSate() async {
    listData = await getChartData();
    trackballBehavior = TrackballBehavior(
        enable: true, activationMode: ActivationMode.singleTap);
    //  final args = ModalRoute.of(context)!.settings.arguments as Map;
    setLoading(true);
    Future.wait([fetchStockSymbols(), fetchStockProfile()]);

    setLoading(false);
  }

  //? loader
  void setLoading(bool loadingStatus) {
    _loading = loadingStatus;
    notifyListeners();
  }

  //? arg update
  void setSymbol(String symbol) {
    _symbol = symbol;
    notifyListeners();
  }

  //? arg update
  void setImage(String imgPath) {
    _imgPath = imgPath;
    notifyListeners();
  }

  //? fetch symbol
  Future<void> fetchStockSymbols() async {
    final data = await stockSymbolListApi(symbol);
    if (data == null) return;
    stockSymbolList = data;
    notifyListeners();
  }

  //? for fetch symbol details
  Future<void> fetchStockProfile() async {
    final data = await stockProfileApi(symbol: symbol);
    if (data == null) return;
    stockProfileModel = data;
    notifyListeners();
  }

  //? for historical chart data (data get from manually)
  Future<List<ChartSampleData>> getChartData() async {
    return <ChartSampleData>[
      ChartSampleData(
          x: DateTime(2016, 1, 05),
          open: 110,
          high: 114.73,
          low: 108,
          close: 113.97),
      ChartSampleData(
          x: DateTime(2016, 1, 12),
          open: 113.29,
          high: 116.73,
          low: 112.49,
          close: 115.97),
      ChartSampleData(
          x: DateTime(2016, 1, 19),
          open: 115.8,
          high: 117.5,
          low: 115.59,
          close: 116.52),
      ChartSampleData(
          x: DateTime(2016, 1, 26),
          open: 116.52,
          high: 118.0166,
          low: 115.43,
          close: 115.83),
      ChartSampleData(
          x: DateTime(2016, 2, 05),
          open: 110,
          high: 114.73,
          low: 108,
          close: 113.97),
      ChartSampleData(
          x: DateTime(2016, 2, 12),
          open: 140.29,
          high: 116.73,
          low: 112.49,
          close: 120.97),
      ChartSampleData(
          x: DateTime(2016, 2, 19),
          open: 139.8,
          high: 117.5,
          low: 115.59,
          close: 116.52),
      ChartSampleData(
          x: DateTime(2016, 2, 26),
          open: 141.52,
          high: 118.0166,
          low: 115.43,
          close: 115.83),
      ChartSampleData(
          x: DateTime(2016, 3, 05),
          open: 90,
          high: 114.73,
          low: 108,
          close: 113.97),
      ChartSampleData(
          x: DateTime(2016, 3, 12),
          open: 89.29,
          high: 116.73,
          low: 112.49,
          close: 115.97),
      ChartSampleData(
          x: DateTime(2016, 3, 19),
          open: 90.8,
          high: 100.5,
          low: 90.59,
          close: 116.52),
      ChartSampleData(
          x: DateTime(2016, 3, 26),
          open: 85.52,
          high: 90.0166,
          low: 80.43,
          close: 115.83),
      ChartSampleData(
          x: DateTime(2016, 4, 05),
          open: 110,
          high: 114.73,
          low: 108,
          close: 113.97),
      ChartSampleData(
          x: DateTime(2016, 4, 12),
          open: 113.29,
          high: 116.73,
          low: 112.49,
          close: 115.97),
      ChartSampleData(
          x: DateTime(2016, 4, 19),
          open: 115.8,
          high: 117.5,
          low: 115.59,
          close: 116.52),
      ChartSampleData(
          x: DateTime(2016, 4, 26),
          open: 116.52,
          high: 118.0166,
          low: 115.43,
          close: 115.83),
      ChartSampleData(
          x: DateTime(2016, 5, 05),
          open: 110,
          high: 114.73,
          low: 108,
          close: 113.97),
      ChartSampleData(
          x: DateTime(2016, 5, 12),
          open: 113.29,
          high: 116.73,
          low: 112.49,
          close: 115.97),
      ChartSampleData(
          x: DateTime(2016, 5, 19),
          open: 115.8,
          high: 117.5,
          low: 115.59,
          close: 116.52),
      ChartSampleData(
          x: DateTime(2016, 5, 26),
          open: 116.52,
          high: 118.0166,
          low: 115.43,
          close: 115.83),
      ChartSampleData(
          x: DateTime(2016, 6, 05),
          open: 90,
          high: 100.73,
          low: 98,
          close: 99.97),
      ChartSampleData(
          x: DateTime(2016, 6, 12),
          open: 85.29,
          high: 88.73,
          low: 80.49,
          close: 80.97),
      ChartSampleData(
          x: DateTime(2016, 6, 19),
          open: 90.8,
          high: 104.5,
          low: 84.59,
          close: 116.52),
      ChartSampleData(
          x: DateTime(2016, 6, 26),
          open: 116.52,
          high: 118.0166,
          low: 115.43,
          close: 115.83),
      ChartSampleData(
          x: DateTime(2016, 7, 05),
          open: 110,
          high: 114.73,
          low: 108,
          close: 113.97),
      ChartSampleData(
          x: DateTime(2016, 7, 12),
          open: 113.29,
          high: 116.73,
          low: 112.49,
          close: 115.97),
      ChartSampleData(
          x: DateTime(2016, 7, 19),
          open: 115.8,
          high: 117.5,
          low: 115.59,
          close: 116.52),
      ChartSampleData(
          x: DateTime(2016, 7, 26),
          open: 116.52,
          high: 118.0166,
          low: 115.43,
          close: 115.83),
      ChartSampleData(
          x: DateTime(2016, 8, 05),
          open: 105,
          high: 107.73,
          low: 103,
          close: 108.97),
      ChartSampleData(
          x: DateTime(2016, 8, 12),
          open: 106.29,
          high: 108.73,
          low: 100.49,
          close: 108.97),
      ChartSampleData(
          x: DateTime(2016, 8, 19),
          open: 107.8,
          high: 108.5,
          low: 95.59,
          close: 108.52),
      ChartSampleData(
          x: DateTime(2016, 8, 26),
          open: 102.52,
          high: 103.0166,
          low: 100.43,
          close: 108.83),
      ChartSampleData(
          x: DateTime(2016, 9, 05),
          open: 110,
          high: 114.73,
          low: 108,
          close: 113.97),
      ChartSampleData(
          x: DateTime(2016, 9, 12),
          open: 113.29,
          high: 116.73,
          low: 112.49,
          close: 115.97),
      ChartSampleData(
          x: DateTime(2016, 9, 19),
          open: 115.8,
          high: 117.5,
          low: 115.59,
          close: 116.52),
      ChartSampleData(
          x: DateTime(2016, 9, 26),
          open: 116.52,
          high: 118.0166,
          low: 115.43,
          close: 115.83),
      ChartSampleData(
          x: DateTime(2016, 10, 05),
          open: 110,
          high: 114.73,
          low: 108,
          close: 113.97),
      ChartSampleData(
          x: DateTime(2016, 10, 12),
          open: 113.29,
          high: 116.73,
          low: 112.49,
          close: 115.97),
      ChartSampleData(
          x: DateTime(2016, 10, 19),
          open: 115.8,
          high: 117.5,
          low: 115.59,
          close: 116.52),
      ChartSampleData(
          x: DateTime(2016, 10, 26),
          open: 116.52,
          high: 118.0166,
          low: 115.43,
          close: 115.83),
      ChartSampleData(
          x: DateTime(2016, 11, 05),
          open: 110,
          high: 114.73,
          low: 108,
          close: 113.97),
      ChartSampleData(
          x: DateTime(2016, 11, 12),
          open: 113.29,
          high: 116.73,
          low: 112.49,
          close: 115.97),
      ChartSampleData(
          x: DateTime(2016, 11, 19),
          open: 115.8,
          high: 117.5,
          low: 115.59,
          close: 116.52),
      ChartSampleData(
          x: DateTime(2016, 11, 26),
          open: 116.52,
          high: 118.0166,
          low: 115.43,
          close: 115.83),
      ChartSampleData(
          x: DateTime(2016, 12, 05),
          open: 110,
          high: 114.73,
          low: 108,
          close: 113.97),
      ChartSampleData(
          x: DateTime(2016, 12, 12),
          open: 113.29,
          high: 116.73,
          low: 112.49,
          close: 115.97),
      ChartSampleData(
          x: DateTime(2016, 12, 19),
          open: 115.8,
          high: 117.5,
          low: 100.59,
          close: 116.52),
      ChartSampleData(
          x: DateTime(2016, 12, 26),
          open: 116.52,
          high: 118.0166,
          low: 115.43,
          close: 115.83)
    ];
  }
}

//? for historical data structure
class ChartSampleData {
  ChartSampleData({this.x, this.open, this.close, this.low, this.high});
  final DateTime? x;
  final num? open;
  final num? close;
  final num? low;
  final num? high;
}
