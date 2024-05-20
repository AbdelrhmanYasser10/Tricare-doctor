import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tricares_doctor_app/features/sessions/cubits/session_details_cubit/session_details_cubit.dart';
import 'package:tricares_doctor_app/features/sessions/screens/widgets/session_details_body_consumer.dart';


class SessionDetailsScreen extends StatelessWidget {
  final int sessionId;

  const SessionDetailsScreen({Key? key, required this.sessionId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SessionDetailsCubit()..getSessionDetails(sessionId: sessionId),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Session Details',
          ),
        ),
        body: SessionDetailsBodyConsumer(
          sessionId: sessionId,
        ),
      ),
    );
  }
}
