import 'package:flutter/material.dart';
import 'package:webfeed/domain/rss_item.dart';
import 'package:html/parser.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:portfolio/utils/hover_extensions.dart';

class BlogContentsCard extends StatelessWidget {
  const BlogContentsCard({
    Key key,
    this.isMobile,
    this.article,
  }) : super(key: key);

  final bool isMobile;
  final RssItem article;

  @override
  Widget build(BuildContext context) {
    final contentHtml = article.content.value;
    final postDate = convertDate(article.pubDate);
    return InkWell(
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () => _launchURL(article.link),
      child: Card(
        elevation: 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(4), topRight: Radius.circular(4)),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile ?? false ? 8.0 : 16.0,
                  vertical: isMobile ?? false ? 20.0 : 40.0,
                ),
                color: Colors.redAccent,
                child: Text(
                  article.title ?? 'not title',
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      .copyWith(color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      Expanded(flex: 2, child: SizedBox()),
                      Expanded(
                          flex: 1,
                          child: Text(
                            postDate ?? 'post date null.'.toString(),
                            style: TextStyle(color: Colors.grey, fontSize: 16),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    _parseHtml(contentHtml) ?? 'text null.',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                ],
              ),
            ),
          ],
        ),
      ).moveUpOnHover,
    );
  }

  _launchURL(String url) {
    if (url.isNotEmpty) {
      launch(url);
    } else {
      print('url is not access...');
    }
  }
}

// - Helpers

String _parseHtml(String html) {
  final document = parse(html);
  final parsedText = parse(document.body.text).documentElement.text;
  return parsedText;
}

String convertDate(DateTime date) {
  return DateFormat.yMMMEd().format(date);
}
