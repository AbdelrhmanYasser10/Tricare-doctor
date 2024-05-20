import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tricares_doctor_app/core/network/Local/CashHelper.dart';
import 'package:tricares_doctor_app/features/profile/cubit/profile_cubit.dart';
import 'package:tricares_doctor_app/features/profits/cubits/add_profit_cubit/add_profit_cubit.dart';
import 'package:tricares_doctor_app/features/profits/cubits/profits_cubit/profits_cubit.dart';
import 'package:tricares_doctor_app/features/profits/screens/widgets/text_fields.dart';

import '../../../../core/component/Loading Widget/loading_widget.dart';
import '../../../../core/functions/fucntions.dart';
import '../../../../core/globle/color/shared_color.dart';
import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/Build Password First/build_password_first.dart';
import '../../../Drawer Screen/Tos Screen/tos_screen.dart';
import '../../../Drawer/cubit/drawer_cubit.dart';

class AddNewProfitFormBodyConsumer extends StatefulWidget {
  const AddNewProfitFormBodyConsumer({Key? key}) : super(key: key);

  @override
  State<AddNewProfitFormBodyConsumer> createState() => _AddNewProfitFormBodyConsumerState();
}

class _AddNewProfitFormBodyConsumerState extends State<AddNewProfitFormBodyConsumer> {
  final TextEditingController _notesController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    super.dispose();
    _notesController.dispose();
    _amountController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is GetUserDataLoading) {
          return const SizedBox();
        } else {
          return BlocConsumer<AddProfitCubit, AddProfitState>(
            listener: (c, s) {
              if (s is AddProfitError) {
                var snackBar = Utils.buildSnackBar2(
                  contentType: ContentType.failure,
                  context: context,
                  message: s.message,
                );
                ScaffoldMessenger.of(c).showSnackBar(snackBar);
              }
              if (s is AddProfitSuccess) {
                var snackBar = Utils.buildSnackBar2(
                  contentType: ContentType.success,
                  context: c,
                  message: "Profit Request added successfully",
                );
                ScaffoldMessenger.of(c).showSnackBar(snackBar);
                Navigator.pop(c);
              }
            },
            builder: (c, s) {
              var cubit = AddProfitCubit.get(c);
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.03,
                  vertical: height * 0.02,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      RequestedCreditFields(
                        controller: _amountController,
                        validation: (value) {
                          if (value == null || value.isEmpty) {
                            return "Amount value cannot be empty";
                          } else if (num.parse(value) < 0) {
                            return "Amount value cannot be null";
                          } else {
                            var currBalance = ProfileCubit.get(context)
                                .userModel!
                                .data!
                                .partner!
                                .partnerBalance!;
                            if (num.parse(value) > num.parse(currBalance)) {
                              return "Request amount more than your balance";
                            }
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      NotesField(controller: _notesController),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      privacyPolicyLinkAndTermsOfService(),
                      SizedBox(
                        height: height * 0.04,
                      ),
                      Center(
                        child: s is AddProfitLoading
                            ? const Center(
                                child: BuildLoadingWidget(),
                              )
                            : BuildProfileButton(
                                formKey: _formKey,
                                passwordController: _passwordController,
                                textButton: 'Request',
                                futureFunction: () async {
                                  cubit.addNewProfit(
                                    password: _passwordController.text.trim(),
                                    amount: _amountController.text.trim(),
                                    notes: _notesController.text.trim(),
                                    paymentOption: "1",
                                  );
                                },
                              ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
  Widget privacyPolicyLinkAndTermsOfService() {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
      child: Center(
          child: Text.rich(
              TextSpan(
                  text: 'By continuing, you agree to our ', style: Theme.of(context).textTheme.titleMedium,
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Terms of Service', style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: AppColor.primaryColor
                    ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            context.read<DrawerCubit>().getTosData();
                            navigateTo(context, const TosScreen());                          }
                    ),
                    TextSpan(
                        text: ' and ', style: Theme.of(context).textTheme.titleMedium,
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Privacy Policy', style: Theme.of(context).textTheme.titleMedium!.copyWith(
                              color: AppColor.primaryColor
                          ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  context.read<DrawerCubit>().getTosData();
                                  navigateTo(context, const TosScreen());
                              }
                          )
                        ]
                    )
                  ]
              )
          )
      ),
    );
  }

}
