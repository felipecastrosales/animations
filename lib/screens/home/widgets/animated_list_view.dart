import 'package:flutter/material.dart';
import 'list_data.dart';

class AnimatedListView extends StatelessWidget {
  final Animation<EdgeInsets> listSlidePosition;

  // ignore: type_annotate_public_apis
  AnimatedListView({@required this.listSlidePosition});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        ListData(
          title: 'Flutter Study',
          subtitle: 'Studyng Studyng and Studyng',
          image: AssetImage('assets/images/profile.png'),
          margin: listSlidePosition.value * 1,
        ),
        ListData(
          title: 'Flutter Study',
          subtitle: 'Studyng Studyng and Studyng',
          image: AssetImage('assets/images/profile.png'),
          margin: listSlidePosition.value * 0,
        ),
      ]
    );
  }
}
