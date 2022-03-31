import 'package:network_app/network_app.dart';

void main() async {
  // var getRepo = GetPondRecords();
  // var data = await getRepo.getRecords();
  // print(data);

  var ratePond = RatePond();
  var data = await ratePond.getRecords(2, "Good");
  print(data);

//   Directory current = Directory.current;
//   String path = current.path + "/PP.jpeg";
//   final file = File(path);

//   var stream = http.ByteStream(DelegatingStream.typed(file.openRead()));
//   // get file length
//   var length = await file.length();

//   var uri = Uri.parse("http://192.168.8.102:5000/add_pond");

//   // create multipart request
//   var request = http.MultipartRequest("POST", uri);

//   // multipart that takes file
//   var multipartFile =
//       http.MultipartFile('file', stream, length, filename: basename(file.path));

//   // add file to multipart
//   request.files.add(multipartFile);
// //  var inputData = {'description': 'Give a desctriction of the image'};
//   request.fields['description'] = 'Give a desctriction of the image';

//   // request.fields.addAll(jsonEncode());

//   // send
//   var response = await request.send();
//   print(response.statusCode);

//   // listen for response
//   response.stream.transform(utf8.decoder).listen((value) {
//     print(value);
//   });
}



// Future<File> getImageFileFromAssets(String path) async {
//   final byteData = await rootBundle.load('assets/$path');
//   final file = File('${(await getTemporaryDirectory()).path}/$path');
//   await file.writeAsBytes(byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
//   return file;
// }
// File f = await getImageFileFromAssets('images/myImage.jpg');