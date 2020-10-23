import 'package:flutter/material.dart';
import 'list_data.dart';

class AnimatedListView extends StatelessWidget {
  final Animation<EdgeInsets> listSlidePosition;
  AnimatedListView({@required this.listSlidePosition});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        ListData(
          title: 'I\'m Felipe Sales',
          subtitle: 'I like to study',
          image: AssetImage('assets/images/profile.png'),
          margin: listSlidePosition.value * 4,
        ),
        ListData(
          title: 'My GitHub',
          subtitle: 'Here\'s my Projects',
          image: AssetImage('assets/images/github.png'),
          margin: listSlidePosition.value * 3,
        ),
        ListData(
          title: 'Flutter Study',
          subtitle: 'I study a lot of Flutter',
          image: AssetImage('assets/images/flutter.jpg'),
          margin: listSlidePosition.value * 2,
        ),
        ListData(
          title: 'Dart Study',
          subtitle: 'also study dart',
          image: AssetImage('assets/images/dart.png'),
          margin: listSlidePosition.value * 1,
        ),
        ListData(
          title: 'My LinkedIn',
          subtitle: 'See my LinkedIn',
          image: AssetImage('assets/images/linkedin.png'),
          margin: listSlidePosition.value * 0,
        ),
      ]
    );
  }
}
