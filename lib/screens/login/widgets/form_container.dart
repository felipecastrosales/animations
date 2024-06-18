import 'package:flutter/material.dart';
import 'input_field.dart';

class FormContainer extends StatelessWidget {
  const FormContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25),
      child: const Form(
        child: Column(
          children: <Widget>[
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
