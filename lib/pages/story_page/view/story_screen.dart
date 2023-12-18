import 'package:flutter/material.dart';
import 'package:my_library/pages/story_page/repo/story_data.dart';
import 'package:story/story_page_view.dart';

class StoryScreen extends StatelessWidget {
  const StoryScreen({Key? key}) : super(key: key);

  static get nameRoute => 'story_screen';

  @override
  Widget build(BuildContext context) {
    final storyData = StoryData.storyList;

    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black),
      body: StoryPageView(
        pageLength: storyData.length,
        itemBuilder: (ctx, pageInd, storyInd) {
          final theme = storyData[pageInd];
          final story = theme.storyThemes[storyInd];

          return Stack(
            children: [
              Positioned.fill(
                child: Container(
                  color: Colors.black,
                ),
              ),
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(story.imageUrl),
                    ),
                  ),
                ),
              )
            ],
          );
        },
        storyLength: (int pageIndex) => storyData[pageIndex].storyThemes.length,
      ),
    );
  }
}
