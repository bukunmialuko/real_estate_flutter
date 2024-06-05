import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:superapp/app/app.dart';
import 'package:superapp/bootstrap.dart';

Future<void> main() async {
  return runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    await setPreferredOrientations();

    await bootstrap(() => const App());
  }, (error, stackTrace) {
    debugPrint(stackTrace.toString());
    debugPrint(error.toString());
  });
}

Future<void> setPreferredOrientations() {
  return SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
}
