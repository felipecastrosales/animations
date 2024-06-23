import 'package:animations/screens/login/widgets/input_field.dart';
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
    const iconPadding = EdgeInsets.only(top: 80, bottom: 32);
    const imageSize = 120.0;
    final statusBar = MediaQuery.of(context).padding.top;
    final signInPosition =
        iconPadding.vertical + imageSize + (InputField.loginScreenSizes);

    timeDilation = 0.8;

    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            SizedBox(
              height: MediaQuery.sizeOf(context).height + statusBar,
              child: Stack(
                alignment: Alignment.bottomCenter,
                fit: StackFit.expand,
                clipBehavior: Clip.none,
                children: <Widget>[
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: iconPadding,
                        child: Image.asset(
                          'assets/images/check.png',
                          width: imageSize,
                          height: imageSize,
                          fit: BoxFit.contain,
                        ),
                      ),
                      const FormContainer(),
                    ],
                  ),
                  Positioned(
                    top: signInPosition + StaggerAnimation.loginScreenSizes,
                    child: const SignUpButton(),
                  ),
                  Positioned.fill(
                    top: _animationController.value < 60
                        ? -statusBar
                        : signInPosition,
                    child: Align(
                      alignment: Alignment.center,
                      child: StaggerAnimation(
                        controller: _animationController,
                        endAnimationHeight:
                            MediaQuery.sizeOf(context).height + statusBar,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
