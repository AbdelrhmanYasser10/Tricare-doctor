import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BuildTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? valid;
  final TextInputType? keyboardType;
  final bool? isPassword;
  final int? maxLines;
  final void Function(String)? onchange;

  const BuildTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.valid,
    this.keyboardType,
    this.isPassword,
    this.maxLines,
    this.onchange,
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return TextFormField(
      onChanged: onchange,
      autocorrect: true,
      controller: controller,
      maxLines: isPassword != null ? 1 : maxLines,
      minLines: 1,
      validator: valid,
      keyboardType: keyboardType,
      obscureText: isPassword ?? false,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        contentPadding: EdgeInsets.symmetric(
            vertical: height * 0.025, horizontal: width * 0.06),
      ),
    );
  }
}
