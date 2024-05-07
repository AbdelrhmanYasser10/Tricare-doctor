import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tricares_doctor_app/features/examination/screens/examination_screen.dart';
import 'package:tricares_doctor_app/features/profits/screens/profits_screen.dart';
import '../../../core/component/SVG/svg.dart';
import '../../../core/globle/color/shared_color.dart';
import '../../Drawer/screen/drawer_screen.dart';
import '../../home/screens/home_screen.dart';
import '../../profile/screen/Main Profile/main_profile_screen.dart';
import '../cubits/app_cubit/app_cubit.dart';

class HomeLayoutScreen extends StatefulWidget {
  const HomeLayoutScreen({Key? key}) : super(key: key);

  @override
  State<HomeLayoutScreen> createState() => _HomeLayoutScreenState();
}

class _HomeLayoutScreenState extends State<HomeLayoutScreen> {
  List<String> icons = [
    'assets/icons/home.svg',
    'assets/icons/book.svg',
    'assets/icons/profits.svg',
    'assets/icons/person.svg',

  ];

  List<String> textNavigationBar =[
    'Home',
    'Examinations',
    'Profits',
    'Profile',
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        var cubit = context.read<AppCubit>();
        return Scaffold(

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
                IconButton(onPressed: (){}, icon: const BuildIconSvg(name: 'notification.svg',color: Colors.black,)),
              ],

            ),
          ),
          body: PageView(
            controller: cubit.homeLayoutController,
            children: const [
              HomeScreen(),
              ExaminationsScreen(
                fromHome: false,
              ),
              ProfitsScreen(),
              MainProfileScreen(),
            ],
            onPageChanged: (index){
              cubit.changeSelectedIndexNav(index);
            },
          ),
          bottomNavigationBar: AnimatedBottomNavigationBar.builder(
            itemCount: 4,
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
              cubit.changeSelectedIndexNav(index);
              cubit.homeLayoutController.animateToPage(
                index,
                duration: const Duration(milliseconds: 250),
                curve: Curves.linear,
              );
            },
            //other params
          ),

        );
      },
    );
  }
}
