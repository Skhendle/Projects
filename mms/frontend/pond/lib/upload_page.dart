import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:pond/responsive_view.dart';

class UploadPageWidget extends StatefulWidget {
  final List<CameraDescription>? cameras;
  const UploadPageWidget({
    Key? key,
    this.cameras,
  }) : super(key: key);

  @override
  _UploadPageWidgetState createState() => _UploadPageWidgetState();
}

class _UploadPageWidgetState extends State<UploadPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  late CameraController controller;
  XFile? pictureFile;

  @override
  void initState() {
    super.initState();
    controller = CameraController(widget.cameras![0], ResolutionPreset.max,
        imageFormatGroup: ImageFormatGroup.yuv420);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenInfo = ScreenReader().screenReader(context);
    if (!controller.value.isInitialized) {
      return const SizedBox(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          pictureFile = await controller.takePicture();
          setState(() {});
        },
        backgroundColor: const Color(0xFFFF5722),
        icon: const Icon(
          Icons.photo_camera,
        ),
        elevation: 8,
        label: Container(),
      ),
      body: screenInfo.deviceType == DeviceType.desktop
          ? Column(
              children: [
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: SizedBox(
                        height: double.infinity,
                        width: double.infinity,
                        child: CameraPreview(controller),
                      ),
                    ),
                  ),
                ),
                const Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: null,
                      child: Text('Send Picture'),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: SizedBox(
                          height: double.infinity,
                          width: double.infinity,
                          child: (pictureFile != null)
                              ? Image.network(
                                  pictureFile!.path,
                                  height: 200,
                                )
                              : const SizedBox.shrink()),
                    ),
                  ),
                )

                //Android/iOS
                // Image.file(File(pictureFile!.path)))
              ],
            )
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: SizedBox(
                      height: 400,
                      width: 400,
                      child: CameraPreview(controller),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: null,
                    child: Text('Send Picture'),
                  ),
                ),
                if (pictureFile != null)
                  Image.network(
                    pictureFile!.path,
                    height: 200,
                  )
                //Android/iOS
                // Image.file(File(pictureFile!.path)))
              ],
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
