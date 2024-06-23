import 'package:flutter/material.dart';
import 'list_data.dart';

class AnimatedListView extends StatelessWidget {
  const AnimatedListView({
    super.key,
    required this.listSlidePosition,
  });

  final Animation<EdgeInsets> listSlidePosition;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        ListData(
          title: 'I\'m Felipe Sales',
          subtitle: 'I like to study',
          image: Image.network(
            'https://avatars.githubusercontent.com/u/59374587?v=4',
          ).image,
          margin: listSlidePosition.value * 4,
        ),
        ListData(
          title: 'My GitHub',
          subtitle: 'Here\'s my Projects',
          image: const AssetImage('assets/images/github.png'),
          margin: listSlidePosition.value * 3,
        ),
        ListData(
          title: 'Flutter Study',
          subtitle: 'I study a lot of Flutter',
          image: const AssetImage('assets/images/flutter.png'),
          margin: listSlidePosition.value * 2,
        ),
        ListData(
          title: 'Dart Study',
          subtitle: 'also study dart',
          image: const AssetImage('assets/images/dart.png'),
          margin: listSlidePosition.value * 1,
        ),
        ListData(
          title: 'My LinkedIn',
          subtitle: 'See my LinkedIn',
          image: const AssetImage('assets/images/linkedin.png'),
          margin: listSlidePosition.value * 0,
        ),
      ],
    );
  }
}
