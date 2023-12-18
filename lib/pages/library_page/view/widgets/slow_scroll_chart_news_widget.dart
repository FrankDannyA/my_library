import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_library/pages/qr_page/view/qr_screen.dart';

class SlowScrollChartNewsWidget extends StatefulWidget {
  const SlowScrollChartNewsWidget({
    required this.title,
    required this.books,
    required this.reverse,
    required this.speedMultiplier,
    Key? key,
    required this.scrollController,
  }) : super(key: key);

  final String title;
  final List<String> books;
  final bool reverse;
  final double speedMultiplier;
  final ScrollController scrollController;

  @override
  _SlowScrollChartNewsWidgetState createState() =>
      _SlowScrollChartNewsWidgetState();
}

class _SlowScrollChartNewsWidgetState extends State<SlowScrollChartNewsWidget> {
  List<String> bookImages = [
    'assets/images/book1.jpg',
    'assets/images/book2.jpg',
    'assets/images/book3.jpg'
  ];

  int getRandImage() => Random().nextInt(bookImages.length);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startScroll();
    });
  }

  void _startScroll() async {
    await Future.delayed(const Duration(seconds: 1));

    final maxScrollExtent = widget.scrollController.position.maxScrollExtent;
    final duration = Duration(seconds: (30 / widget.speedMultiplier).round());

    if (widget.reverse) {
      widget.scrollController.animateTo(
        maxScrollExtent,
        duration: duration,
        curve: Curves.linear,
      );
    } else {
      widget.scrollController.animateTo(
        0.0,
        duration: duration,
        curve: Curves.linear,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              '${widget.title}:',
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          Expanded(
            child: ListView.builder(
              controller: widget.scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: widget.books.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: InkWell(
                  onTap: () => Navigator.pushNamed(context, QrScreen.nameRoute),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: MediaQuery.of(context).size.width * 0.7,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        fit: BoxFit
                            .cover, // Добавлено для правильного отображения изображения
                        image: AssetImage(bookImages[getRandImage()]),
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        widget.books[index],
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    widget.scrollController.dispose();
    super.dispose();
  }
}
