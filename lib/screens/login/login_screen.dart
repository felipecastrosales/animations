import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import '../home/home_screen.dart';
import 'widgets/form_container.dart';
import 'widgets/sign_up_button.dart';
import 'widgets/stagger_animation.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  void statusListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animationController.addStatusListener(statusListener);
  }

  @override
  void dispose() {
    _animationController.removeStatusListener(statusListener);
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 0.8;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 50, bottom: 25),
                      child: Image.asset(
                        'assets/images/check.png',
                        width: 120,
                        height: 120,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const FormContainer(),
                    const SignUpButton(),
                  ],
                ),
                StaggerAnimation(
                  controller: _animationController,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
