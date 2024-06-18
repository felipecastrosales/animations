import 'package:flutter/material.dart';

class FadeContainer extends StatelessWidget {
  const FadeContainer({
    super.key,
    required this.fadeAnimation,
  });

  final Animation<Color?> fadeAnimation;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'fade',
      child: ColoredBox(
        color: fadeAnimation.value ?? Colors.transparent,
      ),
    );
  }
}
