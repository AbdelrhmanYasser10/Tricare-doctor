import 'package:flutter/material.dart';
import 'package:tricares_doctor_app/features/Authentication/screens/Register/widgets/input_field/add_attachment_fields.dart';
import 'package:tricares_doctor_app/features/Authentication/screens/Register/widgets/input_field/contact_message_field.dart';
import 'package:tricares_doctor_app/features/Authentication/screens/Register/widgets/input_field/contact_subject_field.dart';
import 'package:tricares_doctor_app/features/Authentication/screens/Register/widgets/register_button.dart';

import '../../../../../core/InputField/custom_input/email_input_field.dart';
import '../../../../../core/InputField/custom_input/name_input_field.dart';
import '../../../../../core/InputField/custom_input/phone_input_field.dart';

class DoctorApplicationForm extends StatefulWidget {
  const DoctorApplicationForm({Key? key}) : super(key: key);

  @override
  State<DoctorApplicationForm> createState() => _DoctorApplicationFormState();
}

class _DoctorApplicationFormState extends State<DoctorApplicationForm> {
  late TextEditingController emailController;
  late TextEditingController subjectController;
  late TextEditingController nameController;
  late TextEditingController phoneController;
  late TextEditingController requestMessageController;
  @override
  void initState() {
    super.initState();

    emailController = TextEditingController();
    subjectController = TextEditingController();
    nameController = TextEditingController();
    phoneController = TextEditingController();
    requestMessageController = TextEditingController();
  }

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Form(
      key: formKey,
      child: Column(
        children: [
          NameFiled(controller: nameController),
          SizedBox(
            height: height * 0.02,
          ),
          PhoneFiled(controller: phoneController),
          SizedBox(
            height: height * 0.02,
          ),
          EmailFiled(controller: emailController),
          SizedBox(
            height: height * 0.02,
          ),

          SizedBox(
            height: height * 0.04,
          ),
          RegisterButton(
            formKey: formKey,
            emailController: emailController,
            subjectController: subjectController,
            messageController: requestMessageController,
            phoneController: phoneController,
            nameController: nameController,
            isDoctor: true,
          ),
        ],
      ),
    );
  }
  @override
  void dispose() {
    super.dispose();

    emailController.dispose();
    phoneController.dispose();
    nameController.dispose();
    subjectController.dispose();
    requestMessageController.dispose();
  }
}
