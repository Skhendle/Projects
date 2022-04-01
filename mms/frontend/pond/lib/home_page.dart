import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pond/upload_page/upload_page.dart';
import 'package:pond/view_ponds/view_ponds.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  File? image;

  Future takePicture() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;

    final imageTemp = File(image.path);
    this.image = imageTemp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color(0xCF3D77A8),
      body: SafeArea(
          child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              flex: 3,
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/pond.png'),
                    fit: BoxFit.contain,
                  ),
                  shape: BoxShape.circle,
                ),
              )),
          Expanded(
            flex: 1,
            child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(30, 10, 30, 10),
                child: ElevatedButton.icon(
                  onPressed: () async {
                    await takePicture();

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UploadPageWidget(
                          image: image,
                        ),
                      ),
                    );

                  },
                  icon: const Icon(
                    Icons.upload,
                    size: 30,
                  ),
                  label: const Text(
                    'Upload Pond',
                    style: TextStyle(
                        fontFamily: 'lato',
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 15),
                  ),
                )),
          ),
          Expanded(
            child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(30, 20, 30, 20),
                child: ElevatedButton.icon(
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ViewPondsWidget(),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.image_search,
                    size: 30,
                  ),
                  label: const Text(
                    'View Pond States',
                    style: TextStyle(
                        fontFamily: 'lato',
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 15),
                  ),
                )),
          ),
        ],
      )),
    );
  }
}
