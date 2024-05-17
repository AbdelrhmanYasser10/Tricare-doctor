import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tricares_doctor_app/core/Global%20Cubit/global_cubit.dart';
import 'package:tricares_doctor_app/core/network/Local/CashHelper.dart';
import 'package:tricares_doctor_app/features/appointments/cubits/appointement_cubit.dart';
import 'package:tricares_doctor_app/features/appointments/screens/widgets/schedule_card.dart';

import '../../../../core/component/Loading Widget/loading_widget.dart';
import '../../../../core/component/MessageWidget/message_widget.dart';
import '../../../../core/globle/color/shared_color.dart';
import '../../../../core/utils/utils.dart';


class ScheduleBodyConsumer extends StatelessWidget {
  const ScheduleBodyConsumer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return BlocConsumer<AppointementCubit, AppointementState>(
      listener: (context, state) {
        if(state is AppointementError){
          var snackBar = Utils.buildSnackBar2(
            contentType: ContentType.failure,
            context: context,
            message: state.message,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        var cubit = AppointementCubit.get(context);
        if(state is AppointementLoading){
          return const Center(
            child: BuildLoadingWidget(),
          );
        }
        else if(state is AppointementSuccess) {
          return Padding(
            padding:  EdgeInsets.symmetric(horizontal: width * 0.02 , vertical: height * 0.01),
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
                itemBuilder:(context, index) {
                  if(cubit.scheduleModel!.data!.partnersDaysSlots![index].partnersRooms!.isNotEmpty){
                    var daySlot = cubit.scheduleModel!.data!.partnersDaysSlots![index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          daySlot.name!,
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return ScheduleCard(daysSlots: daySlot.partnersRooms![index]);
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                height: height * 0.01,
                              );
                            },
                            itemCount: daySlot.partnersRooms!.length,
                        ),
                        const Divider(),
                      ],
                    );
                  }
                  else{
                    return const SizedBox.shrink();
                  }
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: height * 0.01,
                  );
                },
                itemCount: cubit.scheduleModel!.data!.partnersDaysSlots!.length,
            ),
          );
        }
        else if(state is AppointementError){
          return MessageWidget(
            width: width,
            height: height,
            heightImage: height,
            widthImage: width,
            imagePath: 'assets/images/error.png',
            message: 'Error while get data',
            clickBtn: () {
              cubit.getSchedule();
            },
            btnText: 'Reload',
          );
        }
        else if(state is NoInternetConnection){
          return MessageWidget(
            width: width,
            height: height,
            heightImage: height,
            widthImage: width,
            imagePath: 'assets/images/connection_error.svg',
            message: 'Check your internet connection',
            clickBtn: () {
              cubit.getSchedule();

            },
            btnText: 'Reload',
          );
        }
        else{
          return const SizedBox();
        }
      },
    );
  }
}
