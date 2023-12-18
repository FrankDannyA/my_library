import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_library/generated/codegen_loader.g.dart';
import 'package:my_library/utils/firebase_options.dart';
import 'package:my_library/utils/library_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    EasyLocalization(
      useOnlyLangCode: true,
      startLocale: const Locale('ru'),
      path: 'assets/translations',
      assetLoader: const CodegenLoader(),
      supportedLocales: const [
        Locale('en'),
        Locale('ru'),
      ],
      child: const LibraryApp(),
    ),
  );
}
