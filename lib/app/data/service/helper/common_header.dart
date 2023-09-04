class CommonHeader {
  //? use commonHeaderCall on all api service
  static Future<Map<String, String>> commonHeader() async {
    Map<String, String> headers = {'Content-Type': 'application/json'};
    return headers;
  }
}
