import 'package:my_library/pages/library_page/view/library_screen.dart';
import 'package:my_library/pages/profile_page/view/profile_screen.dart';
import 'package:my_library/pages/qr_page/view/qr_screen.dart';
import 'package:my_library/pages/story_page/view/story_screen.dart';
import 'package:my_library/pages/ticket_login_page/view/ticket_login_screen.dart';
import 'package:my_library/utils/firebase_stream.dart';
import 'package:flutter/material.dart';

class Utils {
  ///Theme data
  static ThemeData get themeData => ThemeData(
        ///
        primaryColor: Colors.brown,
        scaffoldBackgroundColor: Colors.brown.shade50,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
        useMaterial3: true,

        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.brown,
            letterSpacing: 1.5,
            fontSize: 18,
          ),
        ),

        ///
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(size: 36),
          titleTextStyle: const TextStyle(
            fontWeight: FontWeight.w700,
            color: Colors.brown,
            letterSpacing: 1.5,
            fontSize: 24,
          ),
          backgroundColor: Colors.brown.shade200,
        ),

        ///
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0), // Скругление углов
                side: BorderSide(color: Colors.brown.shade200), // Цвет бордера
              ),
            ),
          ),
        ),
      );

  ///Routes
  static Map<String, WidgetBuilder> get routes => {
        FirebaseStream.nameRoute: (context) => const FirebaseStream(),
        TicketLoginScreen.nameRoute: (context) => TicketLoginScreen(),
        QrScreen.nameRoute: (context) => const QrScreen(),
        ProfileScreen.nameRoute: (context) => ProfileScreen(),
        LibraryScreen.nameRoute: (context) => const LibraryScreen(),
        StoryScreen.nameRoute: (context) => const StoryScreen(),
      };

  ///Title App
  static get titleApp => 'Моя Библиотека';
}
