import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tricares_doctor_app/features/Drawer/screen/widget/login_widget.dart';
import 'package:tricares_doctor_app/features/Drawer/screen/widget/not_sign_in_widget.dart';

import '../../../core/component/Loading Widget/loading_widget.dart';
import '../../../core/network/Local/CashHelper.dart';
import '../../profile/cubit/profile_cubit.dart';


class DrawerScreen extends StatelessWidget {
  final bool isFromHome;
  const DrawerScreen({super.key ,  this.isFromHome = true});

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        var cubit = context.read<ProfileCubit>();
        return Drawer(
          child: CashHelper.getData(key: 'login') == true?
          cubit.userModel == null ?
          const BuildLoadingWidget() :
           DrawerLoginWidget(
            isFromHome: isFromHome,
          ) :
         const NotSignInWidget(),

        );
      },
    );
  }
}
