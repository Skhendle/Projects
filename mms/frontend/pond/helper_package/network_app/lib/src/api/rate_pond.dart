import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:network_app/src/constants.dart';

import 'get_pond_records.dart';

class RatePondAPI {
  Future<String> getRecords(int pondId, String rating) async {
    var inputData = {
      'id': pondId,
      'rating': rating,
    };
    final request = await http
        .post(Uri.parse('${serverUrl}rate_pond'),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode(inputData))
        .timeout(Duration(seconds: 30));

    var response = jsonDecode(request.body);

    if (request.statusCode == 201) {

      return "Rond Rated";
    } else {
      throw (response);
    }
  }
}
