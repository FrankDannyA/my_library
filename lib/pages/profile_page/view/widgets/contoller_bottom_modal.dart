import 'package:flutter/material.dart';
import 'package:my_library/pages/profile_page/repo/data/retrofit_opt.dart';

class ContollerBottomModal extends StatelessWidget {
  const ContollerBottomModal({
    super.key,
    required this.retrofitOpt,
  });

  final RetofitOpt retrofitOpt;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: retrofitOpt.getUser(),
      builder: (context, snap) {
        //Error
        if (snap.hasError) {
          return const Center(
            child: Text(
              "Произошла ошибка. Попробуйте еще раз.",
              textAlign: TextAlign.center,
            ),
          );
        }

        //Good
        if (snap.connectionState == ConnectionState.done) {
          final data = snap.data!;
          final user = data.results.first;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              children: [
                const Text(
                  'Обратитесь к конролеру для офрмления',
                  textAlign: TextAlign.center,
                ),
                Expanded(
                  child: Align(
                    alignment: const Alignment(0.0, -0.5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '${user.name.first} ${user.name.last}',
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          user.phone,
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          user.email,
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        }

        //Loading
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
