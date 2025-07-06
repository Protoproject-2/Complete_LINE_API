import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_line_sdk/flutter_line_sdk.dart';

import 'src/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  LineSDK.instance.setup('2007470455').then((_) {
    if (kDebugMode) {
      print('LineSDK Prepared');
    }
  });
  runApp(const App());
}
