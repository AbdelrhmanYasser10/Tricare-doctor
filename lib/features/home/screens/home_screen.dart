import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tricares_doctor_app/features/Authentication/screens/Login/login_screen.dart';
import 'package:tricares_doctor_app/features/home/screens/widget/great_perosn.dart';
import 'package:tricares_doctor_app/features/home/screens/widget/my_tab_container.dart';
import 'package:tricares_doctor_app/features/home_layout/cubits/app_cubit/app_cubit.dart';
import '../../../core/component/ElevatedButton Widget/build_elevated_button.dart';
import '../../../core/component/Loading Widget/loading_widget.dart';
import '../../../core/functions/fucntions.dart';
import '../../../core/network/Local/CashHelper.dart';
import '../../../core/widgets/Carousel Widget/carsousel_widget_screen.dart';
import '../../../core/widgets/Error Widget/error_widget.dart';
import '../../../core/widgets/No Internet Widget/no_internet_widget.dart';
import '../../../generated/l10n.dart';
import '../../Authentication/screens/Register/register_screen.dart';
import '../../profile/cubit/profile_cubit.dart' as pc;
import 'widget/title_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var cubit = context.read<AppCubit>();
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return state is NoInternetConnectionHome
            ? NoInternetWidget(onPressed: () {
                cubit.getHomeData();
              })
            : cubit.homeModel == null
                ? const BuildLoadingWidget()
                : cubit.homeModel!.hasError
                    ? BuildErrorWidget(error: cubit.homeModel!.errors.join(' '))
                    : Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const GreatPerson(),
                              SizedBox(
                                height: height * 0.02,
                              ),
                              CarouselSliderWidget(
                                width: double.infinity,
                                height: height,
                                images: cubit.homeModel!.data!.images,
                              ),


                              TitleWidget(
                                title: S.of(context).about,
                                onTap: () {},
                                showSeeAll: false,
                              ),
                              MyTabContainer(
                                height: height,
                                width: width,
                                cubit: AppCubit.get(context),
                              ),
                              SizedBox(
                                height: height * 0.02,
                              ),
                              BlocBuilder<pc.ProfileCubit, pc.ProfileState>(
                                builder: (context, state) {
                                  if(CashHelper.prefs.get('login') ==null) {
                                    return Column(
                                      children: [
                                        BuildButton(
                                          text: S.of(context).joinOurPartners,
                                          onPressed: () {
                                            navigateTo(context,const RegisterScreen());
                                          },
                                        ),
                                        BuildButton(
                                          text:S.of(context).login,
                                          onPressed: () {
                                            navigateTo(context,const LoginScreen());
                                          },
                                        ),

                                      ],
                                    );
                                  }
                                  else{
                                    return const SizedBox.shrink();
                                  }
                                },
                              ),
                              SizedBox(
                                height: height * 0.03,
                              ),
                            ],
                          ),
                        ),
                      );
      },
    );
  }
}
