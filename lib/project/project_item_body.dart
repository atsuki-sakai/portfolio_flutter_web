import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class ProjectItem {
  final String imagePath;
  final String title;
  final String description;
  final List<String> technologies;

  ProjectItem(
      {@required this.imagePath,
      @required this.title,
      @required this.description,
      @required this.technologies})
      : assert(imagePath != null && imagePath != ''),
        assert(title != null && title != ''),
        assert(description != null && description != ''),
        assert(technologies != null && technologies.length >= 0);
}

final kProjectItems = [
  ProjectItem(
      imagePath: 'images/1.png',
      title: 'sample_projects',
      description:
          'simple logo is make sakai atsuki. ddddddddffffffffffaaaaaaaarrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrfffffaaaaaafsdafdfasfasdfasdfasdfasdfadfasdfasdfasdfasdfsfsadfsa',
      technologies: ['Firebase', 'Swift5']),
  ProjectItem(
      imagePath: 'images/2.png',
      title: 'hello world.',
      description:
          'simple logo is make sakai sample asmaple sampale sample sample sampel sapel sample sample saple sampel  atsuki.',
      technologies: ['Flutter', 'Firebase']),
  ProjectItem(
      imagePath: 'images/3.png',
      title: 'Logo_421',
      description:
          'simple logo is make sakai atsuki. hello world hellsamf fkdf;kadjfk fkkal',
      technologies: ['Swift5', 'Firebase']),
];

class ProjectItemBody extends StatelessWidget {
  const ProjectItemBody({
    Key key,
    @required this.item,
  }) : super(key: key);

  final ProjectItem item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: Image.asset(item.imagePath)),
          SizedBox(
            height: 20,
          ),
          AutoSizeText(
            item.title,
            style: Theme.of(context).textTheme.headline4,
          ),
          SizedBox(
            height: 6,
          ),
          AutoSizeText(
            item.description,
            style: Theme.of(context).textTheme.headline5,
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            children: [
              for (final tech in item.technologies)
                Padding(
                  padding: const EdgeInsets.only(right: 3.0),
                  child: Chip(
                      label: AutoSizeText(
                        tech,
                        style: TextStyle(color: Colors.white),
                        overflow: TextOverflow.ellipsis,
                      ),
                      backgroundColor: Colors.grey),
                ),
            ],
          ),
          SizedBox(
            height: 50.0,
          ),
        ],
      ),
    );
  }
}
