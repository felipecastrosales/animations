import 'package:flutter/material.dart';
import 'screens/login/login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Animations',
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: const Color(0xFFFF4D00),
          accentColor: const Color(0xFFFF6700),
          fontFamily: 'OpenSans',
        ));
  }
}
