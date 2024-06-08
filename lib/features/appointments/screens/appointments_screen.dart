import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tricares_doctor_app/core/Global%20Cubit/global_cubit.dart';
import 'package:tricares_doctor_app/features/appointments/cubits/appointement_cubit.dart';
import 'package:tricares_doctor_app/features/appointments/screens/widgets/schedule_body_consumer.dart';

import '../../../generated/l10n.dart';
import '../../Drawer/screen/drawer_screen.dart';

class AppointmentsScreen extends StatefulWidget {
  const AppointmentsScreen({Key? key}) : super(key: key);

  @override
  State<AppointmentsScreen> createState() => _AppointmentsScreenState();
}

class _AppointmentsScreenState extends State<AppointmentsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppointementCubit()..getSchedule(),
      child: BlocConsumer<GlobalCubit, GlobalState>(
        listener: (context, state) {
          if (state is ChangeLocal) {
            AppointementCubit.get(context).getSchedule();
          }
        },
        builder: (context, state) {
          return Scaffold(
            drawer: const DrawerScreen(
              isFromHome: false,
            ),
            appBar: AppBar(
              title: Text(
                S.of(context).mySchedule,
              ),
              centerTitle: true,
            ),
            body: const ScheduleBodyConsumer(),
          );
        },
      ),
    );
  }

  SizedBox verticalSpace({required double height}) => SizedBox(
        height: height,
      );
}
