import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tricares_doctor_app/core/Global%20Cubit/global_cubit.dart';
import 'package:tricares_doctor_app/core/functions/fucntions.dart';
import 'package:tricares_doctor_app/core/globle/color/shared_color.dart';
import 'package:tricares_doctor_app/core/widgets/Login%20First/login_first_widget.dart';
import 'package:tricares_doctor_app/features/Drawer/screen/drawer_screen.dart';
import 'package:tricares_doctor_app/features/profile/cubit/profile_cubit.dart';
import 'package:tricares_doctor_app/features/profits/screens/add_new_profit_screen.dart';
import 'package:tricares_doctor_app/features/profits/screens/widgets/bodyConsumer.dart';

import '../../../core/network/Local/CashHelper.dart';
import '../../../generated/l10n.dart';

class ProfitsScreen extends StatefulWidget {
  const ProfitsScreen({Key? key}) : super(key: key);

  @override
  State<ProfitsScreen> createState() => _ProfitsScreenState();
}

class _ProfitsScreenState extends State<ProfitsScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      drawer: const DrawerScreen(
        isFromHome: false,
      ),
      key: _key,
      body: Stack(
        children: [
          CashHelper.getData(key: 'login') == null
              ? BuildLoginFirst(
                  width: width,
                  height: height,
                  heightImage: width,
                  widthImage: width,
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: height / 3,
                    ),
                    const Expanded(child: ProfitsBodyConsumer()),
                  ],
                ),
          CashHelper.getData(key: 'login') == null
              ? const SizedBox.shrink()
              : Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: height / 3,
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 0.033,
                      vertical: height * 0.033,
                    ),
                    decoration: const BoxDecoration(
                      color: AppColor.primaryColor,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(15),
                        bottomLeft: Radius.circular(15),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                _key.currentState!.openDrawer();
                              },
                              icon: const Icon(
                                Icons.menu,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              S.of(context).myProfits,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(color: Colors.white),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Text(
                          S.of(context).currentBalance,
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(color: Colors.white),
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        BlocConsumer<ProfileCubit, ProfileState>(
                          listener: (context, state) {},
                          builder: (context, state) {
                            if (context.read<ProfileCubit>().userModel == null || state is GetUserDataLoading) {
                              return const LinearProgressIndicator(
                                color: Colors.white,
                              );
                            } else {
                              return Text(
                                "${context.read<GlobalCubit>().local == "en" ? "EGP" : "ج.م"} ${context.read<ProfileCubit>().userModel!.data!.partner!.partnerBalance!}",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineLarge!
                                    .copyWith(color: Colors.white),
                              );
                            }
                          },
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: (){
                            navigateTo(context,const AddNewProfitScreen());
                          },
                          child: Center(
                            child: Container(
                              width: width * 0.9,
                              height: height * 0.07,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Center(
                                child: Text(
                                  S.of(context).addNewOrder,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall!
                                      .copyWith(color: AppColor.primaryColor),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
