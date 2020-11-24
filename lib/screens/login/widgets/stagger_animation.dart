import 'package:flutter/material.dart';

class StaggerAnimation extends StatelessWidget {
  final AnimationController controller;
  
  StaggerAnimation({this.controller})
    : buttonSqueeze = Tween(
        begin: 250.0,
        end: 50.0,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.0, 0.150),
      ),
    ),
      buttonZoomOut = Tween<double>(
        begin: 60.0,
        end: 1000.0,
      ).animate(    
        CurvedAnimation(
          parent: controller,
          curve: Interval(0.5, 1, curve: Curves.bounceOut),
        ),
      );

  final Animation<double> buttonSqueeze;
  final Animation<double> buttonZoomOut;

  Widget _buildAnimation(BuildContext context, Widget child) {
    return Padding(
      padding: EdgeInsets.only(bottom: 60),
      child: InkWell(
        onTap: () {
          controller.forward();
        },
        child: Hero(
          tag: 'fade',
          child: buttonZoomOut.value == 60
            ? Container(
              width: buttonSqueeze.value,
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(30))),
              child: _buildInside(context),
            )
            : Container(
              width: buttonZoomOut.value,
              height: buttonZoomOut.value,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                shape: buttonZoomOut.value < 500
                  ? BoxShape.circle
                  : BoxShape.rectangle
              ),
            ),
        ),
      ),
    );
  }

  Widget _buildInside(BuildContext context) {
    if (buttonSqueeze.value > 80) {
      return Text(
        'Sign In',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          letterSpacing: 1),
      );
    } else {
      return CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        strokeWidth: 1.0,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: controller,
    );
  }
}
