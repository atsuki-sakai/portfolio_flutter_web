import 'package:flutter/material.dart';
import 'package:portfolio/utils/constants.dart';

class MobileViewBuilder extends StatelessWidget {
  final String title;
  final List<Widget> children;
  final TextStyle titleStyle;

  const MobileViewBuilder(
      {Key key, @required this.title, @required this.children, this.titleStyle})
      : assert(children != null, title != null && title != ''),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      padding: kScreenPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(
            thickness: 3,
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            title,
            style: titleStyle ?? Theme.of(context).textTheme.headline2,
          ),
          SizedBox(
            height: 30,
          ),
          ...children,
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
