import 'package:flutter/widgets.dart';

import '../../data/resources/image_resources.dart';
import '../../data/service/api/stock_data_list_api.dart';
import '../../data/service/api/stock_symbol_list_api.dart';
import '../model/stock_data_list_model.dart';
import '../model/stock_symbol_list_model.dart';

class StockListProvider extends ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;

  final List _symbols = [];
  List get symbols => _symbols;

  List<StockSymbolListModel> _stockSymbolList = [];
  List<StockSymbolListModel> get stockSymbolList => _stockSymbolList;

  List<StockDataListModel> _stockDataList = [];
  List<StockDataListModel> get stockDataList => _stockDataList;

  StockListProvider() {
    initSate();
  }

  Future<void> initSate() async {
    setLoading(true);

    //? type of symbols and image pat set for price and percentage load from api
    await setSymbols(['AAPL', 'GOOGL', 'MSFT', 'TSLA', 'AMZN'],
        [APPLE, GOOGLE, MICROSOFT, TESLA, AMAZON]);

    await fetchStockSymbol();
    await fetchStockData();
    setLoading(false);
  }

  //? if refresh the screen call
  Future<void> refreshStockList() async {
    _stockSymbolList = [];
    await setSymbols(['AAPL', 'GOOGL', 'MSFT', 'TSLA', 'AMZN'],
        [APPLE, GOOGLE, MICROSOFT, TESLA, AMAZON]);
    await fetchStockSymbol();
  }

  //? loader
  void setLoading(bool loadingStatus) {
    _loading = loadingStatus;
    notifyListeners();
  }

  //? symbol and image path append from hardcode value
  Future<void> setSymbols(List<String> items, List<String> imagePath) async {
    for (int i = 0; i < items.length; i++) {
      _symbols.add({'symbolName': items[i], 'symbolPath': imagePath[i]});
    }
    notifyListeners();
  }

  //? symbol type length based to fetch data from api
  Future<void> fetchStockSymbol() async {
    for (int i = 0; i < symbols.length; i++) {
      final data = await stockSymbolListApi(symbols[i]['symbolName']);
      if (data == null) return;
      _stockSymbolList.add(data);
      notifyListeners();
    }
  }

  //? fetch stock data dynamically from api
  Future<void> fetchStockData() async {
    final data = await dataSymbolListApi();
    if (data == null) return;
    _stockDataList = data;
  }
}
