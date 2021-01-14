import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/utils/hover_extensions.dart';
import 'package:url_launcher/url_launcher.dart';

class HeaderBody extends StatelessWidget {
  final bool isMobile;

  const HeaderBody({Key key, this.isMobile}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          'I\'m a Mobile.',
          style: isMobile ? Theme.of(context).textTheme.headline4: Theme.of(context).textTheme.headline3,
          maxLines: 2,
        ),
        AutoSizeText(
          'Deveroper < / >',
          style: isMobile? Theme.of(context).textTheme.headline4: Theme.of(context).textTheme.headline3,
          maxLines: 2,
        ),
        SizedBox(
          height: isMobile ? 12.0 : 34.0,
        ),
        AutoSizeText(
          'I have 2 years of experience in mobile development in building beautiful apps in Android and iOS',
          style: Theme.of(context).textTheme.headline4,
          maxLines: 5,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(
          height: isMobile ? 20.0 : 40.0,
        ),
        FlatButton(
          color: Colors.blueAccent,
          onPressed: () => urlLauncherEmail(),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(4),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: isMobile ?? false ? 10 : 17,
                horizontal: isMobile ?? false ? 8 : 15),
            child: AutoSizeText(
              'Contact Me.',
              style: TextStyle(fontSize: isMobile ? 18.0 : 24.0),
            ),
          ),
        ).moveUpOnHover,
      ],
    );
  }

  urlLauncherEmail() {
    final Uri _emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'atk721@icloud.com',
      queryParameters: {
        'subject': 'Welcom To MyApp.',
        'body': 'Hello world',
      }
    );
    return launch(_emailLaunchUri.toString());
  }
}
