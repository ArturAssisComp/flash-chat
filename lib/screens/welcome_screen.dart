import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/constants.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flash_chat/widgets/basic_button.dart';
import 'package:flash_chat/widgets/space_between.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  static const String routeName = '/';

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Hero(
                  tag: kLogoTag,
                  child: TweenAnimationBuilder(
                    tween: Tween<double>(
                      begin: 0,
                      end: 60,
                    ),
                    duration: const Duration(seconds: 1),
                    builder:
                        (BuildContext context, double value, Widget? child) {
                      return SizedBox(
                        height: value.toDouble(),
                        child: child,
                      );
                    },
                    child: Image.asset('images/logo.png'),
                  ),
                ),
                AnimatedTextKit(
                  repeatForever: true,
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Flash Chat',
                      speed: const Duration(milliseconds: 250),
                      textStyle: const TextStyle(
                        fontSize: 45.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SpaceBetween(
              verticalSpace: 48,
            ),
            BasicButton(
              text: 'Log In',
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.routeName);
              },
              color: Colors.lightBlueAccent,
            ),
            BasicButton(
              text: 'Register',
              onPressed: () {
                Navigator.pushNamed(context, RegistrationScreen.routeName);
              },
              color: Colors.blueAccent,
            ),
          ],
        ),
      ),
    );
  }
}
