import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';

import '../../component/TextField/text_form_field.dart';
import '../validation/input_validator.dart';

class PhoneFiled extends StatelessWidget {
  final TextEditingController controller;
  final bool edit;

  const PhoneFiled({super.key, required this.controller, this.edit = false});


  @override
  Widget build(BuildContext context) {
    return  BuildTextFormField(
      controller: controller,
      hintText: 'Phone',
      prefixIcon: const Icon(FontAwesomeIcons.mobileAlt),
      suffixIcon: edit? const Icon(FontAwesomeIcons.edit):null,
      maxLines: 1,
      keyboardType: TextInputType.phone,
      valid: InputValidator(context).phoneValidator,
    );
  }
}

class WhatsappPhoneField extends StatelessWidget {
  final TextEditingController controller;
  final bool edit;

  const WhatsappPhoneField({super.key, required this.controller, this.edit = false});


  @override
  Widget build(BuildContext context) {
    return  BuildTextFormField(
      controller: controller,
      hintText: 'Whatsapp',
      prefixIcon: const Icon(FontAwesomeIcons.whatsapp),
      suffixIcon: edit? const Icon(FontAwesomeIcons.edit):null,
      maxLines: 1,
      keyboardType: TextInputType.phone,
      valid: InputValidator(context).whatsPhoneValidator,
    );
  }
}
