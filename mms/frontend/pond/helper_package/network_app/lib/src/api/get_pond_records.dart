import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:convert';

import 'package:network_app/src/constants.dart';

DateFormat inputFormat = DateFormat('E, d MMM yyyy HH:mm:ss');

class PondModels {
  int? id;
  DateTime? created;
  String? description;
  String? rating;

  PondModels({
    required this.id,
    required this.created,
    required this.description,
    required this.rating,
  });

  PondModels.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        created = inputFormat.parse(json['created']),
        description = json['description'],
        rating = json['rating'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'created': created,
        'description': description,
        'rating': rating
      };
}

class GetPondRecordsAPI {
  Future<List<PondModels>> getRecords() async {
    final request = await http.get(
      Uri.parse('${serverUrl}get_pond_records'),
      headers: {'Content-Type': 'application/json'},
    ).timeout(Duration(seconds: 30));

    var response = jsonDecode(request.body);

    if (request.statusCode == 200) {
      List<PondModels> data = [];
      for (var item in response) {
        // print(item.toString());
        // print(item);
        data.add(PondModels.fromJson(item));
      }
      return data;
    } else {
      throw (response);
    }
  }
}
