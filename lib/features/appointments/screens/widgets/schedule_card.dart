import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tricares_doctor_app/features/appointments/models/schedule_model.dart';

import '../../../../core/Global Cubit/global_cubit.dart';
import '../../../../core/globle/color/shared_color.dart';

class ScheduleCard extends StatelessWidget {
  final PartnersRooms daysSlots;
  const ScheduleCard({Key? key ,required this.daysSlots}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      width: double.infinity,
      height: height * 0.25,
      padding:  EdgeInsets.symmetric(horizontal: width * 0.04),
      decoration: BoxDecoration(
        color: context.watch<GlobalCubit>().isLight ? Colors.white : Colors.black,
        borderRadius: BorderRadius.circular(15.0),
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
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Text(
                daysSlots.branchName!,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment:MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                    ),
                    SizedBox(
                      width: width * 0.009,
                    ),
                    Text(
                      daysSlots.branchLocation!,
                      style: Theme.of(context).textTheme.titleSmall,

                    ),
                  ],
                ),
              ),

              Expanded(
                child: Row(
                  mainAxisAlignment:MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.call,
                    ),
                    SizedBox(
                      width: width * 0.009,
                    ),
                    Text(
                      daysSlots.branchPhone!,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                  color: AppColor.primaryColor,
                  borderRadius: BorderRadius.circular(15.0)
              ),
              child: Padding(
                padding:  EdgeInsets.symmetric(
                    horizontal: width*0.05,
                    vertical: height*0.02
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.access_time_outlined,
                      color: Colors.white,
                      size: width * 0.07,
                    ),
                    SizedBox(
                      width: width * 0.02,
                    ),
                    Text(
                      daysSlots.roomtimeName!,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Colors.white,
                      ),

                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
