import 'package:flash_chat/constants.dart';
import 'package:flash_chat/widgets/basic_button.dart';
import 'package:flash_chat/widgets/hero_image_asset.dart';
import 'package:flash_chat/widgets/input_field.dart';
import 'package:flash_chat/widgets/space_between.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  static const String routeName = '/registration';

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
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
                tag: kLogoTag, height: 200, imageAssetName: 'images/logo.png'),
            const SpaceBetween(
              verticalSpace: 48,
            ),
            InputField(
              onChanged: (value) {},
              hintText: 'Enter your email',
            ),
            const SpaceBetween(
              verticalSpace: 8,
            ),
            InputField(
              onChanged: (value) {},
              hintText: 'Enter your password',
            ),
            const SpaceBetween(
              verticalSpace: 24,
            ),
            BasicButton(
              text: 'Register',
              onPressed: () {},
              color: Colors.blueAccent,
            ),
          ],
        ),
      ),
    );
  }
}
