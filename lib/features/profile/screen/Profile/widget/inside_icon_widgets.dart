import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tricares_doctor_app/core/component/Loading%20Widget/loading_widget.dart';
import 'package:tricares_doctor_app/core/functions/fucntions.dart';
import 'package:tricares_doctor_app/core/network/Local/CashHelper.dart';
import 'package:tricares_doctor_app/features/home/screens/widget/title_widget.dart';
import 'package:tricares_doctor_app/features/profile/cubit/profile_cubit.dart';

import '../../../../../generated/l10n.dart';


class InsideIconWidget extends StatelessWidget {
  const InsideIconWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late List<String> categoriesIcon = [
      'assets/images/schedule.png',
      'assets/images/examination.png',
      'assets/images/investment.png',
      'assets/images/profits.png',
    ];



    var width = MediaQuery.of(context).size.width;

    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is GetUserDataSuccess) {

        }
      },
      builder: (context, state) {
        if(CashHelper.prefs.getBool('login')!=null) {
          if (state is GetUserDataLoading ||
              ProfileCubit
                  .get(context)
                  .userModel == null) {
            return const Center(
              child: BuildLoadingWidget(),
            );
          } else {
            var cubit = ProfileCubit.get(context);
            return Column(
              children: [
                CashHelper.prefs.getBool('login') != null
                    ? TitleWidget(
                  title: S.of(context).check,
                  onTap: () {},
                  showSeeAll: false,
                )
                    : const SizedBox.shrink(),
                GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4, // number of items in each row
                      mainAxisSpacing: 8.0, // spacing between rows
                      crossAxisSpacing: 8.0, // spacing between columns
                    ),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      if (cubit.categoriesName[index] != '') {
                        return InkWell(
                          onTap: () {
                            navigateTo(context, cubit.screens[index]);
                          },
                          child: Column(
                            children: [
                              Expanded(
                                child: SizedBox(
                                  width: width,
                                  child: Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Image.asset(categoriesIcon[index]),
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                cubit.categoriesName[index],
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              )
                            ],
                          ),
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    }),
              ],
            );
          }
        }
        else{
          return const SizedBox.shrink();
        }
      },
    );
  }
}
