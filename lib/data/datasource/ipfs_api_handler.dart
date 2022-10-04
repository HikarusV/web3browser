import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;

class IpfsHandler {
  static String baseUrl = 'http://192.168.88.97:8080/';

  static Future<String> getItems() async {
    try {
      final url =
          '${baseUrl}ipfs/QmNQ31WrGvNBhErUHcwE1LbQovMCobzNoEhQERQ1nyzV8e';
      final response = await http.get(Uri.parse(url));

      // response.headers

      String result = response.body.toString();
      // print(result);
      // Map<String, dynamic> jsonResponse = jsonDecode(response.body);

      // final items = UserItems.fromMap(jsonResponse);
      return result;
    } on SocketException catch (e) {
      return e.toString();
    }
  }
}

class ResponseData {
  String body = '';
  Map<String, String> headers = {};
}
