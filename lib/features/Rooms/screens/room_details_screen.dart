import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tricares_doctor_app/core/component/Loading%20Widget/loading_widget.dart';
import 'package:tricares_doctor_app/core/component/SVG/svg.dart';
import 'package:tricares_doctor_app/core/widgets/Build%20Circle%20Image/build_circle_image.dart';
import 'package:tricares_doctor_app/features/Rooms/cubits/room_details_cubit/room_details_cubit.dart';
import 'package:tricares_doctor_app/features/Rooms/screens/widgets/name_position_top_Widget.dart';

import '../../../core/component/MessageWidget/message_widget.dart';
import '../../../core/component/Network Image/network_image.dart';
import '../../../core/functions/fucntions.dart';
import '../../../core/globle/color/light_app_color.dart';
import '../../../core/globle/color/shared_color.dart';

class RoomDetailsScreen extends StatelessWidget {
  final int roomId;

  const RoomDetailsScreen({Key? key, required this.roomId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => RoomDetailsCubit()..getRoomDetails(roomId: roomId),
      child: BlocConsumer<RoomDetailsCubit, RoomDetailsState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = RoomDetailsCubit.get(context);
          if(state is RoomDetailsLoading){
            return const Scaffold(
              body:  Center(
                child: BuildLoadingWidget(),
              ),
            );
          }
          else if(state is RoomDetailsSuccess) {
            return Scaffold(
              body: SafeArea(
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Container(
                      width: width,
                      height: height * 0.5,
                      color: AppColor.primaryColor,
                    ),
                    Container(
                      width: width,
                      height: height,
                      margin:
                      EdgeInsets.only(top: width * 0.18, bottom: height * 0.1),
                      padding: EdgeInsets.only(top: width * 0.22),
                      decoration: const BoxDecoration(
                        color: LightAppColor.backgroundColor,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20),
                        ),
                      ),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: width * 0.05,
                              ),
                              NamePositionTopWidget(
                                name: cubit.roomsDetailsModel!.data!.room!.roomName!,
                                branch:cubit.roomsDetailsModel!.data!.room!.branchName!,
                                location:'',
                              ),
                              SizedBox(
                                height: width * 0.06,
                              ),
                              Text(
                                'Description',
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .titleLarge,
                              ),
                              SizedBox(
                                height: width * 0.02,
                              ),
                              Text(
                                cleanHtmlToPlainText(
                                    cubit.roomsDetailsModel!
                                        .data!.room!.roomDescription!,
                                    maxLength: 200),
                                style:
                                Theme
                                    .of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                  color: Colors.grey.shade800,
                                ),
                                maxLines: 5,
                              ),
                              SizedBox(
                                height: width * 0.02,
                              ),
                              Text(
                                "Time Slot",
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .titleLarge,
                              ),
                              ListView.separated(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder:(context, index) {
                                  if(cubit.roomsDetailsModel!.data!.partnersDaysRooms![index].partnersRooms!.isNotEmpty){
                                    var daySlot = cubit.roomsDetailsModel!.data!.partnersDaysRooms![index];
                                    return Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          daySlot.name!,
                                          style: Theme.of(context).textTheme.titleMedium,
                                        ),
                                        SizedBox(
                                          height: height * 0.01,
                                        ),
                                        SizedBox(
                                          height:height * 0.05,
                                          child: ListView.separated(
                                            physics: const BouncingScrollPhysics(),
                                            itemBuilder: (context, index) {
                                              return Center(
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      color: AppColor.primaryColor,
                                                      borderRadius: BorderRadius.circular(15.0)
                                                  ),
                                                  child: Padding(
                                                    padding:  EdgeInsets.symmetric(
                                                        horizontal: width*0.02,
                                                        vertical: height*0.01
                                                    ),
                                                    child: Row(
                                                      mainAxisSize: MainAxisSize.min,
                                                      children: [
                                                        Icon(
                                                          Icons.access_time_outlined,
                                                          color: Colors.white,
                                                          size: width * 0.04,
                                                        ),
                                                        SizedBox(
                                                          width: width * 0.02,
                                                        ),
                                                        Text(
                                                          daySlot.partnersRooms![index].roomtimeName!,
                                                          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                                            color: Colors.white,
                                                          ),

                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                            separatorBuilder: (context, index) {
                                              return SizedBox(
                                                width: height * 0.02,
                                              );
                                            },
                                            scrollDirection: Axis.horizontal,
                                            itemCount: daySlot.partnersRooms!.length,
                                          ),
                                        ),

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
                                itemCount: cubit.roomsDetailsModel!.data!.partnersDaysRooms!.length,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    buildContainerImage(width , cubit.roomsDetailsModel!.data!.room!.roomPics!),
                  ],
                ),
              ),
            );
          }
          else if(state is RoomDetailsError){
            return Scaffold(
              body: MessageWidget(
                width: width,
                height: height,
                heightImage: height,
                widthImage: width,
                imagePath: 'assets/icons/error.svg',
                message: 'Error while get data',
                clickBtn: () {
                  cubit.getRoomDetails(roomId: roomId);
                },
                btnText: 'Reload',
              ),
            );
          }
          else if(state is NoInternetConnection){
            return Scaffold(
              body: MessageWidget(
                width: width,
                height: height,
                heightImage: height,
                widthImage: width,
                imagePath: 'assets/images/connection_error.svg',
                message: 'Check your internet connection',
                clickBtn: () {
                  cubit.getRoomDetails(roomId: roomId);

                },
                btnText: 'Reload',
              ),
            );
          }
          else{
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }

  Padding buildContainerImage(double width , String image) {
    return Padding(
      padding:  EdgeInsets.all(width * 0.04),
      child: Container(
        padding: EdgeInsets.all(width * 0.01),
        decoration: const BoxDecoration(
          color: LightAppColor.backgroundColor,
          shape: BoxShape.circle,
        ),
        child: CircleAvatar(
          backgroundColor: AppColor.primaryColor.withOpacity(0.6),
          radius: width * 0.2,
          child: BuildImage(
            image: image,
            radius: width * 0.02,
            fit: BoxFit.cover,
            errorWidget: BuildIconSvg(
              color: AppColor.primaryColor,
              name: "room.svg",
              size: width * 0.3,
            ),
          ),
        ),
      ),
    );
  }
}
