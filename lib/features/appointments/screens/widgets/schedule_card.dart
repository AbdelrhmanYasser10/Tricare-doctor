import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tricares_doctor_app/core/component/Network%20Image/network_image.dart';
import 'package:tricares_doctor_app/core/component/SVG/svg.dart';
import 'package:tricares_doctor_app/core/functions/fucntions.dart';
import 'package:tricares_doctor_app/features/appointments/models/schedule_model.dart';
import 'package:tricares_doctor_app/features/appointments/screens/appointments_details_screen.dart';

import '../../../../core/Global Cubit/global_cubit.dart';
import '../../../../core/globle/color/shared_color.dart';

class ScheduleCard extends StatelessWidget {
  final DayRooms daysSlots;
  const ScheduleCard({Key? key, required this.daysSlots}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      width: double.infinity,
      height: height * 0.25,
      decoration: BoxDecoration(
        color:
            context.watch<GlobalCubit>().isLight ? Colors.white : Colors.black,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: context.read<GlobalCubit>().local == "en"
                          ? width * 0.02
                          : width * 0,
                      right: context.read<GlobalCubit>().local == "ar"
                          ? width * 0.02
                          : width * 0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              daysSlots.roomName!,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            Text(
                              daysSlots.branchName!,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius:  BorderRadius.only(
                    topRight: context.read<GlobalCubit>().local == "en"
                        ? const Radius.circular(15.0)
                        : const Radius.circular(0.0),
                    topLeft: context.read<GlobalCubit>().local != "en"
                        ? const Radius.circular(15.0)
                        : const Radius.circular(0.0),
                  ),
                  child: BuildImage(
                    image: daysSlots.roomPic!,
                    fit: BoxFit.cover,
                    errorWidget: Container(
                      width: width * 0.25,
                      height: double.infinity,
                      decoration: BoxDecoration(
                          color: AppColor.primaryColor.withOpacity(0.4),
                          borderRadius: BorderRadius.only(
                            topRight: context.read<GlobalCubit>().local == "en"
                                ? const Radius.circular(15.0)
                                : const Radius.circular(0.0),
                            topLeft: context.read<GlobalCubit>().local != "en"
                                ? const Radius.circular(15.0)
                                : const Radius.circular(0.0),
                          ),
                      ),
                      child: Center(
                        child: BuildIconSvg(
                          name: "room.svg",
                          size: width * 0.25,
                          color: AppColor.primaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: height * 0.009, horizontal: width * 0.02),
            child: SizedBox(
              width: width,
              height: height * 0.05,
              child: ListView.separated(
                itemCount: daysSlots.partnersSlots!.length,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                separatorBuilder: (context, index) {
                  return SizedBox(
                    width: width * 0.01,
                  );
                },
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: (){
                      navigateTo(
                        context,
                        AppointmentDetailsScreen(
                            appointmentId: int.parse(daysSlots.partnersSlots![index].pARTSLOTID!),
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: width * 0.025,
                        vertical: height * 0.01,
                      ),
                      decoration: BoxDecoration(
                        color: getTimeSlotStatus(
                            daysSlots.partnersSlots![index].pARTSLOTSTATUS!),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Icon(
                            Icons.access_time_sharp,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: width * 0.02,
                          ),
                          Text(
                            daysSlots.partnersSlots![index].roomtimeName!,
                            style:
                                Theme.of(context).textTheme.titleSmall!.copyWith(
                                      color: Colors.black,
                                    ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color getTimeSlotStatus(String status) {
    switch (status) {
      case "0":
        return const Color(0xfff8d7da);
      case "1":
        return const Color(0xffffffff);
      case "2":
        return const Color(0xffd1e7dd);
      case "3":
        return const Color(0xfffff3cd);
      default:
        return const Color(0xffffffff);
    }
  }
}
