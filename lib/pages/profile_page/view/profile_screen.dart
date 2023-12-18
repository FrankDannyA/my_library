import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_library/generated/locale_keys.g.dart';
import 'package:my_library/pages/profile_page/bloc/profile_cubit.dart';
import 'package:my_library/pages/profile_page/bloc/profile_state.dart';
import 'package:my_library/pages/profile_page/repo/data/retrofit_opt.dart';
import 'package:my_library/pages/profile_page/view/widgets/contoller_bottom_modal.dart';
import 'package:my_library/pages/ticket_login_page/view/ticket_login_screen.dart';
import 'package:my_library/pages/ticket_login_page/view/widgets/text_field_decorated.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  static get nameRoute => 'profile';

  final cubit = ProfileCubit();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: Scaffold(
        appBar: AppBar(title: Text(LocaleKeys.profile.tr())),
        body: Padding(
          padding: const EdgeInsets.only(
            top: 24,
            left: 16,
            right: 16,
          ),
          child: BlocBuilder<ProfileCubit, ProfileState>(
            bloc: cubit..getUserData(),
            builder: (context, state) {
              return state.maybeMap(
                loaded: (userState) => SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      QrImageView(
                        data: "@eptvumat",
                        version: QrVersions.min,
                      ),
                      Text(
                        LocaleKeys.check_ticket.tr(),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 24),
                      TextFieldDecorated(
                        title: userState.user?.name ?? '',
                        controller: nameController,
                      ),
                      const SizedBox(height: 16),
                      TextFieldDecorated(
                        title: userState.user?.email ?? '',
                        controller: emailController,
                      ),
                      const SizedBox(height: 16),
                      TextFieldDecorated(
                        title: userState.user?.age ?? '',
                        controller: ageController,
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () async =>
                            await context.read<ProfileCubit>().editUser(
                                  name: nameController.text,
                                  age: ageController.text,
                                ),
                        child: Text(LocaleKeys.edit.tr()),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              final retrofitOpt = RetofitOpt(Dio());

                              return ContollerBottomModal(
                                retrofitOpt: retrofitOpt,
                              );
                            },
                          );
                        },
                        child: Text(LocaleKeys.controller.tr()),
                      ),
                      const SizedBox(height: 200)
                    ],
                  ),
                ),
                loading: (_) => const Center(
                  child: CircularProgressIndicator(),
                ),
                orElse: () => const SizedBox(),
              );
            },
          ),
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterFloat,
        floatingActionButton: BlocBuilder(
          bloc: cubit,
          builder: (context, state) {
            return ElevatedButton(
              onPressed: () async {
                await context.read<ProfileCubit>().logout();
                // ignore: use_build_context_synchronously
                Navigator.of(context).pushReplacementNamed(
                  TicketLoginScreen.nameRoute,
                );
              },
              child: Text(LocaleKeys.logout.tr()),
            );
          },
        ),
      ),
    );
  }
}
