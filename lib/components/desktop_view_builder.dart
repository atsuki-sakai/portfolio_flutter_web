import 'package:flutter/material.dart';
import 'package:portfolio/utils/constants.dart';

class DesktopViewBuilder extends StatelessWidget {
  final title;
  final List<Widget> children;
  final TextStyle titleStyle;

  const DesktopViewBuilder(
      {Key key, @required this.title, @required this.children, this.titleStyle})
      : assert(children != null, title != null && title != ''),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: size.width < 1000 ? kScreenPadding: const EdgeInsets.symmetric(horizontal: 120),
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(thickness: 3,),
          SizedBox(height: 40,),
          Text(title, style: titleStyle ?? Theme.of(context).textTheme.headline2,),
          SizedBox(height: 40,),
          ...children,
          SizedBox(height: 40,),
        ],
      ),
    );
  }
}

