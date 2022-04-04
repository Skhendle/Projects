import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:network_app/src/constants.dart';

class AddPondAPI {
  Future<String> addPondRecord(
      List<int> list, String fileName, String description) async {
    var inputData = {
      'list': list,
      'fileName': fileName.toLowerCase(),
      'description': description,
    };

    final request = await http
        .post(Uri.parse('${serverUrl}add_pond'),
            headers: {
              // 'Content-Type': 'application/json',
              "Access-Control-Allow-Origin": "*"
            },
            body: jsonEncode(inputData))
        .timeout(Duration(seconds: 30))
        .catchError((onError) {
      throw (onError.toString());
    });

    // var response = jsonDecode(request.body);

    if (request.statusCode == 201) {
      var data = jsonDecode(request.body);
      return data;
    } else {
      throw (request.body);
    }
  }
}
