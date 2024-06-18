import 'package:flutter/material.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      // padding: EdgeInsets.only(top: 180),
      onPressed: () {},
      child: const Text(
        'Register',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 16,
          letterSpacing: 1,
        ),
      ),
    );
  }
}
