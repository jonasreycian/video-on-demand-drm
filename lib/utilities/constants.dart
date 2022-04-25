import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Constants {
  static String widevineVideoUrl =
      "https://d22bamm3lcnbm1.cloudfront.net/745e74be-d9f0-46d7-9547-d843554f6c13/hls/Enchanted.m3u8";
  static String widevineLicenseUrl =
      "https://proxy.uat.widevine.com/proxy?provider=widevine_test";
}

mixin PortraitModeMixin on StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _portraitModeOnly();
    return Container();
  }
}

/// Forces portrait-only mode on a specific screen
/// Use this Mixin in the specific screen you want to
/// block to portrait only mode.
///
/// Call `super.build(context)` in the State's build() method
/// and `super.dispose();` in the State's dispose() method
mixin PortraitStatefulModeMixin<T extends StatefulWidget> on State<T> {
  @override
  Widget build(BuildContext context) {
    _portraitModeOnly();
    return Container();
  }

  @override
  void dispose() {
    _enableRotation();
  }
}

/// blocks rotation; sets orientation to: portrait
void _portraitModeOnly() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

void _enableRotation() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
}
