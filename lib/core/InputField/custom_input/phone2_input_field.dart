import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';

import '../../component/TextField/text_form_field.dart';
import '../validation/input_validator.dart';

class Phone2Filed extends StatelessWidget {
  final TextEditingController controller;

  const Phone2Filed({super.key, required this.controller});


  @override
  Widget build(BuildContext context) {
    return  BuildTextFormField(
      controller: controller,
      hintText: 'Another Phone',
      prefixIcon: const Icon(FontAwesomeIcons.mobileAlt),
      maxLines: 1,
      keyboardType: TextInputType.phone,
      valid: InputValidator(context).phoneValidator,
    );
  }
}