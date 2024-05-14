import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tricares_doctor_app/features/Drawer/screen/widget/login_widget.dart';
import 'package:tricares_doctor_app/features/Drawer/screen/widget/not_sign_in_widget.dart';

import '../../../core/component/Loading Widget/loading_widget.dart';
import '../../../core/network/Local/CashHelper.dart';
import '../../profile/cubit/profile_cubit.dart';


class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        var cubit = context.read<ProfileCubit>();
        return Drawer(
          child: CashHelper.getData(key: 'login') == true?
          cubit.userModel == null ?
          const BuildLoadingWidget() :
          const DrawerLoginWidget() :
         const NotSignInWidget(),

        );
      },
    );
  }
}
