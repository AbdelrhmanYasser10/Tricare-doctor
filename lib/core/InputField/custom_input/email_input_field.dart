import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';
import '../../component/TextField/text_form_field.dart';
import '../validation/input_validator.dart';

class EmailFiled extends StatelessWidget {
  final TextEditingController controller;

  const EmailFiled({super.key, required this.controller});


  @override
  Widget build(BuildContext context) {
    return  BuildTextFormField(
      controller: controller,
      hintText: S.of(context).email,
      prefixIcon: const Icon(Icons.email),
      maxLines: 1,
      keyboardType: TextInputType.emailAddress,
      valid: InputValidator(context).emailValidator,
    );
  }
}