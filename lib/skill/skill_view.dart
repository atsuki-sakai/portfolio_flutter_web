import 'package:flutter/material.dart';
import 'package:portfolio/components/desktop_view_builder.dart';
import 'package:portfolio/components/mobile_desktop_view_builder.dart';
import 'package:portfolio/components/mobile_view_builder.dart';
import 'outline_skill_container.dart';

//TODO: - **** 要理解 ****
class SkillView extends StatelessWidget {
  const SkillView({Key key}) : super(key: key);
  static const title = 'Skills';
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return MobileDesktopViewBuilder(
      mobileView: SkillMobileView(),
      desktopView: SkillDesktopView(),
      showMobile: width < 800,
    );
  }
}

class SkillDesktopView extends StatelessWidget {
  const SkillDesktopView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: DesktopViewBuilder(title: SkillView.title,children: [
        for (var rowIndex = 0; rowIndex < skills.length / 4; rowIndex++)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (var index = 0; index < skills.length / 2; index++)
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8, bottom: 8),
                    child: OutlineSkillContainer(
                      index: index,
                      rowIndex: rowIndex,
                    ),
                  ),
                ),
            ],
          ),
      ]),
    );
  }
}

class SkillMobileView extends StatelessWidget {
  SkillMobileView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: MobileViewBuilder(children: [
        for (var index = 0; index < skills.length; index++)
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: OutlineSkillContainer(
                index: index,
                isMobile: true,
              )),
      ], title: SkillView.title),
    );
  }
}
