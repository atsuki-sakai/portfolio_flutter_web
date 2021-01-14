import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/components/mobile_desktop_view_builder.dart';
import 'package:portfolio/utils/constants.dart';
import 'header_body.dart';

class HeaderView extends StatelessWidget {
  const HeaderView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MobileDesktopViewBuilder(
        mobileView: mobileHeaderView(),
        desktopView: desktopView(),
    );
  }
}

class desktopView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isSmall = width < 950;
    final imageWidth = width * 0.47;
    return Container(
      width: width,
      padding: width < 1000 ? kScreenPadding: const EdgeInsets.symmetric(horizontal: 120),
      alignment: Alignment.center,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Center(
                child: AutoSizeText(
              'Sakai Atsuki Portfolio.',
              maxLines: 1,
              style: width > 830
                  ? Theme.of(context).textTheme.subtitle1
                  : Theme.of(context).textTheme.subtitle2,
            )),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Expanded(flex: 1, child: HeaderBody(isMobile: false)),
                SizedBox(
                  width: 20,
                ),
                Image.asset(
                  'images/profile_image.png',
                  height: isSmall ? imageWidth : 500,
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
    ;
  }
}

class mobileHeaderView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      height: screenSize.height * 0.9,
      width: screenSize.width,
      padding: kScreenPadding,
      child: Column(
        children: [
          Expanded(
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.asset(
                    'images/profile_image.png',
                  ))),
          HeaderBody(
            isMobile: true,
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
