import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tricares_doctor_app/core/component/ElevatedButton%20Widget/build_elevated_button.dart';
import 'package:tricares_doctor_app/core/network/Local/CashHelper.dart';
import 'package:tricares_doctor_app/features/Authentication/screens/Register/register_screen.dart';
import 'package:tricares_doctor_app/features/Services/cubits/services_cubit.dart';
import 'package:tricares_doctor_app/features/Services/screens/widgets/service_card.dart';
import 'package:tricares_doctor_app/features/profile/cubit/profile_cubit.dart'
    as pc;

import '../../../../core/component/Loading Widget/loading_widget.dart';
import '../../../../core/component/MessageWidget/message_widget.dart';
import '../../../../core/functions/fucntions.dart';
import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/Carousel Widget/carsousel_widget_screen.dart';
import '../../../../generated/l10n.dart';

class ServiceDetailsBodyConsumer extends StatelessWidget {
  final int serviceId;
  const ServiceDetailsBodyConsumer({Key? key, required this.serviceId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return BlocConsumer<ServicesCubit, ServicesState>(
      listener: (context, state) {
        if (state is ServicesDetailsError) {
          var snackBar = Utils.buildSnackBar2(
            contentType: ContentType.failure,
            context: context,
            message: state.message,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        var cubit = ServicesCubit.get(context);
        if (state is ServicesDetailsLoading) {
          return const Center(
            child: BuildLoadingWidget(),
          );
        } else if (state is ServicesDetailsSuccess) {
          var service = cubit.serviceDetailsModel!.data!.service!;
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
                  CarouselSliderWidget(
                    width: double.infinity,
                    height: height,
                    images: cubit.serviceDetailsModel!.data!.servicesPosts!
                        .map((e) => e.serpostFilename!)
                        .toList(),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Text(
                    service.serviceName!,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Text(
                    cleanHtmlToPlainText(service.serviceDescription!),
                    style: Theme.of(context).textTheme.titleSmall!,
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  cubit.serviceDetailsModel!.data!.similarServices!.isNotEmpty
                      ? Text(
                          S.of(context).similarServices,
                          style: Theme.of(context).textTheme.headlineMedium!,
                        )
                      : const SizedBox(),
                  SizedBox(
                    height: cubit.serviceDetailsModel!.data!.similarServices!
                            .isNotEmpty
                        ? height * 0.02
                        : 0,
                  ),
                  cubit.serviceDetailsModel!.data!.similarServices!.isNotEmpty
                      ? ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return ServiceCard(
                              service: cubit.serviceDetailsModel!.data!
                                  .similarServices![index],
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: height * 0.01,
                            );
                          },
                          itemCount: cubit.serviceDetailsModel!.data!
                              .similarServices!.length,
                        )
                      : const SizedBox(),
                  SizedBox(
                    height: height * 0.025,
                  ),
                  BlocBuilder<pc.ProfileCubit, pc.ProfileState>(
                    builder: (context, state) {
                      if (CashHelper.prefs.get('login') == null) {
                        return BuildButton(
                          text: S.of(context).apply,
                          onPressed: () {
                            navigateTo(context, const RegisterScreen());
                          },
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
                  ),
                ],
              ),
            ),
          );
        } else if (state is ServicesDetailsError) {
          return MessageWidget(
            width: width,
            height: height,
            heightImage: height,
            widthImage: width,
            imagePath: 'assets/images/error.png',
            message: 'Error while get data',
            clickBtn: () {
              cubit.getServiceDetails(serviceId: serviceId);
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
              cubit.getServiceDetails(serviceId: serviceId);
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
