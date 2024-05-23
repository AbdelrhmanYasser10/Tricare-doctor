import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/InputField/validation/input_validator.dart';
import '../../../../../../core/component/TextField/text_form_field.dart';
import '../../../../generated/l10n.dart';


class NotesField extends StatelessWidget {
  final TextEditingController controller;

  const NotesField({super.key, required this.controller});


  @override
  Widget build(BuildContext context) {
    return  BuildTextFormField(
      controller: controller,
      hintText: S.of(context).notes,
      prefixIcon: const Icon(FontAwesomeIcons.alignCenter),
      maxLines: 1,
      keyboardType: TextInputType.text,
      valid: InputValidator(context).subjectValidator,
    );
  }
}
class RequestedCreditFields extends StatelessWidget {
  final TextEditingController controller;
  final String?Function(String?) validation;
  const RequestedCreditFields({super.key, required this.controller , required this.validation});


  @override
  Widget build(BuildContext context) {
    return  BuildTextFormField(
      controller: controller,
      hintText: 'Amount',
      prefixIcon: const Icon(FontAwesomeIcons.moneyBill),
      maxLines: 1,
      keyboardType: TextInputType.number,
      valid: validation,
    );
  }
}