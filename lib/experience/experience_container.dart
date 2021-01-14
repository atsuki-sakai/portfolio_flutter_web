import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/utils/color_assets.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'experience_view.dart';

final experiences = [
  ExperienceInfo(
      company: '1samplefasdfasdf fasdfas',
      timeLine: '@samplesadfsamplefdafasdfasdfasfdasdfasdfsafasdfsadfsadfasfsafasdf',
      descriptions: [
        ' - sample samplefdafasdfasdfasfdasdfasdfsafasdfsadfsadfasfsafasdfsafsdfsafasdfasdfasdfadfa',
        ' - sample samplesamplefdafasdfasdfasfdasdfasdfsafasdfsadfsadfasfsafasdfsamplefdafasdfasdfasfdasdfasdfsafasdfsadfsadfasfsafasdf',
        ' - sample samplesamplefdafasdfasdfasfdasdfasdfsafasdfsadfsadfasfsafasdf',
        ' - sample samplesamplefdafasdfasdfasfdasdfasdfsafasdfsadfsadfasfsafasdf',
      ]),
  ExperienceInfo(
      company: '2sample fdsfas fasdf asdf ',
      timeLine: '@sample fasfsamplefdafasdfasdfasfdasdfasdfsafasdfsadfsadfasfsafasdfsamplefdafasdfasdfasfdasdfasdfsafasdfsadfsadfasfsafasdf',
      descriptions: [
        ' - sample samplesamplefdafasdfasdfasfdasdfasdfsafasdfsadfsadfasfsafasdfsamplefdafasdfasdfasfdasdfasdfsafasdfsadfsadfasfsafasdf',
        ' - sample sample',
        ' - sample samplesamplefdafasdfasdfasfdasdfasdfsafasdfsadfsadfasfsafasdf',
        ' - sample samplesamplefdafasdfasdfasfdasdfasdfsafasdfsadfsadfasfsafasdfsamplefdafasdfasdfasfdasdfasdfsafasdfsadfsadfasfsafasdf',
      ]),
  ExperienceInfo(
      company: '3sample fsdf sdf asfasdf ',
      timeLine: '@ample fsdfssamplefdafasdfasdfasfdasdfasdfsafasdfsadfsadfasfsafasdfdfa',
      descriptions: [
        ' - sample samplesamplefdafasdfasdfasfdasdfasdfsafasdfsadfsadfasfsafasdfsamplefdafasdfasdfasfdasdfasdfsafasdfsadfsadfasfsafasdfsamplefdafasdfasdfasfdasdfasdfsafasdfsadfsadfasfsafasdf',
        ' - sample sample',
        ' - samplesamplefdafasdfasdfasfdasdfasdfsafasdfsadfsadfasfsafasdfsample',
        ' - sample sample',
      ]),
  ExperienceInfo(
      company: '4sample fsdfsamplefdafasdfasdfasfdasdfasdfsafasdfsadfsadfasfsafasdfa',
      timeLine: '@ samplefasdf as',
      descriptions: [
        ' - sample sample',
        ' - sample samplesamplefdafasdfasdfasfdasdfasdfsafasdfsadfsadfasfsafasdfsamplefdafasdfasdfasfdasdfasdfsafasdfsadfsadfasfsafasdf',
        ' - sample sample',
        ' - sample samplesamplefdafasdfasdfasfdasdfasdfsafasdfsadfsadfasfsafasdf',
      ]),
];

class ExperienceContainer extends StatelessWidget {
  const ExperienceContainer({
    Key key,
    @required this.experience,
    @required this.index,
  }) : super(key: key);

  final ExperienceInfo experience;
  final int index;

  @override
  Widget build(BuildContext context) {
    final colors = ColorAssets.allColors;
    return ResponsiveBuilder(builder: (_, sizeInfo) {
      final bool isSmall = sizeInfo.screenSize.width < 710;
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(width: 3, color: colors.elementAt(index)),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                experience.company,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: fontStyle(isSmall, 18, 22, isBold: true),
              ),
              AutoSizeText(
                experience.timeLine,

                maxLines: 2,
                style:fontStyle(isSmall, 16, 20),
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: 4,
              ),
              for (var description in experience.descriptions)
                AutoSizeText(
                  description,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: fontStyle(isSmall, 14, 18),
                ),
            ],
          ),
        ),
      );
    });
  }

  TextStyle fontStyle(bool isSmall, num minSize, num maxSize, {bool isBold}) {
    return GoogleFonts.notoSans(
      fontWeight: isBold ?? false ? FontWeight.bold: FontWeight.normal,
      fontSize: isSmall ? minSize : maxSize,
    );
  }
}
