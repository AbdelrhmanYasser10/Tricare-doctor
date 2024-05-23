import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tricares_doctor_app/features/appointments/cubits/appointement_cubit.dart';
import 'package:tricares_doctor_app/features/appointments/screens/widgets/schedule_card.dart';

import '../../../../core/component/Loading Widget/loading_widget.dart';
import '../../../../core/component/MessageWidget/message_widget.dart';
import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/Empty Data Widget/empty_data_widget.dart';
import '../../../../generated/l10n.dart';


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
            padding:  EdgeInsets.symmetric(
                horizontal: width * 0.02 ,
                vertical: height * 0.01,
            ),
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
                itemBuilder:(context, index) {
                  if(cubit.scheduleModel!.data!.partnersDaysRoomsSlots![index].dayRooms!.isNotEmpty){
                    var daySlot = cubit.scheduleModel!.data!.partnersDaysRoomsSlots![index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          daySlot.dayName!,
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return ScheduleCard(daysSlots: daySlot.dayRooms![index]);
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                height: height * 0.01,
                              );
                            },
                            itemCount: daySlot.dayRooms!.length,
                        ),
                      ],
                    );
                  }
                  else{
                    return BuildEmptyDataWidget();
                  }
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: height * 0.01,
                  );
                },
                itemCount: cubit.scheduleModel!.data!.partnersDaysRoomsSlots!.length,
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
            message: S.of(context).errorHappenedUnExpected,
            clickBtn: () {
              cubit.getSchedule();
            },
            btnText: S.of(context).reload,
          );
        }
        else if(state is NoInternetConnection){
          return MessageWidget(
            width: width,
            height: height,
            heightImage: height,
            widthImage: width,
            imagePath: 'assets/images/connection_error.svg',
            message: S.of(context).checkInternet,
            clickBtn: () {
              cubit.getSchedule();

            },
            btnText: S.of(context).reload,
          );
        }
        else{
          return const SizedBox();
        }
      },
    );
  }
}
