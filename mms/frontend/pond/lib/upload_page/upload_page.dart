// import 'dart:html';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:pond/responsive_view.dart';

class UploadPageWidget extends StatefulWidget {
  final File? image;
  const UploadPageWidget({
    Key? key,
    this.image,
  }) : super(key: key);

  @override
  _UploadPageWidgetState createState() => _UploadPageWidgetState();
}

class _UploadPageWidgetState extends State<UploadPageWidget> {
  // @override
  // void initState()  {
  // }

  // @override
  // void dispose() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text(
          "Upload Page",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: const Color(0xCF3D77A8),
      body: Column(
        children: [
          Expanded(
              flex: 4,
              child: Container(
                padding: const EdgeInsetsDirectional.fromSTEB(30, 25, 30, 10),
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
      ),
    );
  }
}
