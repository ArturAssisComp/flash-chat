import 'package:flash_chat/constants.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flash_chat/widgets/basic_button.dart';
import 'package:flash_chat/widgets/email_input.dart';
import 'package:flash_chat/widgets/hero_image_asset.dart';
import 'package:flash_chat/widgets/password_input.dart';
import 'package:flash_chat/widgets/space_between.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  static const String routeName = '/registration';

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  String? _email;
  String? _password;
  bool _saving = false;

  Future<bool> _registerUser() async {
    if (_email != null && _password != null) {
      try {
        final userCredentials = await _auth.createUserWithEmailAndPassword(
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
    return ModalProgressHUD(
      inAsyncCall: _saving,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Flexible(
                child: HeroImageAsset(
                    tag: kLogoTag,
                    height: 200,
                    imageAssetName: 'images/logo.png'),
              ),
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
                text: 'Register',
                onPressed: () async {
                  setState(() {
                    _saving = true;
                  });
                  final bool userCreated = await _registerUser();
                  setState(() {
                    _saving = false;
                  });
                  if (userCreated) {
                    _gotoChatScreen();
                  }
                },
                color: Colors.blueAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
