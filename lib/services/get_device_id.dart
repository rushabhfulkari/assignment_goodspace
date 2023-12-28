import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

import '../core/utils/constants.dart';

Future<String> getDeviceId() async {
  var deviceInfo = DeviceInfoPlugin();
  late String deviceId;

  if (Platform.isIOS) {
    var iosDeviceInfo = await deviceInfo.iosInfo;
    deviceId = iosDeviceInfo.identifierForVendor!;
    deviceType = 'ios';
  } else if (Platform.isAndroid) {
    var androidDeviceInfo = await deviceInfo.androidInfo;
    deviceId = androidDeviceInfo.id;
    deviceType = 'android';
  } else {
    deviceId = 'null';
  }
  return deviceId;
}
