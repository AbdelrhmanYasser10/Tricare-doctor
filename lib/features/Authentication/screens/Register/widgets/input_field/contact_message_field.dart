import 'package:flutter/material.dart';
import 'package:tricares_doctor_app/core/InputField/validation/input_validator.dart';

class RequestMessageField extends StatelessWidget {
  final TextEditingController controller;

  const RequestMessageField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return TextFormField(
      autocorrect: true,
      controller: controller,
      maxLines: 7,
      minLines: 4,
      validator: InputValidator(context).subjectMessageValidator,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: "Enter your message here",
        border: InputBorder.none,
        errorBorder: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(
            vertical: height * 0.025, horizontal: width * 0.06),
      ),
    );
  }
}
