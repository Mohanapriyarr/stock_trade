import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import '../../../module/model/stock_profile_model.dart';
import '../../logs/log.dart';
import '../helper/common_header.dart';
import '../helper/config_strings.dart';

Future<StockProfileModel?> stockProfileApi({required String symbol}) async {
  Uri url =
      Uri.parse('$BASE_URL/stock/profile2?symbol=$symbol&token=$API_TOKEN');
  var clients = http.Client();

  Map<String, String> headers = await CommonHeader.commonHeader();

  Log.info(info: 'stock profile api ~ url $url');
  try {
    var response = await clients.get(url, headers: headers);

    Log.info(info: 'stock profile api ~ status code ${response.statusCode}');
    Log.info(info: 'stock profile api ~ response body ${response.body}');

    if (response.statusCode == 200) {
      final StockProfileModel decodedRes =
          stockProfileModelFromJson(response.body);

      return decodedRes;
    } else {
      Log.info(info: 'Invalid details');
      return null;
    }
  } on PlatformException catch (e) {
    Log.info(info: 'stock profile api ~ platform exception ~ $e');
    return null;
  } on http.ClientException catch (e) {
    Log.info(info: 'stock profile api ~ platform exception ~ $e');
    return null;
  } catch (e) {
    Log.info(info: 'stock profile api ~ platform exception ~ $e');
    return null;
  } finally {
    clients.close();
  }
}
