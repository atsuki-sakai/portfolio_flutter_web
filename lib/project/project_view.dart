import 'package:flutter/material.dart';
import 'package:portfolio/components/desktop_view_builder.dart';
import 'package:portfolio/components/mobile_desktop_view_builder.dart';
import 'package:portfolio/components/mobile_view_builder.dart';
import 'package:portfolio/navigation_bar/navigation_bar_view.dart';
import 'package:portfolio/project/project_item_body.dart';
import 'package:provider/provider.dart';

class ProjectView extends StatelessWidget {

  const ProjectView({Key key}) : super(key: key);
  static const title = 'Projects';

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ScrollController>();
    return MobileDesktopViewBuilder(
        mobileView: ProjectMobileView(), desktopView: ProjectDesktopView());
  }
}

class ProjectMobileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MobileViewBuilder(children: [
      for (final item in kProjectItems) ProjectItemBody(item: item),
    ], title: ProjectView.title);
  }
}

class ProjectDesktopView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DesktopViewBuilder(children: [Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final item in kProjectItems)
          Expanded(
            child: ProjectItemBody(item: item),
          ),
      ],
    ),
    ], title: ProjectView.title);
  }
}
