import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pond/responsive_view.dart';
import 'package:pond/upload_page/bloc/upload_bloc.dart';
import 'package:pond/upload_page/models/image_data.dart';
import 'package:pond/upload_page/upload_page.dart';
import 'package:pond/view_ponds/view_ponds.dart';

import 'dart:convert';
import 'dart:typed_data';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  File? image;
  ImageData? imageData;

  Future takePicture() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;

    Uint8List data = await image.readAsBytes();
    List<int> list = data.cast();
    final imageTemp = File(image.path);
    this.image = imageTemp;
    imageData = ImageData(fileName: image.name, list: list);
  }

  @override
  Widget build(BuildContext context) {
    var screenReader = ScreenReader().screenReader(context);
    var btnPadding = EdgeInsetsDirectional.fromSTEB(
        (screenReader.deviceType == DeviceType.desktop
            ? (screenReader.screenSize == ScreenSize.large ? 450 : 250)
            : 30),
        (screenReader.deviceType == DeviceType.desktop ? 50 : 10),
        (screenReader.deviceType == DeviceType.desktop
            ? (screenReader.screenSize == ScreenSize.large ? 450 : 250)
            : 30),
        (screenReader.deviceType == DeviceType.desktop ? 50 : 10));
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
                padding: btnPadding,
                child: ElevatedButton.icon(
                  onPressed: () async {
                    await takePicture();
                    // if (kDebugMode) {
                    //   print(await image!.readAsBytes());
                    // }

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BlocProvider(
                          create: (context) => UploadBloc(),
                          child: BlocListener<UploadBloc, UploadState>(
                            listener: (context, UploadState state) {
                              if (state is UploadResponse) {
                                // Navigate to home page
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    duration: const Duration(seconds: 5),
                                    content: Text(
                                      state.message,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: state.success
                                              ? Colors.white
                                              : Colors.red),
                                    ),
                                  ),
                                );
                                Navigator.pop(context);
                              }
                            },
                            child: UploadPageWidget(
                              image: image,
                              imageData: imageData,
                            ),
                          ),
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
                padding: btnPadding,
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
