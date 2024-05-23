import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tricares_doctor_app/core/Global%20Cubit/global_cubit.dart';
import 'package:tricares_doctor_app/core/component/Network%20Image/network_image.dart';
import 'package:tricares_doctor_app/core/component/SVG/svg.dart';
import 'package:tricares_doctor_app/core/functions/fucntions.dart';
import 'package:tricares_doctor_app/core/globle/color/shared_color.dart';
import 'package:tricares_doctor_app/features/Services/models/services_model.dart';
import 'package:tricares_doctor_app/features/Services/screens/service_details_screen.dart';

class ServiceCard extends StatelessWidget {
  final Services service;
  const ServiceCard({Key? key, required this.service}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        navigateTo(context, ServicesDetailsScreen(serviceId: int.parse(service.sERVICEID!)));
      },
      child: Container(
        height: height * 0.2,
        decoration: BoxDecoration(
          color:
              context.read<GlobalCubit>().isLight ? Colors.white : Colors.black,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              width: width * 0.33,
              height: height * 0.2,
              child: BuildImage(
                image: service.serpostFilename!,
                radius: 12.0,
                fit: BoxFit.cover,

                errorWidget: Container(
                  width: width * 0.33,
                  height: height * 0.2,
                  decoration: BoxDecoration(
                    color: AppColor.primaryColor.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Center(
                    child: BuildIconSvg(
                      name: "services.svg",
                      color: AppColor.primaryColor,
                      size: height * 0.25,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: width * 0.02,
            ),
            Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      service.serviceName!,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(
                      cleanHtmlToPlainText(
                        service.serviceDescription!
                      ),
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Colors.blueGrey,
                      ),
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
            ),
            SizedBox(
              width: width * 0.02,
            ),
          ],
        ),
      ),
    );
  }
}
