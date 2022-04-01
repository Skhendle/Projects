import 'dart:io';
import 'dart:async';
import 'package:network_app/network_app.dart';
import 'package:intl/intl.dart';

// import 'package:http/http.dart' as http;
// import 'package:path/path.dart';
// import 'package:async/async.dart';
// import 'dart:io';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

void main() async {
  var getRepo = GetPondRecordsAPI();
  var data = await getRepo.getRecords();
  for (var item in data) {
    print(item.id);
    print(item.description);
    print(item.rating);
    // String dateStart = '22-04-2021 05:57:58 PM';
    // DateFormat inputFormat = DateFormat('E, d MMM yyyy HH:mm:ss');
    // DateTime input = inputFormat.parse(item.created!);
    // print(input);
    print(item.created!);
    print('----');
  }

  // var ratePond = RatePondAPI();
  // var ratePondData = await ratePond.getRecords(2, "Good");
  // print(ratePondData);

  // Directory current = Directory.current;
  // String path = current.path + "/PP.jpeg";
  // final file = File(path);

  // var addPond = AddPondAPI();
  // var addPondData = await addPond.addPondRecord(file, "Good");
  // print(addPondData);
}



// Future<File> getImageFileFromAssets(String path) async {
//   final byteData = await rootBundle.load('assets/$path');
//   final file = File('${(await getTemporaryDirectory()).path}/$path');
//   await file.writeAsBytes(byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
//   return file;
// }
// File f = await getImageFileFromAssets('images/myImage.jpg');