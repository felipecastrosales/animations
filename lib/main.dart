import 'package:flutter/material.dart';
import 'screens/login/login_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animations',
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xFFFF4D00),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFFFF4D00),
          secondary: Color(0xFFFF4D00),
        ),
        fontFamily: 'OpenSans',
      ),
    );
  }
}
