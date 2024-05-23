import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';
import '../../component/TextField/text_form_field.dart';
import '../validation/input_validator.dart';

class PhoneFiled extends StatelessWidget {
  final TextEditingController controller;

  const PhoneFiled({super.key, required this.controller});


  @override
  Widget build(BuildContext context) {
    return  BuildTextFormField(
      controller: controller,
      hintText: S.of(context).phone,
      prefixIcon: const Icon(FontAwesomeIcons.mobileAlt),
      maxLines: 1,
      keyboardType: TextInputType.phone,
      valid: InputValidator(context).phoneValidator,
    );
  }
}