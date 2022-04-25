import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';

import '../models/content_model.dart';

class BetterPlayerProvider with ChangeNotifier {
  late BetterPlayerController _widevineController;

  late Content _currentContent;
  Content get currentContent => _currentContent;
  setCurrentContent(value) {
    _currentContent = value;
    notifyListeners();
  }

  final BetterPlayerConfiguration _betterPlayerConfiguration =
      BetterPlayerConfiguration(
    // aspectRatio: 16 / 9,
    fit: BoxFit.cover,
    autoPlay: true,
    fullScreenByDefault: true,
    autoDetectFullscreenDeviceOrientation: true,
    autoDetectFullscreenAspectRatio: true,
    autoDispose: true,
  );

  // Getters
  BetterPlayerConfiguration get betterPlayerConfiguration =>
      _betterPlayerConfiguration;
  BetterPlayerController get widevineController => _widevineController;
}
