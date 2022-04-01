import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:network_app/src/constants.dart';
import 'package:path/path.dart';
import 'package:async/async.dart';

class AddPondAPI {
  Future<String> addPondRecord(File file, String description) async {
    var stream = http.ByteStream(DelegatingStream.typed(file.openRead()));
    // get file length
    var length = await file.length();
    var uri = Uri.parse('${serverUrl}add_pond');

    // create multipart request && multipart that takes file
    var request = http.MultipartRequest("POST", uri);
    var multipartFile = http.MultipartFile('file', stream, length,
        filename: basename(file.path));

    // add file to multipart
    request.files.add(multipartFile);
    request.fields['description'] = description;
    var response = await request.send();

    // print(response.statusCode);

    if (response.statusCode == 201) {
      return "Upload Successful";
    } else {
      return "Upload Unsuccessful";
    }
  }
}
