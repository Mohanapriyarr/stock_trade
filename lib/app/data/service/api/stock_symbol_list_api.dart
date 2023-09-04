import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import '../../../module/model/stock_symbol_list_model.dart';
import '../../logs/log.dart';
import '../helper/common_header.dart';
import '../helper/config_strings.dart';

Future<StockSymbolListModel?> stockSymbolListApi(String symbol) async {
  Uri url = Uri.parse('$BASE_URL/quote?symbol=$symbol&token=$API_TOKEN');
  var clients = http.Client();

  Map<String, String> headers = await CommonHeader.commonHeader();

  try {
    var response = await clients.get(url, headers: headers);

    Log.info(
        info: 'stock symbol list api ~ status code ${response.statusCode}');
    Log.info(info: 'stock symbol list api ~ response body ${response.body}');

    if (response.statusCode == 200) {
      final StockSymbolListModel decodedRes =
          stockSymbolListFromJson(response.body);
      Log.info(
          info:
              'stock symbol list api ~ change percentage ~ ${decodedRes.changePercentage}');
      return decodedRes;
    } else {
      Log.info(info: 'Invalid details');
      return null;
    }
  } on PlatformException catch (e) {
    Log.info(info: 'stock symbol list api ~ platform exception ~ $e');
    return null;
  } on http.ClientException catch (e) {
    Log.info(info: 'stock symbol list api ~ platform exception ~ $e');
    return null;
  } catch (e) {
    Log.info(info: 'stock symbol list api ~ platform exception ~ $e');
    return null;
  } finally {
    clients.close();
  }
}
