import 'dart:io';

import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../device/constants.dart';

class BetterPlayerScreen extends StatefulWidget {
  BetterPlayerScreen(
    this.content, {
    Key? key,
  }) : super(key: key);

  static const String routeName = '/better_player_screen';
  final String content;

  @override
  State<BetterPlayerScreen> createState() => _BetterPlayerScreenState();
}

class _BetterPlayerScreenState extends State<BetterPlayerScreen> {
  late BetterPlayerController _widevineController;

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);

    BetterPlayerConfiguration betterPlayerConfiguration =
        BetterPlayerConfiguration(
      fit: BoxFit.cover,
      autoPlay: true,
      fullScreenByDefault: true,
      autoDetectFullscreenDeviceOrientation: true,
      autoDetectFullscreenAspectRatio: true,
      autoDispose: true,
      allowedScreenSleep: false,
      useRootNavigator: true,
    );

    _widevineController = BetterPlayerController(betterPlayerConfiguration);
    BetterPlayerDataSource _widevineDataSource = BetterPlayerDataSource(
      BetterPlayerDataSourceType.network,
      widget.content,
      drmConfiguration: BetterPlayerDrmConfiguration(
        drmType: Platform.isIOS
            ? BetterPlayerDrmType.fairplay
            : BetterPlayerDrmType.widevine,
        licenseUrl: Constants.widevineLicenseUrl,
        headers: {"Test": "Test2"},
      ),
    );
    _widevineController.setupDataSource(_widevineDataSource);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Positioned(
            top: MediaQuery.of(context).viewPadding.top,
            left: 0,
            child: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: Icon(Icons.arrow_back),
            ),
          ),
          BetterPlayer(controller: _widevineController),
        ],
      ),
    );
  }

  @override
  void dispose() {
    print(_widevineController.toString());
    _widevineController.dispose(forceDispose: true);
    super.dispose();
  }
}
