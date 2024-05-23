import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tricares_doctor_app/features/Services/screens/widgets/service_details_body_consumer.dart';

import '../../../generated/l10n.dart';
import '../cubits/services_cubit.dart';


class ServicesDetailsScreen extends StatelessWidget {
  final int serviceId;

  const ServicesDetailsScreen({Key? key, required this.serviceId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ServicesCubit()..getServiceDetails(serviceId: serviceId),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title:  Text(
            S.of(context).services,
          ),
        ),
        body: ServiceDetailsBodyConsumer(
          serviceId: serviceId,
        ),
      ),
    );
  }
}
