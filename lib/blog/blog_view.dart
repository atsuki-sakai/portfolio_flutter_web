import 'package:flutter/material.dart';
import 'package:portfolio/components/desktop_view_builder.dart';
import 'package:portfolio/components/mobile_desktop_view_builder.dart';
import 'package:portfolio/components/mobile_view_builder.dart';
import 'package:webfeed/webfeed.dart';
import 'blog_contents_card.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class BlogView extends StatelessWidget {


  const BlogView({Key key}) : super(key: key);
  //TODO: - static const とは？

  static const title = 'Blog.';

  @override
  Widget build(BuildContext context) {
    return FutureProvider<List<RssItem>>(
      create: (_) => getArticles(),
      child: MobileDesktopViewBuilder(
        mobileView: BlogMobileView(),
        desktopView: BlogDesktopView(),
      ),
    );
  }
}

class BlogDesktopView extends StatelessWidget {
  const BlogDesktopView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final articles = context.watch<List<RssItem>>();
    if (articles == null) return CircularProgressIndicator();
    return DesktopViewBuilder(title: BlogView.title, children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var article in articles) ...{
            Expanded(
              child: BlogContentsCard(article: article,),
            )
          }
        ],
      )
    ]);
  }
}

class BlogMobileView extends StatelessWidget {
  const BlogMobileView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final articles = context.watch<List<RssItem>>();
    if (articles == null) return CircularProgressIndicator();
    return MobileViewBuilder(title: BlogView.title, children: [
      for (final article in articles) ...{
        BlogContentsCard(article: article, isMobile: true,),
      }
    ]);
  }
}

Future<List<RssItem>> getArticles() async {
  final url =
      'https://cors-anywhere.herokuapp.com/https://medium.com/feed/@420atk';
  try {
    final response = await http.get(url);
    final persedResponse = RssFeed.parse(response.body);
    final haveFlutterTag = (RssItem article) =>
        article.categories.any((category) => category.value == 'flutter-web');
    final flutterArticle = persedResponse.items.where(haveFlutterTag).take(2).toList();
    return flutterArticle;
  }catch(error) {
    print(error.toString());
    return null;
  }
}
