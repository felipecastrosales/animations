import 'package:flutter/material.dart';

class StaggerAnimation extends StatelessWidget {
  final AnimationController controller;

  StaggerAnimation({
    super.key,
    required this.controller,
  })  : buttonSqueeze = Tween(
          begin: 250.0,
          end: 50.0,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.0, 0.150),
          ),
        ),
        buttonZoomOut = Tween<double>(
          begin: 60.0,
          end: 1000.0,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.5, 1, curve: Curves.bounceOut),
          ),
        );

  final Animation<double> buttonSqueeze;
  final Animation<double> buttonZoomOut;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: (context, child) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 60),
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
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30)),
                      ),
                      child: buttonSqueeze.value > 80
                          ? const Text(
                              'Sign In',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                              ),
                            )
                          : const CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.white),
                              strokeWidth: 1.0,
                            ),
                    )
                  : Container(
                      width: buttonZoomOut.value,
                      height: buttonZoomOut.value,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        shape: buttonZoomOut.value < 500
                            ? BoxShape.circle
                            : BoxShape.rectangle,
                      ),
                    ),
            ),
          ),
        );
      },
      animation: controller,
    );
  }
}
