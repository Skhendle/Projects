// import 'dart:html';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:pond/responsive_view.dart';
import 'package:image_whisperer/image_whisperer.dart';

class UploadPageWidget extends StatefulWidget {
  File? image;
  UploadPageWidget({
    Key? key,
    this.image,
  }) : super(key: key);

  @override
  _UploadPageWidgetState createState() => _UploadPageWidgetState();
}

class _UploadPageWidgetState extends State<UploadPageWidget> {
  //late BlobImage blobImage;
  // final image = NetworkImage(blobImage.url);

  // @override
  // void initState()  {
  //   //blobImage = BlobImage( widget.image!.readAsBytes());
  // }

  // @override
  // void dispose() {}

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 4,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: (kIsWeb)
                  ? Image.network(widget.image!.path)
                  : Image.file(File(widget.image!.path)),
            )),
        Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.green,
            )),
        Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.yellow,
            ))
      ],
    );
  }
}
