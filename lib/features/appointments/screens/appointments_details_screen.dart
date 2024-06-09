import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tricares_doctor_app/core/component/MessageWidget/message_widget.dart';
import 'package:tricares_doctor_app/features/appointments/cubits/appointment_details_cubit/appointment_details_cubit.dart';
import 'package:tricares_doctor_app/features/appointments/screens/widgets/top_widget.dart';

import '../../../core/component/Loading Widget/loading_widget.dart';

import '../../../core/component/Network Image/network_image.dart';
import '../../../core/component/SVG/svg.dart';
import '../../../core/functions/fucntions.dart';
import '../../../core/globle/color/light_app_color.dart';
import '../../../core/globle/color/shared_color.dart';
import '../../../core/utils/utils.dart';
import '../../../core/widgets/Build Password First/build_password_first.dart';
import '../../../core/widgets/Down Button Stack/down_button_stack.dart';
import '../../../generated/l10n.dart';
import '../cubits/appointement_cubit.dart' as ac;

class AppointmentDetailsScreen extends StatefulWidget {
  final int appointmentId;

  const AppointmentDetailsScreen({Key? key, required this.appointmentId})
      : super(key: key);

  @override
  State<AppointmentDetailsScreen> createState() =>
      _AppointmentDetailsScreenState();
}

