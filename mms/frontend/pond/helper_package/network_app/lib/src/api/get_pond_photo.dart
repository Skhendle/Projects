import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:network_app/src/constants.dart';

import 'get_pond_records.dart';
import 'package:intl/intl.dart';

class GetPondPhotoAPI {
  Future<PondModels> getPhoto(int pondId, String rating) async {
    var inputData = {
      'id': pondId,
      'rating': rating,
    };
    final request = await http
        .post(Uri.parse('${serverUrl}rate_pond'),
            headers: {
              'Content-Type': 'application/json',
              'Access-Control-Allow-Origin': '*'
            },
            body: jsonEncode(inputData))
        .timeout(Duration(seconds: 30))
        .catchError((onError) {
          throw(onError.toString());
        });

    var response = jsonDecode(request.body);

    if (request.statusCode == 200) {
      DateFormat inputFormat = DateFormat('E, d MMM yyyy HH:mm:ss');
      PondModels data = PondModels(
          id: response['id'],
          created: inputFormat.parse(response['created']),
          description: response['description'],
          rating: response['rating']);
      return data;
    } else {
      throw (response);
    }
  }
}
