import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tricares_doctor_app/features/appointments/cubits/appointement_cubit.dart';
import 'package:tricares_doctor_app/features/appointments/screens/widgets/schedule_body_consumer.dart';

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
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Your Schedule",
          ),
          centerTitle: true,
        ),
        body: ScheduleBodyConsumer(),
      ),
    );
  }

  SizedBox verticalSpace({required double height}) =>
      SizedBox(
        height: height,
      );
}
