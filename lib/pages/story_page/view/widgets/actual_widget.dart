import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:my_library/generated/locale_keys.g.dart';
import 'package:my_library/pages/story_page/view/story_screen.dart';

class ActualWidget extends StatefulWidget {
  const ActualWidget({Key? key}) : super(key: key);

  @override
  _ActualWidgetState createState() => _ActualWidgetState();
}

class _ActualWidgetState extends State<ActualWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 1.0, end: 1.2).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppBar().preferredSize.height,
      decoration: BoxDecoration(
        color: Colors.brown.shade100,
        border: Border(
          bottom: BorderSide(color: Colors.brown.shade200),
        ),
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(8),
          bottomLeft: Radius.circular(8),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return InkWell(
              onTap: () =>
                  Navigator.of(context).pushNamed(StoryScreen.nameRoute),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    LocaleKeys.story.tr(),
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.brown,
                      letterSpacing: 1.5,
                      fontSize: 18,
                    ),
                  ),
                  Transform.scale(
                    scale: _animation.value,
                    child: const Icon(Icons.touch_app_outlined),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
