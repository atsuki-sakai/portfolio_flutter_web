import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/components/mobile_desktop_view_builder.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:portfolio/utils/hover_extensions.dart';

class SocialInfo {
  final Widget icon;
  final String title;
  final String url;
  final Color color;

  SocialInfo(
      {@required this.title,
        @required this.icon,
        @required this.url,
        this.color});
}

final socialInfos = [
  SocialInfo(
    title: 'Instagram',
    icon: FaIcon(FontAwesomeIcons.instagram),
    url: 'https://www.instagram.com/atk721_ams/',
    color: Colors.pinkAccent,
  ),
  SocialInfo(
      title: 'Twitter',
      icon: FaIcon(FontAwesomeIcons.twitter),
      url: 'https://twitter.com/SakaiAtsuki',
      color: Colors.blueAccent),
  SocialInfo(
      title: 'GitHub',
      icon: FaIcon(FontAwesomeIcons.github),
      url: 'https://github.com/atsuki-sakai',
      color: Colors.white),
  SocialInfo(
      title: 'Medium',
      icon: FaIcon(FontAwesomeIcons.medium),
      url: 'https://420atk.medium.com/',
      color: Colors.black),
];

class FooterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return MobileDesktopViewBuilder(
      showMobile: width < 800 ? true: false,
      mobileView: FooterMobileView(),
      desktopView: FooterDesktopView(),
    );
  }
}


class FooterDesktopView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentYear = DateTime.now().year;
    final screenSize = MediaQuery.of(context).size;
    return Container(
      color: Colors.redAccent,
      width: screenSize.width,
      height: 120,
      padding: screenSize.width < 1000
          ? kScreenPadding
          : const EdgeInsets.symmetric(horizontal: 120),
      child: Row(
        children: [
          Copywrite(currentYear: currentYear,),
          Spacer(),
          SocialMenuBar(),
          SizedBox(
            width: 60,
          )
        ],
      ),
    );
  }
}


class FooterMobileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentYear = DateTime.now().year;
    final screenSize = MediaQuery.of(context).size;
    return Container(
      color: Colors.red,
      height: 150,
      width: screenSize.width,
      padding: screenSize.width < 1000
          ? kScreenPadding
          : const EdgeInsets.symmetric(horizontal: 120),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SocialMenuBar(),
          SizedBox(
            height: 20,
          ),
          Copywrite(currentYear: currentYear, fontSize: 12,),
        ],
      ),
    );
  }
}

class Copywrite extends StatelessWidget {
  const Copywrite({
    Key key,
    this.fontSize,
    @required this.currentYear,
  }) : super(key: key);

  final int currentYear;
  final fontSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          ' @ < Sakai Atsuki > - $currentYear -  ',
          style: TextStyle(
              decoration: TextDecoration.underline,
              color: Colors.white,
              fontSize: fontSize ?? 16),
        ),
        InkWell(
          child: Text(
            ' See the source code. ',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: fontSize ?? 16),
          ),
          mouseCursor: MaterialStateMouseCursor.clickable,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: () => {launch('https://github.com/atsuki-sakai')},
        ),
      ],
    );
  }
}

class SocialMenuBar extends StatelessWidget {
  const SocialMenuBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white60,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (final social in socialInfos)
              IconButton(
                  color: social.color,
                  tooltip: social.title,
                  hoverColor: Colors.transparent,
                  icon: social.icon,
                  onPressed: () =>
                  {
                    launch(social.url),
                  }).moveUpOnHover,
          ],
        ),
      ),
    );
  }
}