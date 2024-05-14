import 'package:flutter/material.dart';

import '../../component/TextField/text_form_field.dart';

class SearchFiled extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final void Function(String)? onchange;

  const SearchFiled({super.key, required this.controller,required this.hint,required this.onchange});


  @override
  Widget build(BuildContext context) {
    return  BuildTextFormField(
      controller: controller,
      hintText: hint,
      prefixIcon: Icon(Icons.search),
      maxLines: 1,
      keyboardType: TextInputType.text,
      onchange: onchange,
     // valid: InputValidator(context).emailValidator,
    );
  }
}
