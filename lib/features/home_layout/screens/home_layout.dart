import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tricares_doctor_app/core/globle/color/light_app_color.dart';
import 'package:tricares_doctor_app/core/network/Local/CashHelper.dart';
import 'package:tricares_doctor_app/features/profile/cubit/profile_cubit.dart';

import 'package:badges/badges.dart' as badges;

import 'package:tricares_doctor_app/features/profits/screens/profits_screen.dart';
import '../../../core/Global Cubit/global_cubit.dart';
import '../../../core/Notification/cubit/notification_cubit.dart';
import '../../../core/Notification/screens/notification.dart';
import '../../../core/functions/fucntions.dart';
import '../../../core/globle/color/shared_color.dart';
import '../../Drawer/screen/drawer_screen.dart';
import '../../home/screens/home_screen.dart';
import '../../profile/screen/Main Profile/main_profile_screen.dart';

class HomeLayoutScreen extends StatefulWidget {
  const HomeLayoutScreen({Key? key}) : super(key: key);

  @override
  State<HomeLayoutScreen> createState() => _HomeLayoutScreenState();
}

class _HomeLayoutScreenState extends State<HomeLayoutScreen> {
  List<String> icons = [
    'assets/icons/home.svg',
    'assets/icons/profits.svg',
    'assets/icons/person.svg',

  ];

  List<String> textNavigationBar =[
    'Home',
    'Profits',
    'Profile',
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocBuilder<GlobalCubit, GlobalState>(
      builder: (context, state) {
        var cubit = context.read<GlobalCubit>();
        return WillPopScope(
          onWillPop: ()async{
            if(context.read<GlobalCubit>().currentIndexScreen==0) {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      title: Text(
                        'Exit From Application',

                      ),
                      content: Text(
                        'Do you Want to Exit',
                        style: Theme
                            .of(context)
                            .textTheme
                            .labelLarge,

                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            SystemChannels.platform.invokeMethod(
                                'SystemNavigator.pop');
                          },
                          style: TextButton.styleFrom(
                              backgroundColor: LightAppColor.backgroundColor
                          ),
                          child: Text(
                            'Yes',
                          ),
                        ),
                        SizedBox(width: width * 0.01,),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: LightAppColor.backgroundColor,
                          ),
                          child: Text(
                            'No',
                          ),
                        ),
                        SizedBox(width: width * 0.02,),
                      ],

                    );
                  }
              );
            }
            else{

              context.read<GlobalCubit>().goToScreenAtIndex(0);

            }
            return false;
          },
          child: Scaffold(

            drawer: const DrawerScreen(),
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(height*0.08),
              child: AppBar(
                flexibleSpace: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Hero(
                      tag: 'logo',
                      child: Image.asset(
                        'assets/images/logo.png',
                        height: width*0.2,
                        width: width*0.3,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
                centerTitle: true,
                actions: [
                  SizedBox(width: width*0.02,),
                  CashHelper.getData(key: 'login') == null
                      ? GestureDetector(
                    onTap: () {
                      context.read<NotificationCubit>().getNotification();
                      navigateTo(context, NotificationScreen());
                    },
                    child: Icon(FontAwesomeIcons.solidBell),
                  )
                      : context.read<ProfileCubit>().userModel == null  || context.read<ProfileCubit>().userModel!.data!.newNotifications! == "0"?
                  GestureDetector(
                    onTap: () {
                      context.read<NotificationCubit>().getNotification();
                      navigateTo(context, NotificationScreen());
                    },
                    child:Icon(FontAwesomeIcons.solidBell),
                  )
                      :
                  GestureDetector(
                    onTap: (){
                      context.read<NotificationCubit>().getNotification();
                      navigateTo(context, NotificationScreen());
                    },
                    child: badges.Badge(
                      position: badges.BadgePosition.topEnd(top: -15, end: width*0.03),
                      badgeContent: Text(
                        context.read<ProfileCubit>().userModel!.data!.newNotifications!,
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontSize: 10,
                          color: Colors.white
                        ),
                      ),
                      child:Icon(FontAwesomeIcons.solidBell),
                    ),
                  ),
                  SizedBox(width: width*0.02,),
                ],

              ),
            ),
            body: PageView(
              controller: cubit.homeLayoutController,
              children: const [
                HomeScreen(),
                ProfitsScreen(),
                MainProfileScreen(),
              ],
              onPageChanged: (index){
                cubit.changeSelectedIndexNav(index);
              },
            ),
            bottomNavigationBar: AnimatedBottomNavigationBar.builder(
              itemCount: 3,
              tabBuilder: (index, isActive) {
                final color = isActive ? AppColor.primaryColor : Colors.grey;
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      icons[index],
                      color: color,
                      width: 20,
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Text(
                      textNavigationBar[index],
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: color,
                      ),
                    ),
                  ],
                );
              },
              activeIndex: cubit.currentIndexScreen,
              gapLocation: GapLocation.none,
              notchSmoothness: NotchSmoothness.verySmoothEdge,

              leftCornerRadius: 32,
              rightCornerRadius: 32,
              height: 70,
              onTap: (index) {
                if(index == 2){
                  if(CashHelper.prefs.getBool('login')!=null){
                    if(CashHelper.prefs.getBool('login')!) {
                      /*ProfitsCubit.get(context).getProfitsTable(
                          token: CashHelper.prefs.getString('token')!,
                      );
                      PaginatorCubit.get(context).getMaximumPage();*/
                    }
                  }
                }
                cubit.changeSelectedIndexNav(index);
                cubit.homeLayoutController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.linear,
                );
              },
              //other params
            ),

          ),
        );
      },
    );
  }
}
