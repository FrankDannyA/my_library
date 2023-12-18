import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_library/generated/locale_keys.g.dart';
import 'package:my_library/pages/library_page/view/library_screen.dart';
import 'package:my_library/pages/story_page/view/widgets/actual_widget.dart';
import 'package:my_library/pages/ticket_login_page/cubit/ticket_login_cubit.dart';
import 'package:my_library/pages/ticket_login_page/cubit/ticket_login_state.dart';
import 'package:my_library/pages/ticket_login_page/view/widgets/sign_in_row_floating.dart';
import 'package:my_library/pages/ticket_login_page/view/widgets/user_field_widget.dart';

class TicketLoginScreen extends StatefulWidget {
  TicketLoginScreen({Key? key}) : super(key: key);

  static get nameRoute => 'ticket_login';

  @override
  State<TicketLoginScreen> createState() => _TicketLoginScreenState();
}

class _TicketLoginScreenState extends State<TicketLoginScreen> {
  final cubit = TicketLoginCubit();

  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController ageController = TextEditingController();

  final TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: Scaffold(
        appBar: AppBar(
          title: Text(LocaleKeys.reader_ticket.tr()),
          actions: [
            IconButton(
              onPressed: () {
                final loc = context.locale;
                if (loc == const Locale('ru')) {
                  context.setLocale(const Locale('en'));
                  setState(() {});
                } else {
                  context.setLocale(const Locale('ru'));
                  setState(() {});
                }
              },
              icon: const Icon(Icons.language),
            ),
          ],
        ),
        body: BlocBuilder<TicketLoginCubit, TicketLoginState>(
          bloc: cubit,
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  const ActualWidget(),
                  const SizedBox(height: 64),
                  UserFieldWidget(
                    nameController: nameController,
                    emailController: emailController,
                    ageController: ageController,
                    passController: passController,
                  ),
                ],
              ),
            );
          },
        ),
        bottomNavigationBar: BlocBuilder<TicketLoginCubit, TicketLoginState>(
          builder: (context, state) => SignInRow(
            nameController: nameController,
            emailController: emailController,
            ageController: ageController,
            passController: passController,
            loginPressed: () async {
              await context.read<TicketLoginCubit>().login(
                    name: nameController.text,
                    email: emailController.text,
                    age: ageController.text,
                    pass: passController.text,
                  );
              // ignore: use_build_context_synchronously
              Navigator.of(context)
                  .pushReplacementNamed(LibraryScreen.nameRoute);
            },
            registerPressed: () async {
              await context.read<TicketLoginCubit>().register(
                    name: nameController.text,
                    email: emailController.text,
                    age: ageController.text,
                    pass: passController.text,
                  );
              // ignore: use_build_context_synchronously
              Navigator.of(context)
                  .pushReplacementNamed(LibraryScreen.nameRoute);
            },
          ),
        ),
      ),
    );
  }
}
