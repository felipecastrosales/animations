import 'package:flutter/material.dart';
import 'input_field.dart';

class FormContainer extends StatelessWidget {
  const FormContainer({super.key});

  static const padding = EdgeInsets.symmetric(horizontal: 24);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: padding,
      child: const Form(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            InputField(
              hint: 'Username',
              obscure: false,
              icon: Icons.person_outline_rounded,
            ),
            InputField(
              hint: 'Password',
              obscure: true,
              icon: Icons.lock_outline_rounded,
            ),
          ],
        ),
      ),
    );
  }
}
