import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:tab_container/tab_container.dart';
import 'package:tricares_doctor_app/core/Global%20Cubit/global_cubit.dart';
import 'package:tricares_doctor_app/core/component/Loading%20Widget/loading_widget.dart';
import 'package:tricares_doctor_app/core/globle/color/light_app_color.dart';
import 'package:tricares_doctor_app/features/home/cubits/home_cubit.dart';
import '../../../../core/component/MessageWidget/message_widget.dart';
import '../../../home_layout/cubits/app_cubit/app_cubit.dart';

class MyTabContainer extends StatefulWidget {
  final double height;
  final double width;
  final AppCubit cubit;

  const MyTabContainer({
    super.key,
    required this.height,
    required this.width,
    required this.cubit,
  });

  @override
  State<MyTabContainer> createState() => _MyTabContainerState();
}

class _MyTabContainerState extends State<MyTabContainer> with TickerProviderStateMixin{
  String someLorem =
  """Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla dapibus felis sed vestibulum elementum. Fusce dolor tortor, euismod ut quam ut, lacinia volutpat tellus. Ut eget egestas lorem. Nullam tellus nisi, efficitur sed varius nec, pellentesque nec massa. Etiam venenatis, turpis faucibus pretium aliquam, quam erat gravida quam, scelerisque posuere erat enim ac dui. Pellentesque sit amet lacinia ante. Curabitur quis dignissim diam. Quisque bibendum lectus sed nulla faucibus, ut ornare mi tincidunt. Fusce eu libero eget ante rhoncus condimentum quis in massa. Sed eget elit erat. Pellentesque bibendum accumsan imperdiet. Donec congue tortor neque, in aliquet libero tincidunt ut. Etiam venenatis, ante sit amet dapibus eleifend, neque arcu interdum erat, in imperdiet eros sapien eu sapien. Cras elementum, felis ac rutrum sodales, sapien dui hendrerit justo, convallis fringilla nulla diam sed arcu. Quisque lacinia, orci eu consectetur cursus, elit nibh laoreet nisl, eu elementum ante felis ac elit.

Aliquam pellentesque urna odio, non tristique lorem euismod ac. Sed luctus odio at mi interdum vestibulum. Nunc consectetur non nunc eget volutpat. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nunc eu lorem ante. Maecenas finibus condimentum commodo. Donec tortor orci, luctus in bibendum finibus, pharetra ac nibh. Cras porttitor mattis dictum. Aliquam laoreet sed nisi id rhoncus. Aliquam non faucibus nibh, ac accumsan nibh. Sed facilisis ipsum sit amet sollicitudin pharetra. Nunc ultricies mi eget velit viverra iaculis. Sed condimentum, risus et blandit lacinia, nisl lorem aliquet magna, sit amet lobortis odio magna ut ante. Nulla mollis congue enim, at malesuada diam. Duis eu odio vitae purus fringilla placerat nec vitae nibh. Nunc arcu eros, mattis sit amet dignissim eu, pretium pretium elit.""";

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if(state is TabsLoadedWithError) {
          if (kDebugMode) {
            print(state.message);
          }
        }
      },
      builder: (context, state) {
        var width = MediaQuery.of(context).size.width;
        var height = MediaQuery.of(context).size.height;
        var cubit = HomeCubit.get(context);
        if(state is TabsDataLoading){
          return const Center(
            child: BuildLoadingWidget(),
          );
        }
        else if(state is TabsLoaded) {
          if(cubit.titles.isEmpty){
            return const SizedBox();
          }
          else {
            TabController controller = TabController(length: cubit.titles.length,vsync: this);
            controller.index = context.read<GlobalCubit>().local == "ar" ? cubit.titles.length - 1 : 0;
            return SizedBox(
              height: widget.height * 0.4,
              child: TabContainer(
                color: LightAppColor.foreGroundColors,
                controller: controller,
                selectedTextStyle: GoogleFonts.cairo(
                  color: LightAppColor.textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
                unselectedTextStyle: GoogleFonts.cairo(
                  color: Colors.grey,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
                tabs: cubit.titles,
                children: cubit.content,

              ),
            );
          }
        }
        else if(state is TabsLoadedWithError){
          return MessageWidget(
            width: width / 3,
            height: height / 3,
            heightImage: height / 3,
            widthImage: width / 3,
            imagePath: 'assets/icons/error.svg',
            message: 'Error while get data',
            clickBtn: () {
              cubit.getTabs();
            },
            btnText: 'Reload',
          );
        }
        else if (state is NoInternetConnection){
          return MessageWidget(
            width: width / 3,
            height: height / 3,
            heightImage: height / 3,
            widthImage: width / 3,
            imagePath: 'assets/images/connection_error.svg',
            message: 'Check your internet connection',
            clickBtn: () {
              cubit.getTabs();
            },
            btnText: 'Reload',
          );
        }
        else {
          return const SizedBox();
        }
      },
    );
  }

  Widget _buildTabContent({
    required double height,
    required double width,
    required String htmlContent,
  }) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.03, vertical: height * 0.03),
        child: HtmlWidget(
          htmlContent,
          textStyle: GoogleFonts.cairo(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
