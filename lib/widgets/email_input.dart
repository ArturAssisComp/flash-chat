import 'package:flash_chat/widgets/input_field.dart';
import 'package:flutter/material.dart';

class EmailInput extends StatelessWidget {
  const EmailInput({Key? key, this.onChanged}) : super(key: key);
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return InputField(
      onChanged: onChanged,
      hintText: 'Enter your email',
      keyboardType: TextInputType.emailAddress,
    );
  }
}
