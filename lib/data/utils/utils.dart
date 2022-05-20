import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';

class Utils {
  static Future<String> getDeviceName() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (kIsWeb) return (await deviceInfo.webBrowserInfo).userAgent ?? 'Unknown';
    if (Platform.isAndroid) {
      return (await deviceInfo.androidInfo).model ?? 'Unknown';
    }
    if (Platform.isIOS) return (await deviceInfo.iosInfo).name ?? 'Unknown';
    if (Platform.isWindows) return Future.value('Windows');
    if (Platform.isLinux) return Future.value('Linux');
    if (Platform.isMacOS) return Future.value('MacOS');
    return Future.value('Unknown');
  }
}
