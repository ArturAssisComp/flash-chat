import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/constants.dart';
import 'package:flash_chat/widgets/space_between.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/widgets/hero_image_asset.dart';
import 'package:flash_chat/widgets/basic_button.dart';
import 'package:flash_chat/widgets/password_input.dart';
import 'package:flash_chat/widgets/email_input.dart';
import 'package:flash_chat/screens/chat_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const String routeName = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? _email;
  String? _password;
  final _auth = FirebaseAuth.instance;

  Future<bool> _tryLoginUser() async {
    if (_email != null && _password != null) {
      try {
        final userCredentials = await _auth.signInWithEmailAndPassword(
            email: _email!, password: _password!);
        if (userCredentials.user != null) {
          return true;
        }
      } catch (e) {
        print(e);
      }
    }
    return false;
  }

  void _gotoChatScreen() {
    Navigator.pushNamed(context, ChatScreen.routeName);
  }

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
            EmailInput(
              onChanged: (value) {
                _email = value;
              },
            ),
            const SpaceBetween(
              verticalSpace: 8,
            ),
            PasswordInput(
              onChanged: (value) {
                _password = value;
              },
            ),
            const SpaceBetween(
              verticalSpace: 24,
            ),
            BasicButton(
              text: 'Log In',
              onPressed: () async {
                final bool loggedSuccessfully = await _tryLoginUser();
                if (loggedSuccessfully) {
                  _gotoChatScreen();
                }
              },
              color: Colors.lightBlueAccent,
            ),
          ],
        ),
      ),
    );
  }
}
