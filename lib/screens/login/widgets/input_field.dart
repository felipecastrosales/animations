import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    required this.hint,
    required this.obscure,
    required this.icon,
  });

  final String hint;
  final bool obscure;
  final IconData icon;

  static const height = 50.0;
  static const padding = EdgeInsets.fromLTRB(5, 12, 30, 12);
  static final loginScreenSizes = height + (padding.vertical * 2);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.white24,
              width: 0.5,
            ),
          ),
        ),
        child: TextFormField(
          obscureText: obscure,
          style: const TextStyle(
            color: Colors.white,
          ),
          textAlignVertical: TextAlignVertical.center,
          textAlign: TextAlign.start,
          decoration: InputDecoration(
            icon: Icon(
              icon,
              color: Colors.white,
            ),
            border: InputBorder.none,
            hintText: hint,
            hintStyle: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
            contentPadding: padding,
          ),
        ),
      ),
    );
  }
}
