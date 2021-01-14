import 'package:flutter/material.dart';
import 'package:portfolio/components/desktop_view_builder.dart';
import 'package:portfolio/components/mobile_desktop_view_builder.dart';
import 'package:portfolio/components/mobile_view_builder.dart';
import 'package:portfolio/experience/experience_container.dart';
import 'package:portfolio/utils/color_assets.dart';

class ExperienceInfo {
  final String company;
  final String timeLine;
  final List<String> descriptions;

  ExperienceInfo({
    this.company,
    this.timeLine,
    this.descriptions,
  });
}

class ExperienceView extends StatelessWidget {

  const ExperienceView({Key key}) : super(key: key);
  static const title = 'Experience';

  @override
  Widget build(BuildContext context) {
    return MobileDesktopViewBuilder(
      mobileView: ExperienceMobileView(),
      desktopView: ExperienceDesktopView(),
    );
  }
}

class ExperienceMobileView extends StatelessWidget {
  const ExperienceMobileView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MobileViewBuilder(title: ExperienceView.title, children: [
      for(var index = 0; index < experiences.length; index++)
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ExperienceContainer(experience: experiences.elementAt(index), index: index),
          ],
        ),
    ]);
  }
}

class ExperienceDesktopView extends StatelessWidget {
  const ExperienceDesktopView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = ColorAssets.allColors;
    return DesktopViewBuilder(title: ExperienceView.title, children: [
      Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Row(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for(var rowIndex = 0; rowIndex < experiences.length / 2; rowIndex++)
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    for(var index = 0; index < experiences.length / 2; index++)
                    ExperienceContainer(experience: experiences.elementAt(rowIndex*2 + index),index: rowIndex*2 + index),
                  ],
                ),
              ),
          ],
        ),
      ),
    ]);
  }
}
