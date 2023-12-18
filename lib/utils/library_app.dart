import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:my_library/utils/firebase_stream.dart';
import 'package:my_library/utils/utils.dart';

class LibraryApp extends StatelessWidget {
  const LibraryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: Utils.titleApp,
      theme: Utils.themeData,
      routes: Utils.routes,
      initialRoute: FirebaseStream.nameRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
