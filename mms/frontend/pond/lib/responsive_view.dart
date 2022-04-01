import 'package:flutter/material.dart';

enum DeviceType { mobile, desktop }
enum ScreenSize { small, large }

class DeviceInfo {
  DeviceType deviceType;
  ScreenSize screenSize;

  DeviceInfo(this.deviceType, this.screenSize);
}

class ScreenReader {
  DeviceInfo screenReader(BuildContext context) {
    DeviceType deviceType;
    ScreenSize screenSize;

    if (MediaQuery.of(context).size.width < 720) {
      deviceType = DeviceType.mobile;
      (MediaQuery.of(context).size.width < 360)
          ? screenSize = ScreenSize.small
          : screenSize = ScreenSize.large;
    } else {
      deviceType = DeviceType.desktop;
      (MediaQuery.of(context).size.width < 1080)
          ? screenSize = ScreenSize.small
          : screenSize = ScreenSize.large;
    }
    return DeviceInfo(deviceType, screenSize);
  }
}
