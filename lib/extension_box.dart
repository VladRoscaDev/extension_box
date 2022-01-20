import 'dart:async';

import 'package:flutter/services.dart';

class ExtensionBox {
  static const MethodChannel _channel = MethodChannel('extension_box');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
