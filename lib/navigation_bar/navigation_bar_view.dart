import 'package:flutter/material.dart';
import 'package:portfolio/components/mobile_desktop_view_builder.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:provider/provider.dart';

class NavigationItem {
  final String text;
  final GlobalKey key;

  NavigationItem(this.text, {@required this.key});

  double get position => _getPosition(key);
}

class NavigationBarView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //TODO: - 各Menu毎に遷移させたい。
    final width = MediaQuery.of(context).size.width;
    return MobileDesktopViewBuilder(
      mobileView: MobileNavigationBar(),
      desktopView: DesktopNavigationBar(),
      showMobile: width < 611,
    );
  }
}


// - Desktop

class DesktopNavigationBar extends StatelessWidget {
  const DesktopNavigationBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationItems = context.watch<List<NavigationItem>>();
    final scrollController = context.watch<ScrollController>();
    return Container(
      height: 100,
      width: 1507,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          color: Colors.blueAccent,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset('images/nabbar_logo.png'),
              ),
              Spacer(),
              //TODO: Widgets内でFor文を回す際はこうなる。
              for (var item in navigationItems)
                NavigationBarItem(
                    onPreesed: () {
                      scrollAnimation(controller: scrollController, item: item);
                    },
                    text: item.text),
            ],
          ),
        ),
      ),
    );
  }
}

// - Mobile

class MobileNavigationBar extends StatelessWidget {
  const MobileNavigationBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: 60,
          width: double.infinity,
          color: Colors.blueAccent,
          padding: kScreenPadding,
          child: Padding(
            padding: const EdgeInsets.only(top: 12, bottom: 12),
            child: Row(
              children: [
                Image.asset(
                  'images/nabbar_logo.png',
                  height: 60,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: Text(
                    'Sakai Atsuki Portfolio.',
                  ),
                ),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// - NavigationBar

class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem({
    Key key,
    @required this.onPreesed,
    @required this.text,
  }) : super(key: key);

  final void Function() onPreesed;
  final String text;

  @override
  Widget build(BuildContext context) {
    final isSmall = MediaQuery.of(context).size.width < 750;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: InkWell(
        hoverColor: Colors.transparent,
        mouseCursor: MaterialStateMouseCursor.clickable,
        onTap: onPreesed,
        child: Text(
          text,
          style: isSmall
              ? Theme.of(context).textTheme.headline5
              : Theme.of(context).textTheme.headline4,
        ),
      ),
    );
  }
}

// - Helpers
double _getPosition(GlobalKey key) {
  final RenderBox renderBoxRed = key.currentContext.findRenderObject();
  final position = renderBoxRed.localToGlobal(Offset.zero);
  final scrollOffset = position.dy;
  print("POSITION of Red: $scrollOffset");
  return scrollOffset;
}

void scrollAnimation({@required ScrollController controller, @required NavigationItem item}) {
  controller.animateTo(item.position,
      duration: Duration(milliseconds: 700), curve: Curves.easeInOut);
}

