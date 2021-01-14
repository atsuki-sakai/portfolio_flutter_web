import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/blog/blog_view.dart';
import 'package:portfolio/desktop/header_view.dart';
import 'package:portfolio/drawer_view/drawer_view.dart';
import 'package:portfolio/experience/experience_view.dart';
import 'package:portfolio/footer/footer_view.dart';
import 'package:portfolio/navigation_bar/navigation_bar_view.dart';
import 'package:portfolio/project/project_view.dart';
import 'package:portfolio/skill/skill_view.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:provider/provider.dart';

class PortfolioView extends StatefulWidget {
  @override
  _PortfolioViewState createState() => _PortfolioViewState();
}

class _PortfolioViewState extends State<PortfolioView> with AfterLayoutMixin {
  final projectKey = GlobalKey();
  final experienceKey = GlobalKey();
  final skillKey = GlobalKey();
  final blogKey = GlobalKey();
  List<NavigationItem> navigationItems = [];

  final ScrollController scrollController = ScrollController(
    initialScrollOffset: 2500,
  );

  @override
  void afterFirstLayout(BuildContext context) {
    // **　重要　ビルドが終わった直後に呼ばれる。 AfterLayoutMixin,
    setState(() {
      navigationItems = [
        NavigationItem('Projects.', key: projectKey),
        NavigationItem('Skills.', key: skillKey),
        NavigationItem('Experience.', key: experienceKey),
        NavigationItem('Blog.', key: blogKey),
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return MultiProvider(
      providers: [
        ProxyProvider0<List<NavigationItem>>(update: (_, __) => navigationItems,),
        ChangeNotifierProvider<ScrollController>(create: (_) => scrollController,),
      ],
      child: Scaffold(
        endDrawer: DrawerView(),
        body: SizedBox(
          width: screenSize.width,
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                NavigationBarView(),
                HeaderView(),
                ProjectView(
                  key: projectKey,
                ),
                SkillView(
                  key: skillKey,
                ),
                ExperienceView(
                  key: experienceKey,
                ),
                BlogView(
                  key: blogKey,
                ),
                FooterView(),
              ],
            ),
          ),
        ),
        floatingActionButton: BackToTopButton(),
      ),
    );
  }
}

class BackToTopButton extends StatelessWidget {
  const BackToTopButton({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final scrollController = context.watch<ScrollController>();
    if(scrollController.isOffsetZero) return SizedBox();
    return FloatingActionButton(
      child: Tooltip(message: '上へ戻る',child: Icon(Icons.arrow_upward)),
      onPressed: () => {
        scrollController.animateTo(0,
            duration: Duration(milliseconds: 700), curve: Curves.easeInOut)
      },
    );
  }
}

_getPosition(GlobalKey key) {
  final RenderBox renderBoxRed = key.currentContext.findRenderObject();
  final position = renderBoxRed.localToGlobal(Offset.zero);
  final scrollOffset = position.dy;
  print("POSITION of Red: $scrollOffset");
}

extension on ScrollController {
  bool get isOffsetZero {
    return this.offset == 0;
  }
}
