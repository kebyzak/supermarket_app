import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';
import 'package:supermarket_app/generated/l10n.dart';

class StoriesScreen extends StatelessWidget {
  const StoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final StoryController controller = StoryController();

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).stories),
      ),
      body: Container(
        margin: const EdgeInsets.all(8),
        child: StoryView(
          controller: controller,
          storyItems: [
            StoryItem.text(
              title: S.of(context).stories,
              backgroundColor: Colors.orange,
              roundedTop: true,
            ),
            StoryItem.pageImage(
              url:
                  "https://images.unsplash.com/photo-1526512340740-9217d0159da9?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dmVydGljYWx8ZW58MHx8MHx8fDA%3D",
              caption: S.of(context).longRoad,
              controller: controller,
            ),
            StoryItem.text(
              title: S.of(context).welcomeBack,
              backgroundColor: Colors.blue,
              roundedTop: true,
            ),
            StoryItem.pageImage(
              url:
                  "https://images.adsttc.com/media/images/5b08/b87c/f197/ccb5/4900/00bd/slideshow/The_S_02_filter_edit2_06.jpg?1527298139",
              caption: S.of(context).urbanCity,
              controller: controller,
            ),
          ],
          progressPosition: ProgressPosition.top,
          repeat: false,
          inline: true,
        ),
      ),
    );
  }
}