class _AppointmentDetailsScreenState extends State<AppointmentDetailsScreen> {
  var passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    context.read<AppointmentDetailsCubit>().getDetails(id: widget.appointmentId);
  }
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop)async{
        FocusScope.of(context).unfocus();
        await Future.delayed(const Duration(seconds: 1));
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            BlocConsumer<AppointmentDetailsCubit, AppointmentDetailsState>(
              listener: (context, state) {
                if (state is AppointmentDetailsError) {
                  var snackBar = Utils.buildSnackBar2(
                    contentType: ContentType.failure,
                    context: context,
                    message: state.message,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
                if(state is TimeSlotUpdateSuccessfully){
                  context.read<ac.AppointementCubit>().getSchedule();
                  Navigator.pop(context);
                  if(state.hasError){
                    var snackBar = Utils.buildSnackBar2(
                        contentType: ContentType.failure,
                        context: context,
                        message: state.errors[0]);
                    ScaffoldMessenger.of(
                        context)
                        .showSnackBar(snackBar);
                  }
                  else{
                    var snackBar = Utils.buildSnackBar2(
                        contentType: ContentType.success,
                        context: context,
                        message: state.messages[0]);
                    ScaffoldMessenger.of(
                        context)
                        .showSnackBar(snackBar);

                  }
                }
                if(state is TimeSlotUpdateError){
                  print(state.message);
                  Navigator.pop(context);
                  context.read<ac.AppointementCubit>().getSchedule();
                }
              },
              builder: (context, state) {
                var cubit = AppointmentDetailsCubit.get(context);
                if (state is AppointmentDetailsLoading || state is TimeSlotUpdateLoading) {
                  return const Center(
                    child: BuildLoadingWidget(),
                  );
                } else if (state is AppointmentDetailsSuccess) {
                  return Scaffold(
                    body: SafeArea(
                      child: Form(
                        key: formKey,
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
                              margin: EdgeInsets.only(
                                  top: width * 0.18, bottom: height * 0.1),
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
                                  padding:
                                      EdgeInsets.symmetric(horizontal: width * 0.03),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: width * 0.05,
                                      ),
                                      NamePositionTopWidget(
                                        name: cubit
                                            .details!.data!.partnersSlot!.roomName!,
                                        branch: cubit
                                            .details!.data!.partnersSlot!.branchName!,
                                        location: '',
                                      ),
                                      SizedBox(
                                        height: width * 0.06,
                                      ),
                                      cubit.details!.data!.partnersSlot!
                                                  .roomDescription! !=
                                              ""
                                          ? Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  S.of(context).description,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleLarge,
                                                ),
                                                SizedBox(
                                                  height: width * 0.02,
                                                ),
                                                Text(
                                                  cleanHtmlToPlainText(
                                                      cubit
                                                          .details!
                                                          .data!
                                                          .partnersSlot!
                                                          .roomDescription!,
                                                      maxLength: 200),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge!
                                                      .copyWith(
                                                        color: Colors.grey.shade800,
                                                      ),
                                                  maxLines: 5,
                                                ),
                                              ],
                                            )
                                          : const SizedBox.shrink(),
                                      SizedBox(
                                        height: width * 0.02,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              S.of(context).timeSlot,
                                              style: Theme.of(context).textTheme.titleLarge,
                                            ),
                                          ),
                                          Text(
                                            cubit.details!.data!.partnersSlot!.status!,
                                            style: Theme.of(context).textTheme.titleSmall,

                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: height * 0.02,
                                      ),
                                      Container(
                                        width: width * 0.295,
                                        height: height * 0.05,
                                        decoration: BoxDecoration(
                                          color: getTimeSlotStatus(
                                            context
                                                .read<AppointmentDetailsCubit>()
                                                .timeSlotEnabled,
                                          ),
                                          borderRadius: BorderRadius.circular(25.0),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            const Icon(
                                              Icons.access_time_sharp,
                                              color: Colors.black,
                                            ),
                                            Text(
                                              cubit.details!.data!.partnersSlot!
                                                  .roomtimeName!,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall!
                                                  .copyWith(
                                                    color: Colors.black,
                                                  ),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: height * 0.02,
                                      ),
                                      int.parse(cubit.details!.data!.partnersSlot!
                                                  .partslotStatus!) >
                                              1
                                          ? Container(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: width * 0.026,
                                                vertical: height * 0.0176,
                                              ),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                                color: AppColor.primaryColor
                                                    .withOpacity(0.4),
                                              ),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      S.of(context).timeSlotEnabled,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .titleMedium!
                                                          .copyWith(),
                                                    ),
                                                  ),
                                                  Switch(
                                                    value: context
                                                            .read<
                                                                AppointmentDetailsCubit>()
                                                            .timeSlotEnabled ==
                                                        "2",
                                                    onChanged: (value) {
                                                      if (value == false) {
                                                        context
                                                            .read<
                                                                AppointmentDetailsCubit>()
                                                            .timeSlotEnabled = "3";
                                                      } else {
                                                        context
                                                            .read<
                                                                AppointmentDetailsCubit>()
                                                            .timeSlotEnabled = "2";
                                                      }
                                                      setState(() {});
                                                    },
                                                  ),
                                                ],
                                              ),
                                            )
                                          : const SizedBox.shrink(),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            buildContainerImage(
                                width, cubit.details!.data!.partnersSlot!.roomPic!),
                          ],
                        ),
                      ),
                    ),
                  );
                } else if (state is AppointmentDetailsError) {
                  return MessageWidget(
                    width: width,
                    height: height,
                    heightImage: height,
                    widthImage: width,
                    imagePath: 'assets/icons/error.svg',
                    message: S.of(context).errorHappenedUnExpected,
                    clickBtn: () {
                      cubit.getDetails(id: widget.appointmentId);
                    },
                    btnText: S.of(context).reload,
                  );
                } else if (state is NoInternetConnection) {
                  return MessageWidget(
                    width: width,
                    height: height,
                    heightImage: height,
                    widthImage: width,
                    imagePath: 'assets/images/connection_error.svg',
                    message: S.of(context).checkInternet,
                    clickBtn: () {
                      cubit.getDetails(id: widget.appointmentId);
                    },
                    btnText: S.of(context).reload,
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
            DownButtonStack(
              width: width,
              height: height,
              button: BuildProfileButton(
                formKey: formKey,
                passwordController: passwordController,
                textButton: S.of(context).save,
                futureFunction: () async {
                  await context
                      .read<AppointmentDetailsCubit>()
                      .updateTimeSlotStatus(
                    password: passwordController.text.trim(),
                    id: widget.appointmentId,
                  );
                },
              ),
            ),

          ],
        ),
      ),
    );
  }

  Padding buildContainerImage(double width, String image) {
    return Padding(
      padding: EdgeInsets.all(width * 0.04),
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
            radius: width,
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
