import 'package:flash_chat/constants.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    this.onChanged,
    this.hintText,
    this.obscureText = false,
    this.keyboardType,
  });
  final void Function(String)? onChanged;
  final String? hintText;
  final bool obscureText;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType,
      textAlign: TextAlign.center,
      obscureText: obscureText,
      style: const TextStyle(
        color: Colors.black,
      ),
      onChanged: onChanged,
      decoration: kDefaultInputFieldDecoration.copyWith(
        hintText: hintText,
      ),
    );
  }
}
