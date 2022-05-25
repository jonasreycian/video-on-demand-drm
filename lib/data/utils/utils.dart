import 'dart:io';
import 'dart:math';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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

  static Color generateRandomColor() =>
      Colors.primaries[Random().nextInt(Colors.primaries.length)];

  static String netflixDurationFormat(int runTime) {
    Duration duration = Duration(milliseconds: runTime);
    var components = <String>[];
    var days = duration.inDays;
    if (days != 0) {
      components.add('${days}d ');
    }
    var hours = duration.inHours % 24;
    if (hours != 0) {
      components.add('${hours}h ');
    }
    var minutes = duration.inMinutes % 60;
    if (minutes != 0) {
      components.add('${minutes}m ');
    }
    var seconds = duration.inSeconds % 60;
    var centiseconds = (duration.inMilliseconds % 1000) ~/ 10;
    if (components.isEmpty || seconds != 0 || centiseconds != 0) {
      components.add('$seconds');
      if (centiseconds != 0) {
        components.add('.');
        components.add(centiseconds.toString().padLeft(2, '0'));
      }
      components.add('s');
    }
    return components.join();
  }
}
