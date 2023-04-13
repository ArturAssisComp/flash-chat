import 'package:flash_chat/constants.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    required this.onChanged,
    this.hintText,
  });
  final void Function(String) onChanged;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
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
