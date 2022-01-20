import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:extension_box/extension_box.dart';
export 'package:extension_box/extensions/extension_box.dart';

void main() {
  const MethodChannel channel = MethodChannel('extension_box');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await ExtensionBox.platformVersion, '42');
  });
}
