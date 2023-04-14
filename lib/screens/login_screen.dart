import 'package:flash_chat/constants.dart';
import 'package:flash_chat/widgets/space_between.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/widgets/hero_image_asset.dart';
import 'package:flash_chat/widgets/basic_button.dart';
import 'package:flash_chat/widgets/password_input.dart';
import 'package:flash_chat/widgets/email_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const String routeName = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
            const HeroImageAsset(
                tag: kLogoTag,
                height: kFinalLogoHeightLoginPage,
                imageAssetName: kLogoPath),
            const SpaceBetween(
              verticalSpace: 48,
            ),
            const EmailInput(),
            const SpaceBetween(
              verticalSpace: 8,
            ),
            const PasswordInput(),
            const SpaceBetween(
              verticalSpace: 24,
            ),
            BasicButton(
              text: 'Log In',
              onPressed: () {},
              color: Colors.lightBlueAccent,
            ),
          ],
        ),
      ),
    );
  }
}
