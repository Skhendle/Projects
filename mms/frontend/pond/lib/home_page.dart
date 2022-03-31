import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pond/upload_page.dart';
import 'package:pond/view_ponds.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

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
          Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(30, 0, 30, 0),
              child: ElevatedButton.icon(
                onPressed: () async {
                  await availableCameras().then(
                    (value) => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UploadPageWidget(
                          cameras: value,
                        ),
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.upload),
                label: const Text('Upload Pond'),
                style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 15),
                ),
              )),
          Padding(
              padding: EdgeInsetsDirectional.fromSTEB(30, 0, 30, 0),
              child: ElevatedButton.icon(
                onPressed: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ViewPondsWidget(),
                    ),
                  );
                },
                icon: const Icon(Icons.image_search),
                label: const Text('View Pond States'),
                style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 15),
                ),
              )),
        ],
      )),
    );
  }
}
