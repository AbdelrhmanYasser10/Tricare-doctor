import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';
import '../../component/TextField/text_form_field.dart';
import '../validation/input_validator.dart';

class NameFiled extends StatelessWidget {
  final TextEditingController controller;

  const NameFiled({super.key, required this.controller});


  @override
  Widget build(BuildContext context) {
    return  BuildTextFormField(
      controller: controller,
      hintText: S.of(context).name,
      prefixIcon: const Icon(FontAwesomeIcons.user),
      maxLines: 1,
      keyboardType: TextInputType.name,
      valid: InputValidator(context).nameValidator,
    );
  }
}