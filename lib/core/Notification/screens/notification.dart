import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tricares_doctor_app/features/profile/cubit/profile_cubit.dart';


import '../../../generated/l10n.dart';
import '../../network/Local/CashHelper.dart';
import '../../widgets/Empty Data Widget/empty_data_widget.dart';
import '../../widgets/Error Widget/error_widget.dart';
import '../../widgets/Login First/login_first_widget.dart';
import '../cubit/notification_cubit.dart';
import 'widget/build_notification_wiget.dart';
import 'widget/loading_shimmer.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  void dispose() {
    //WidgetsBinding.instance.addPostFrameCallback((_) { });

    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).notifications),
      ),
      body: PopScope(
        canPop: true,
        onPopInvoked: (didPop) async {
          context.read<ProfileCubit>().postUserData(notification: true);
        },
        child: BlocBuilder<NotificationCubit, NotificationState>(
          builder: (context, state) {
            var cubit = context.read<NotificationCubit>();
            return CashHelper.getData(key: 'login') == null
                ? BuildLoginFirst(
                    height: height * 0.5,
                    width: width,
                    heightImage: height * 0.5,
                    widthImage: width,
                  )
                : cubit.notificationModel == null
                    ? const BuildLoadingShimmerNotification()
                    : cubit.notificationModel!.hasError
                        ? BuildErrorWidget(
                            error: cubit.notificationModel!.errors.join(' '))
                        : cubit.notificationModel!.data!.notification!.isEmpty
                            ? BuildEmptyDataWidget(
                                text: S.of(context).dontHaveNotifications,
                              )
                            : ListView.builder(
                                itemCount: cubit.notificationModel!.data!
                                    .notification!.length,
                                itemBuilder: (context, index) {
                                  return BuildNotificationWidget(
                                    index: index,

                                    date: cubit.notificationModel!.data!
                                        .notification![index].notificationDate!,
                                    time: cubit.notificationModel!.data!
                                        .notification![index].notificationTime!,
                                    message: cubit
                                        .notificationModel!
                                        .data!
                                        .notification![index]
                                        .notificationMessage!,
                                    actionId: cubit
                                        .notificationModel!
                                        .data!
                                        .notification![index]
                                        .notificationActionId!,
                                    action: cubit
                                        .notificationModel!
                                        .data!
                                        .notification![index]
                                        .notificationAction!,
                                    id: cubit.notificationModel!.data!
                                        .notification![index].nOTIFICATIONID!,
                                    iconString: cubit.notificationModel!.data!
                                        .notification![index].notificationIcon!,
                                    read: cubit.notificationModel!.data!
                                        .notification![index].notificationRead!,
                                  );
                                },
                              );
          },
        ),
      ),
    );
  }
}
