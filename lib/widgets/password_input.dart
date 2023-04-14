import 'package:flash_chat/widgets/input_field.dart';
import 'package:flutter/material.dart';

class PasswordInput extends StatelessWidget {
  const PasswordInput({Key? key, this.onChanged}) : super(key: key);
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return InputField(
      obscureText: true,
      onChanged: onChanged,
      hintText: 'Enter your password',
    );
  }
}
