import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tricares_doctor_app/core/component/Loading%20Widget/loading_widget.dart';
import 'package:tricares_doctor_app/features/profile/cubit/profile_cubit.dart';

import '../../../../core/component/SVG/svg.dart';
import '../../../../core/globle/color/shared_color.dart';
import '../../../../generated/l10n.dart';

class BalanceCardConsumer extends StatelessWidget {
  const BalanceCardConsumer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is GetUserDataError) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        if (state is GetUserDataLoading) {
          return const Center(
            child: LinearProgressIndicator(
              color: AppColor.primaryColor,
            ),
          );
        }
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.026,
            vertical: height * 0.012,
          ),
          child: Container(
            width: width,
            height: height * 0.178,
            padding: EdgeInsets.symmetric(vertical: height * 0.02),
            decoration: BoxDecoration(
              color: AppColor.primaryColor.withOpacity(0.6),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BuildIconSvg(
                  name: 'money.svg',
                  color: AppColor.primaryColor,
                  size: height * 0.1,
                ),
                Text(
                  '${S.of(context).balance} ${ProfileCubit.get(context).userModel!.data!.partner!.partnerBalance!}',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: AppColor.primaryColor),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
