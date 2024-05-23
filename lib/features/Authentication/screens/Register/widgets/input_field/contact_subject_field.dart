import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/InputField/validation/input_validator.dart';
import '../../../../../../core/component/TextField/text_form_field.dart';
import '../../../../../../generated/l10n.dart';


class ContactSubjectField extends StatelessWidget {
  final TextEditingController controller;

  const ContactSubjectField({super.key, required this.controller});


  @override
  Widget build(BuildContext context) {
    return  BuildTextFormField(
      controller: controller,
      hintText: S.of(context).requestSubject,
      prefixIcon: const Icon(FontAwesomeIcons.alignCenter),
      maxLines: 1,
      keyboardType: TextInputType.emailAddress,
      valid: InputValidator(context).subjectValidator,
    );
  }
}