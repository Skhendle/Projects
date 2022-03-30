import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UploadPageWidget extends StatefulWidget {
  const UploadPageWidget({Key? key}) : super(key: key);

  @override
  _UploadPageWidgetState createState() => _UploadPageWidgetState();
}

class _UploadPageWidgetState extends State<UploadPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color(0xCE3D77A8),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await Future.delayed(const Duration(milliseconds: 1000));
        },
        backgroundColor: const Color(0xFFFF5722),
        icon: const Icon(
          Icons.photo_camera,
        ),
        elevation: 8,
        label: Container(),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                // borderColor: Colors.transparent,
                // borderRadius: 30,
                // borderWidth: 1,
                // buttonSize: 60,
                icon: const Icon(
                  Icons.arrow_back_sharp,
                  color: Colors.black,
                  size: 30,
                ),
                onPressed: () async {
                  Navigator.pop(context);
                },
              ),
              Container(
                width: double.infinity,
                height: 400,
                decoration: const BoxDecoration(
                  color: Color(0xFFEEEEEE),
                ),
                child: Image.network(
                  'https://picsum.photos/seed/218/600',
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget test() => Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xCE3D77A8),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            await Future.delayed(const Duration(milliseconds: 1000));
          },
          backgroundColor: const Color(0xFFFF5722),
          icon: const Icon(
            Icons.photo_camera,
          ),
          elevation: 8,
          label: Container(),
        ),
        body: SafeArea(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  // borderColor: Colors.transparent,
                  // borderRadius: 30,
                  // borderWidth: 1,
                  // buttonSize: 60,
                  icon: const Icon(
                    Icons.arrow_back_sharp,
                    color: Colors.black,
                    size: 30,
                  ),
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                ),
                Container(
                  width: double.infinity,
                  height: 400,
                  decoration: const BoxDecoration(
                    color: Color(0xFFEEEEEE),
                  ),
                  child: Image.network(
                    'https://picsum.photos/seed/218/600',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
