import 'package:flutter/material.dart';

class StaggerAnimation extends StatelessWidget {
  StaggerAnimation({
    super.key,
    required this.controller,
    required this.endAnimationHeight,
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
          end: endAnimationHeight,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.5, 1, curve: Curves.bounceOut),
          ),
        );

  final AnimationController controller;
  final Animation<double> buttonSqueeze, buttonZoomOut;
  final double endAnimationHeight;

  static const initialButtonHeight = 50.0;
  static const initialPadding = EdgeInsets.fromLTRB(0, 36, 0, 16);
  static final loginScreenSizes = initialButtonHeight + initialPadding.vertical;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        final isInMiddleAnimation =
            buttonZoomOut.value < endAnimationHeight / 2;

        return Padding(
          padding:
              isInMiddleAnimation ? const EdgeInsets.all(0) : initialPadding,
          child: InkWell(
            onTap: controller.forward,
            child: Hero(
              tag: 'fade',
              child: buttonZoomOut.value == 60
                  ? Container(
                      width: buttonSqueeze.value,
                      height: initialButtonHeight,
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
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.white,
                              ),
                              strokeWidth: 1.0,
                            ),
                    )
                  : Container(
                      width: buttonZoomOut.value,
                      height: buttonZoomOut.value,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        shape: isInMiddleAnimation
                            ? BoxShape.circle
                            : BoxShape.rectangle,
                      ),
                    ),
            ),
          ),
        );
      },
    );
  }
}
