import 'package:flutter/material.dart';

class AppTextfield extends StatelessWidget {
  final String labelText;
  final bool? obscureText;
  final bool? isEmail;
  final TextEditingController? textController;

  const AppTextfield({
    super.key,
    required this.labelText,
    this.obscureText,
    this.isEmail,
    this.textController,
  });
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextField(
      controller: textController,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.2)),
        ),
        filled: true,
        fillColor: Colors.white.withValues(alpha: 0.05),
      ),
      obscureText: obscureText ?? false,
      keyboardType: isEmail == true
          ? TextInputType.emailAddress
          : TextInputType.text,
    );
  }
}
