import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:tricares_doctor_app/core/globle/color/shared_color.dart';
import 'package:tricares_doctor_app/features/Rooms/screens/room_details_screen.dart';
import 'package:tricares_doctor_app/features/Rooms/screens/rooms_screen.dart';
import 'package:tricares_doctor_app/features/profits/screens/profit_details_screen.dart';
import 'package:tricares_doctor_app/features/profits/screens/profits_screen.dart';
import 'package:tricares_doctor_app/features/sessions/screens/session_details_screen.dart';
import 'package:tricares_doctor_app/features/sessions/screens/sessions_screen.dart';

import '../../../../core/functions/fucntions.dart';
import '../../../../features/appointments/cubits/appointement_cubit.dart';
import '../../../../features/appointments/screens/appointments_screen.dart';
import '../../cubit/notification_cubit.dart';

class BuildNotificationWidget extends StatelessWidget {
  final String action;
  final String message;
  final String date;
  final String time;
  final String id;
  final String actionId;
  final String iconString;
  final String read;
  final int index;

  const BuildNotificationWidget(
      {super.key,
      required this.action,
      required this.index,
      required this.message,
      required this.date,
      required this.time,
      required this.id,
      required this.iconString,
      required this.read,
      required this.actionId});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () async {
        if (read == "0") {
          context
              .read<NotificationCubit>()
              .readNotification(index: index, id: id);
        }


        switch (action) {
          case "partners_orders":
            if(int.parse(actionId) > 0){
              navigateTo(context,  ProfitsDetailsScreen(profitId: int.parse(actionId)));
            }
            else{

              navigateTo(context, const ProfitsScreen());
            }
            break;

          case "partners_rooms":
            if(int.parse(actionId) > 0){
              navigateTo(context,  RoomDetailsScreen(roomId: int.parse(actionId)));
            }
            else{
              navigateTo(context, const RoomsScreen());
            }
            break;

          case "partners_slots":
            context.read<AppointementCubit>().getSchedule();
            navigateTo(context, const AppointmentsScreen());
            break;

          case "partners_sessions":

            if(int.parse(actionId) > 0){
              navigateTo(context,   SessionDetailsScreen(sessionId: int.parse(actionId)));
            }
            else{
              
              navigateTo(context, const SessionsScreen(fromHome: false));
            }
            break;
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: read == "0" ? AppColor.primaryColor : null,
          borderRadius: BorderRadius.circular(8),
        ),
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(10),
        child: SizedBox(
          child: Row(
            children: [

              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      message,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: read == "0" ? Colors.white : Colors.black,
                      ),
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.date_range,
                              size: 15,
                              color: read == "0" ? Colors.white : Colors.black,
                            ),
                            SizedBox(
                              width: width * 0.01,
                            ),
                            Text(
                              DateFormat.yMMMMd().format(
                                DateTime.parse(
                                  date,
                                ),
                              ),
                              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                color: read == "0" ? Colors.white : Colors.black,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: width * 0.03,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.timer_outlined,
                              size: 15,
                              color: read == "0" ? Colors.white : Colors.black,
                            ),
                            SizedBox(
                              width: width * 0.01,
                            ),
                            Text(
                              formatTime(
                                int.parse(
                                  time,
                                ),
                              ),
                              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                color: read == "0" ? Colors.white : Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(width: width*0.02,),

              getIcon(iconString, width),
            ],
          ),
        ),
      ),
    );
  }



  Widget getIcon(String actionIcon,double width) {
    switch (actionIcon) {
      case "exclamation":
        return CircleAvatar(
          backgroundColor: Colors.blue.shade50,
          child: const Icon(
            Icons.warning_amber_rounded,
            color: Colors.blue,
          ),
        );
      case "success":
        return CircleAvatar(
          backgroundColor: Colors.green.shade50,
          child: const Icon(
            Icons.check_circle_outline,
            color: Colors.green,
          ),
        );
      case "times":
        return CircleAvatar(
          backgroundColor: Colors.red.shade50,
          child: const Icon(
            Icons.close,
            color: Colors.red,
          ),
        );
      default:
        return const SizedBox.shrink();
    }
  }
}
