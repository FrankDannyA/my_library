import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:my_library/generated/locale_keys.g.dart';
import 'package:my_library/pages/ticket_login_page/view/widgets/text_field_decorated.dart';

class UserFieldWidget extends StatelessWidget {
  const UserFieldWidget({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.ageController,
    required this.passController,
  });

  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController ageController;
  final TextEditingController passController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Align(
        alignment: const Alignment(0.0, -0.5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFieldDecorated(
              title: LocaleKeys.full_mame.tr(),
              controller: nameController,
            ),
            const SizedBox(height: 10),
            TextFieldDecorated(
              title: LocaleKeys.mail.tr(),
              controller: emailController,
            ),
            const SizedBox(height: 10),
            TextFieldDecorated(
              title: LocaleKeys.age.tr(),
              controller: ageController,
            ),
            const SizedBox(height: 10),
            TextFieldDecorated(
              isPass: true,
              title: LocaleKeys.pass.tr(),
              controller: passController,
            ),
          ],
        ),
      ),
    );
  }
}
