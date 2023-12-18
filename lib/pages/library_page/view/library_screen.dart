import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:my_library/generated/locale_keys.g.dart';
import 'package:my_library/pages/library_page/view/widgets/slow_scroll_chart_news_widget.dart';
import 'package:my_library/pages/profile_page/view/profile_screen.dart';
import 'package:my_library/pages/story_page/view/widgets/actual_widget.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({Key? key}) : super(key: key);

  static get nameRoute => 'library';

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 32,
        centerTitle: false,
        title: const Text('Подборка по жанру'),
        actions: [
          IconButton(
            icon: const Icon(Icons.qr_code_2),
            onPressed: () => Navigator.of(context).pushNamed(
              ProfileScreen.nameRoute,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ActualWidget(),
            SlowScrollChartNewsWidget(
              title: LocaleKeys.novel.tr(),
              books: const [
                'Лев Толстой',
                'Джейн Остин',
                "Чарльз Диккенс",
                "Джейн Эйр",
                "Габриэль Гарсиа Маркес",
              ],
              reverse: true,
              speedMultiplier: 1.0,
              scrollController: ScrollController(),
            ),
            SlowScrollChartNewsWidget(
              title: LocaleKeys.detective.tr(),
              books: const [
                'Артур Конан Дойл',
                'Агата Кристи',
                "Рэймонд Чандлер",
                "Агата Кристи",
                "Азамат Мусагалиев",
              ],
              scrollController: ScrollController(),
              reverse: true,
              speedMultiplier: 2.0,
            ),
            SlowScrollChartNewsWidget(
              scrollController: ScrollController(),
              title: LocaleKeys.fantasy.tr(),
              books: const [
                'Дж.Р.Р. Толкин',
                'Джоан Роулинг',
                "Джордж Р. Р. Мартин ",
                "Диана Уинн Джонс",
                "Патрик Ротфусс",
              ],
              reverse: true,
              speedMultiplier: 1.5,
            ),
          ],
        ),
      ),
    );
  }
}
