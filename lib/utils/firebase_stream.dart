import 'package:flutter/material.dart';
import 'package:my_library/pages/library_page/view/library_screen.dart';
import 'package:my_library/pages/ticket_login_page/repo/auth_firebase.dart';
import 'package:my_library/pages/ticket_login_page/view/ticket_login_screen.dart';

class FirebaseStream extends StatelessWidget {
  const FirebaseStream({Key? key}) : super(key: key);

  static get nameRoute => '/';

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: AuthFirebase().authStateChanges,
      builder: (ctx, snap) {
        if (snap.hasData) {
          return const LibraryScreen();
        } else {
          return TicketLoginScreen();
        }
      },
    );
  }
}
