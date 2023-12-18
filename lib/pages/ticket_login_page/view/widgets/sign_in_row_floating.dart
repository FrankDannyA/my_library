import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:my_library/generated/locale_keys.g.dart';

class SignInRow extends StatelessWidget {
  const SignInRow({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.ageController,
    required this.passController,
    required this.loginPressed,
    required this.registerPressed,
  });

  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController ageController;
  final TextEditingController passController;

  final VoidCallback loginPressed;
  final VoidCallback registerPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: loginPressed,
          child: Text(LocaleKeys.login.tr()),
        ),
        ElevatedButton(
          onPressed: registerPressed,
          child: Text(LocaleKeys.register.tr()),
        ),
      ],
    );
  }
}
