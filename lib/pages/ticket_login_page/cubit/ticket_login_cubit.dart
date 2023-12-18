import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_library/pages/ticket_login_page/cubit/ticket_login_state.dart';
import 'package:my_library/pages/ticket_login_page/repo/auth_firebase.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TicketLoginCubit extends Cubit<TicketLoginState> {
  TicketLoginCubit() : super(const TicketLoginInitial());

  Future<void> login({
    required String name,
    required String email,
    required String age,
    required String pass,
  }) async {
    emit(const TicketLoginLoading());

    ///init property
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final authFirebase = AuthFirebase();

    ///check user state
    try {
      await prefs.setString('name', name);
      await prefs.setString('email', email);
      await prefs.setString('age', age);
      await prefs.setString('pass', pass);

      authFirebase.signInWithEmailAndPassword(
        email: email,
        pass: pass,
      );
      emit(const TicketLoginLoaded());
    } catch (e) {
      emit(const TicketLoginError());
    }
  }

  Future<void> register({
    required String name,
    required String email,
    required String age,
    required String pass,
  }) async {
    emit(const TicketLoginLoading());

    ///init property
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final authFirebase = AuthFirebase();

    try {
      await prefs.setString('name', name);
      await prefs.setString('email', email);
      await prefs.setString('age', age);
      await prefs.setString('pass', pass);
      await authFirebase.createWithEmailAndPassword(
        email: email,
        pass: pass,
      );

      emit(const TicketLoginLoaded());
    } catch (e) {
      emit(const TicketLoginError());
    }
  }
}
