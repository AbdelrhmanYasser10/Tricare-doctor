import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tricares_doctor_app/core/component/Network%20Image/network_image.dart';
import 'package:tricares_doctor_app/core/component/SVG/svg.dart';
import 'package:tricares_doctor_app/features/appointments/models/schedule_model.dart';

import '../../../../core/Global Cubit/global_cubit.dart';
import '../../../../core/globle/color/shared_color.dart';
import '../../../../generated/l10n.dart';

class ScheduleCard extends StatelessWidget {
  final DayRooms daysSlots;
  const ScheduleCard({Key? key ,required this.daysSlots}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      width: double.infinity,
      height: height * 0.25,
      decoration: BoxDecoration(
        color: context.watch<GlobalCubit>().isLight ? Colors.white : Colors.black,
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
                      left: context.read<GlobalCubit>().local == "en" ? width * 0.02 : width * 0,
                      right: context.read<GlobalCubit>().local == "ar" ? width * 0.02 : width * 0,
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
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              S.of(context).timeSlot,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            SizedBox(
                              width: width ,
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
                                  return Container(
                                    width: width * 0.295,
                                    height: height * 0.05,
                                    decoration: BoxDecoration(
                                      color: AppColor.primaryColor,
                                      borderRadius: BorderRadius.circular(25.0),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        const Icon(
                                          Icons.access_time_sharp,
                                          color: Colors.white,
                                        ),
                                        Text(
                                          daysSlots.partnersSlots![index].roomtimeName!,
                                          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                            color: Colors.white,
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                BuildImage(
                    image: daysSlots.roomPic!,
                  fit: BoxFit.cover,
                  errorWidget: Container(
                    width: width * 0.33,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColor.primaryColor.withOpacity(0.4),
                      borderRadius: BorderRadius.only(
                        topRight: context.read<GlobalCubit>().local == "en" ? Radius.circular(15.0):Radius.circular(0.0),
                        topLeft: context.read<GlobalCubit>().local != "en" ? Radius.circular(15.0):Radius.circular(0.0),
                        bottomLeft: context.read<GlobalCubit>().local != "en" ? Radius.circular(15.0):Radius.circular(0.0),
                        bottomRight: context.read<GlobalCubit>().local == "en" ? Radius.circular(15.0):Radius.circular(0.0),
                      )
                    ),
                    child: Center(
                      child: BuildIconSvg(
                        name: "room.svg",
                        size: width * 0.33,
                        color: AppColor.primaryColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),


        ],
      ),
    );
  }
}
