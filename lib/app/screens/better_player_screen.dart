import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../device/constants.dart';
import '../../domain/entities/content.dart';
import '../app_constant.dart';

// ignore: must_be_immutable
class BetterPlayerScreen extends StatefulWidget {
  BetterPlayerScreen(
    this.content, {
    Key? key,
  }) : super(key: key);

  static const String routeName = '/better_player_screen';
  final Content content;

  @override
  State<BetterPlayerScreen> createState() => _BetterPlayerScreenState();
}

class _BetterPlayerScreenState extends State<BetterPlayerScreen> {
  late BetterPlayerController _widevineController;
  late BetterPlayerController _tokenController;

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);

    BetterPlayerConfiguration betterPlayerConfiguration = BetterPlayerConfiguration(
      fit: BoxFit.cover,
      autoPlay: true,
      fullScreenByDefault: true,
      autoDetectFullscreenDeviceOrientation: true,
      autoDetectFullscreenAspectRatio: true,
      autoDispose: true,
    );

    BetterPlayerDataSource _tokenDataSource = BetterPlayerDataSource(
      BetterPlayerDataSourceType.network,
      Constants.tokenEncodedHlsUrl,
      videoFormat: BetterPlayerVideoFormat.hls,
      drmConfiguration:
          BetterPlayerDrmConfiguration(drmType: BetterPlayerDrmType.token, token: Constants.tokenEncodedHlsToken),
    );
    _tokenController = BetterPlayerController(betterPlayerConfiguration);
    _tokenController.setupDataSource(_tokenDataSource);

    _widevineController = BetterPlayerController(betterPlayerConfiguration);
    BetterPlayerDataSource _widevineDataSource = BetterPlayerDataSource(
      BetterPlayerDataSourceType.network,
      widget.content.videoUrl!,
      drmConfiguration: BetterPlayerDrmConfiguration(
        drmType: BetterPlayerDrmType.widevine,
        licenseUrl: AppConstant.wideVineLicenseUrl,
        headers: {"header": "value"},
      ),
    );
    _widevineController.setupDataSource(_widevineDataSource);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BetterPlayer(controller: _widevineController);
  }

  @override
  void dispose() {
    print(_widevineController.toString());
    _widevineController.dispose();
    _tokenController.dispose();
    super.dispose();
  }
}
