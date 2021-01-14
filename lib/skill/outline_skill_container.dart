import 'package:flutter/material.dart';
import 'package:portfolio/utils/color_assets.dart';

final skills = [
  'Swift5',
  'Firebase',
  'Flutter',
  'Music Upload',
  'Final Cut Pro',
  'Line Bot',
  'Vectornetor',
  'Glow',
];

class OutlineSkillContainer extends StatelessWidget {
  const OutlineSkillContainer({
    Key key,
    @required this.index,
    this.rowIndex,
    this.isMobile,
  }) : super(key: key);

  final int index;
  final int rowIndex;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    final parsedIndex = isMobile ?? false ? index: (index * 2) + rowIndex;
    final colors = ColorAssets.allColors;
    return Container(
      width: isMobile ?? false ? double.infinity : null,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(
          width: 3,
          color: colors.elementAt(index % colors.length),
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Center(
          child: Text(
            skills.elementAt(parsedIndex),
            style: Theme.of(context).textTheme.headline5,
          )),
    );
  }
}