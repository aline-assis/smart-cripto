import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:smart_finance/models/currency.dart';

class CryptoApi {
  static final _key = 'a0fad1d9917a926756e3b5afd75b041b76cbe3e1';

  static Future<List<Currency>> getCurrencies() async {
    final url =
        'https://api.nomics.com/v1/currencies/ticker?key=a0fad1d9917a926756e3b5afd75b041b76cbe3e1';

    final response = await http.get(Uri.parse(url));
    final body = json.decode(response.body) as List;
    //   final userdata = List<dynamic>.from(
    //   data.map<dynamic>(
    //     (dynamic item) => response.body,
    //   ),
    // );

    return body.map((item) => Currency.fromJson(item)).toList();
  }
}
