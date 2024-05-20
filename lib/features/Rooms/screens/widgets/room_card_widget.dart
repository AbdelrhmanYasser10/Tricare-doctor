import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tricares_doctor_app/core/Global%20Cubit/global_cubit.dart';
import 'package:tricares_doctor_app/core/component/ElevatedButton%20Widget/build_elevated_button.dart';
import 'package:tricares_doctor_app/core/component/SVG/svg.dart';
import 'package:tricares_doctor_app/core/functions/fucntions.dart';
import 'package:tricares_doctor_app/features/Rooms/models/rooms_model.dart';
import 'package:tricares_doctor_app/features/Rooms/screens/room_details_screen.dart';

import '../../../../core/globle/color/shared_color.dart';

class RoomCard extends StatelessWidget {
  final Rooms room;
  const RoomCard({Key? key, required this.room}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: height * 0.0176,
        horizontal: width * 0.0265,
      ),
      decoration: BoxDecoration(
        color:
            context.read<GlobalCubit>().isLight ? Colors.white : Colors.black,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: width * 0.08,
                backgroundColor: AppColor.primaryColor.withOpacity(0.6),
                child: BuildIconSvg(
                  name: 'star.svg',
                  color: AppColor.primaryColor,
                  size: width * 0.08,
                ),
              ),
              SizedBox(
                width: width * 0.02,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      room.roomName!,
                      style: Theme.of(context).textTheme.headlineSmall,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      room.branchName!,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: width * 0.02,
              ),
            ],
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.location_on,
                    ),
                    SizedBox(
                      width: width * 0.0019,
                    ),
                    Text(
                      room.branchLocation!,
                      style: Theme.of(context).textTheme.titleSmall,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.call,
                    ),
                    SizedBox(
                      width: width * 0.0019,
                    ),
                    Text(
                      room.branchPhone!,
                      style: Theme.of(context).textTheme.titleSmall,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ),
            ],
          ),

          const Divider(),

          BuildButton(
            text: 'Show Timeslot',
            onPressed: () {
              navigateTo(
                  context,
                  RoomDetailsScreen(
                    roomId: int.parse(room.rOOMID!),
                  ),
              );
            },
          ),
        ],
      ),
    );
  }
}