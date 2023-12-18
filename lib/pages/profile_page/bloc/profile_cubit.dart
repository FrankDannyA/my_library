import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_library/pages/profile_page/bloc/profile_state.dart';
import 'package:my_library/pages/profile_page/repo/models/user.dart';
import 'package:my_library/pages/ticket_login_page/repo/auth_firebase.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(const ProfileInitial());

  Future<void> logout() async {
    emit(const ProfileState.loading());
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final authFirebase = AuthFirebase();
    try {
      await authFirebase.signOut();
      prefs.setString('name', '');
      prefs.setString('email', '');
      prefs.setString('age', '');
      prefs.setString('pass', '');
      emit(const ProfileState.loaded(user: null));
    } catch (e) {
      emit(const ProfileState.error());
    }
  }

  Future<void> getUserData() async {
    emit(const ProfileState.loading());
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final name = prefs.get('name') as String;
      final email = prefs.get('email') as String;
      final age = prefs.get('age') as String;

      final user = User(name: name, age: age, email: email);

      emit(ProfileState.loaded(user: user));
    } catch (e) {
      emit(const ProfileState.error());
    }
  }

  Future<void> editUser({
    required String name,
    required String age,
  }) async {
    emit(const ProfileState.loading());
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('name', name);
      prefs.setString('age', age);

      final emailStorage = prefs.get('email') as String;
      final ageStorage = prefs.get('age') as String;
      final nameStorage = prefs.get('name') as String;
      emit(
        ProfileState.loaded(
          user: User(
            age: ageStorage,
            name: nameStorage,
            email: emailStorage,
          ),
        ),
      );
    } catch (e) {
      emit(const ProfileState.error());
    }
  }
}
