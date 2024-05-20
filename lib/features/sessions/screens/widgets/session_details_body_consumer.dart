import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:tricares_doctor_app/features/sessions/cubits/session_details_cubit/session_details_cubit.dart';

import '../../../../core/component/Loading Widget/loading_widget.dart';
import '../../../../core/component/MessageWidget/message_widget.dart';
import '../../../../core/component/SVG/svg.dart';
import '../../../../core/globle/color/shared_color.dart';
import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/Show Rate/show_rate.dart';

class SessionDetailsBodyConsumer extends StatelessWidget {
  final int sessionId;
  const SessionDetailsBodyConsumer({Key? key, required this.sessionId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return BlocConsumer<SessionDetailsCubit, SessionDetailsState>(
      listener: (context, state) {
        if (state is SessionDetailsError) {
          var snackBar = Utils.buildSnackBar2(
            contentType: ContentType.failure,
            context: context,
            message: state.message,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        var cubit = SessionDetailsCubit.get(context);
        if (state is SessionDetailsLoading) {
          return const Center(
            child: BuildLoadingWidget(),
          );
        } else if (state is SessionDetailsSuccess) {
          var session = cubit.sessionDetailsModel!.data!.session!;
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.0265,
              vertical: height * 0.0176,
            ),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: width * 0.176,
                      backgroundColor: AppColor.primaryColor.withOpacity(0.2),
                      child: BuildIconSvg(
                        name: 'doctor.svg',
                        size: width * 0.176,
                        color: AppColor.primaryColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Session #${cubit.sessionDetailsModel!.data!.session!.sESSIONID!}",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Text(
                          cubit.sessionDetailsModel!.data!.session!
                                      .sessionPartnerAttended! ==
                                  "0"
                              ? "Not Attended"
                              : "Attended",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Date",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            SizedBox(
                              height: height * 0.002,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.03,
                                  vertical: height * 0.021),
                              decoration: BoxDecoration(
                                color: AppColor.patientCardColor,
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.date_range,
                                    color: Colors.white,
                                    size: 25.0,
                                  ),
                                  SizedBox(
                                    width: width * 0.03,
                                  ),
                                  Text(
                                    session.sessionDate!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge!
                                        .copyWith(
                                          color: Colors.white,
                                        ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Start",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            SizedBox(
                              height: height * 0.002,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.03,
                                  vertical: height * 0.021),
                              decoration: BoxDecoration(
                                color: AppColor.patientCardColor,
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.access_time_sharp,
                                    color: Colors.white,
                                    size: 25.0,
                                  ),
                                  SizedBox(
                                    width: width * 0.03,
                                  ),
                                  Text(
                                    session.sessionStart!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge!
                                        .copyWith(
                                          color: Colors.white,
                                        ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Duration",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        SizedBox(
                          height: height * 0.002,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: width * 0.09,
                              vertical: height * 0.021),
                          decoration: BoxDecoration(
                            color: AppColor.patientCardColor,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.timer,
                                color: Colors.white,
                                size: 25.0,
                              ),
                              SizedBox(
                                width: width * 0.03,
                              ),
                              Text(
                                session.sessionDuration!,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge!
                                    .copyWith(
                                      color: Colors.white,
                                    ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Text(
                    "Patient Info",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              session.patientFullname!,
                              style: Theme.of(context).textTheme.titleLarge,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(
                              height: height * 0.004,
                            ),
                            ShowRateStar(
                              rate: session.sessionPatientRating!,
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          getIcon(session.sessionPatientAttended!, width),
                          Text(
                            session.sessionPatientAttended! == "0"
                                ? "Not Attended"
                                : "Attended",
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  session.sessionPatientNotes! != "" ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Patient Notes",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      Text(
                        session.sessionPatientNotes!,
                        style: Theme.of(context).textTheme.titleLarge,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ):const SizedBox(),
                  SizedBox(
                    height: height * 0.03,
                  ),
                ],
              ),
            ),
          );
        } else if (state is SessionDetailsError) {
          return MessageWidget(
            width: width,
            height: height,
            heightImage: height,
            widthImage: width,
            imagePath: 'assets/images/error.png',
            message: 'Error while get data',
            clickBtn: () {
              cubit.getSessionDetails(sessionId: sessionId);
            },
            btnText: 'Reload',
          );
        } else if (state is NoInternetConnection) {
          return MessageWidget(
            width: width,
            height: height,
            heightImage: height,
            widthImage: width,
            imagePath: 'assets/images/connection_error.svg',
            message: 'Check your internet connection',
            clickBtn: () {
              cubit.getSessionDetails(sessionId: sessionId);
            },
            btnText: 'Reload',
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }

  Widget getIcon(String actionIcon, double width) {
    switch (actionIcon) {
      case "1":
        return CircleAvatar(
          backgroundColor: Colors.green.shade50,
          child: Icon(
            Icons.check_circle_outline,
            color: Colors.green,
          ),
        );
      case "0":
        return CircleAvatar(
          backgroundColor: Colors.red.shade50,
          child: Icon(
            Icons.close,
            color: Colors.red,
          ),
        );
      default:
        return SizedBox();
    }
  }
}
