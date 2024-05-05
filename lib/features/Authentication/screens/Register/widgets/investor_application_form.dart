import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tricares_doctor_app/core/InputField/custom_input/phone2_input_field.dart';
import 'package:tricares_doctor_app/core/component/Loading%20Widget/loading_widget.dart';
import 'package:tricares_doctor_app/features/Authentication/cubit/auth_cubit.dart';
import 'package:tricares_doctor_app/features/Authentication/screens/Register/widgets/input_field/add_attachment_fields.dart';
import 'package:tricares_doctor_app/features/Authentication/screens/Register/widgets/register_button.dart';
import 'package:tricares_doctor_app/features/home_layout/cubits/app_cubit/app_cubit.dart';

import '../../../../../core/InputField/custom_input/email_input_field.dart';
import '../../../../../core/InputField/custom_input/name_input_field.dart';
import '../../../../../core/InputField/custom_input/phone_input_field.dart';
import '../../../../../core/component/DropDownButtonField/drop_down_button_filed.dart';

class InvestorApplicationForm extends StatefulWidget {
  const InvestorApplicationForm({Key? key}) : super(key: key);

  @override
  State<InvestorApplicationForm> createState() =>
      _InvestorApplicationFormState();
}

class _InvestorApplicationFormState extends State<InvestorApplicationForm> {
  late TextEditingController emailController;
  late TextEditingController nameController;
  late TextEditingController phoneController;
  late TextEditingController phone2Controller;
  late String gender = "N/A";
  late String country = "N/A";
  @override
  void initState() {
    super.initState();

    emailController = TextEditingController();
    nameController = TextEditingController();
    phoneController = TextEditingController();
    phone2Controller = TextEditingController();
    AuthCubit.get(context).getAllCountries();
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
          Row(
            children: [
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if(state is NoInterNetConnection){

                  }
                },
                builder: (context, state) {
                  if(state is AllCountriesLoading){
                    return const BuildLoadingWidget();
                  }
                  return Expanded(
                    child: BuildDropDownButtonField(
                      width: width * 0.5,
                      height: height,
                      valid: (p0) {
                        return null;
                      },
                      onChanged: (p0) {
                        country = p0!;
                        setState(() {});
                      },
                      hint: "Country",
                      item: AuthCubit.get(context).allCounties.map((e) {
                        return e.label;
                      }).toList(),
                      num: 1,
                      cubit: AuthCubit.get(context),
                    ),
                  );
                },
              ),
              SizedBox(
                width: width * 0.02,
              ),
              Expanded(
                child: BuildDropDownButtonField(
                  width: width * 0.5,
                  height: height,
                  valid: (p0) {},
                  onChanged: (p0) {
                    gender = p0!;
                    setState(() {});
                  },
                  hint: "Gender",
                  item: const [
                    "Male",
                    "Female",
                  ],
                  num: 1,
                  cubit: AuthCubit.get(context),
                ),
              ),
            ],
          ),
          SizedBox(
            height: height * 0.02,
          ),
          NameFiled(controller: nameController),
          SizedBox(
            height: height * 0.02,
          ),
          PhoneFiled(controller: phoneController),
          SizedBox(
            height: height * 0.02,
          ),
          Phone2Filed(controller: phone2Controller),
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
            isDoctor: false,
            phoneController: phoneController,
            nameController: nameController,
            phone2Controller: phone2Controller,
            gender:gender,
            country: country,
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
    phone2Controller.dispose();
    nameController.dispose();
  }
}
