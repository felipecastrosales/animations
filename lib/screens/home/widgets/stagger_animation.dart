import 'package:flutter/material.dart';
import 'animated_list_view.dart';
import 'fade_container.dart';
import 'home_top.dart';

class StaggerAnimation extends StatelessWidget {
  final AnimationController controller;

  StaggerAnimation({@required this.controller})
      : containerGrow = CurvedAnimation(parent: controller, curve: Curves.ease),
        listSlidePosition = EdgeInsetsTween(
                begin: EdgeInsets.only(bottom: 0),
                end: EdgeInsets.only(bottom: 80))
            .animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.3, 0.8, curve: Curves.ease),
          ),
        ),
        fadeAnimation = ColorTween(
          begin: const Color.fromRGBO(255, 77, 0, 1.0),
          end: const Color.fromRGBO(255, 129, 0, 0.0), 
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.3, 0.8, curve: Curves.decelerate),
          ),
        );

  final Animation<double> containerGrow;
  final Animation<EdgeInsets> listSlidePosition;
  final Animation<Color> fadeAnimation;

  Widget _buildAnimation(BuildContext context, Widget child) {
    return Stack(
      children: <Widget>[
        ListView(
          padding: EdgeInsets.zero, 
          children: <Widget>[
            HomeTop(containerGrow: containerGrow),
            AnimatedListView(listSlidePosition: listSlidePosition),
        ]
      ),
      IgnorePointer(
        child: FadeContainer(
          fadeAnimation: fadeAnimation,
        ),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey[200],
        child: AnimatedBuilder(
          animation: controller,
          builder: _buildAnimation,
        ),
      ),
    );
  }
}
