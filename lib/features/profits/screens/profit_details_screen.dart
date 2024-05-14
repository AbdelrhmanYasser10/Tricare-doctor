import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tricares_doctor_app/core/Global%20Cubit/global_cubit.dart';
import 'package:tricares_doctor_app/core/component/Loading%20Widget/loading_widget.dart';
import 'package:tricares_doctor_app/core/component/SVG/svg.dart';
import 'package:tricares_doctor_app/features/profits/cubits/profits_details_cubit/profits_details_cubit.dart';
import 'package:tricares_doctor_app/features/profits/screens/widgets/message_widget.dart';

import '../../../core/globle/color/shared_color.dart';
import '../../../core/utils/utils.dart';


class ProfitsDetailsScreen extends StatelessWidget {
  final int profitId;
  final int fromPayment;

  const ProfitsDetailsScreen(
      {Key? key, required this.profitId, this.fromPayment = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) =>
      ProfitsDetailsCubit()
        ..getDetails(profitId: profitId, fromPayment: fromPayment),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Profit Details',
          ),
          centerTitle: true,
        ),
        body: BlocConsumer<ProfitsDetailsCubit, ProfitsDetailsState>(
          listener: (context, state) {
            if(state is GetDetailsError){
              var snackBar = Utils.buildSnackBar2(
                contentType: ContentType.failure,
                context: context,
                message: state.message,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
          builder: (context, state) {
            var cubit = ProfitsDetailsCubit.get(context);
            if(state is GetDetailsLoading){
              return const Center(
                child: BuildLoadingWidget(),
              );
            }
            else if(state is GetDetailsSuccess) {
              return Center(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Column(
                            children: [
                              BuildIconSvg(
                                  name: 'profits.svg',
                                size: width / 3,
                                color: AppColor.primaryColor,
                              ),
                              SizedBox(
                                height: height * 0.0167,
                              ),
                              Text(
                                "Profit Order# ${cubit.profitDetails!.data!.partnersOrder!.pARTORDID!}",
                                style: Theme.of(context).textTheme.titleMedium,

                              ),
                              cubit.profitDetails!.data!.partnersOrder!.partordNotes != '' ?Text(
                                'Notes : ${cubit.profitDetails!.data!.partnersOrder!.partordNotes}',
                                style: Theme.of(context).textTheme.bodySmall,
                                maxLines: 6,
                                overflow: TextOverflow.ellipsis,
                              ):const SizedBox.shrink(),
                            ],
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: height * 0.016,
                            horizontal: width * 0.02,
                          ),
                          child: Container(
                            width: width,
                            height: height / 4,
                            decoration: DottedDecoration(
                              color: AppColor.primaryColor,
                              borderRadius: BorderRadius.circular(15.0),
                              shape: Shape.box,
                              strokeWidth: 1.5,
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: context.read<GlobalCubit>().isLight ? Colors.white : Colors.black,
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: height * 0.016,
                                  horizontal: width * 0.02,
                                ),
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: IntrinsicHeight(
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.stretch,
                                          children: [
                                            Expanded(
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'Date',
                                                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                                                      color: AppColor.primaryColor,
                                                    ),
                                                  ),
                                                  Text(
                                                    cubit.profitDetails!.data!.partnersOrder!.partordDate!,
                                                    style: Theme.of(context).textTheme.titleSmall,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'Taxes',
                                                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                                                      color: AppColor.primaryColor,
                                                    ),
                                                  ),
                                                  Text(
                                                    cubit.profitDetails!.data!.partnersOrder!.partordTaxes!,
                                                    style: Theme.of(context).textTheme.titleSmall,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'Total Taxes',
                                                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                                                      color: AppColor.primaryColor,
                                                    ),
                                                  ),
                                                  Text(
                                                    cubit.profitDetails!.data!.partnersOrder!.partordTaxesTotal!,
                                                    style: Theme.of(context).textTheme.titleSmall,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Divider(),
                                    Expanded(
                                      child: IntrinsicHeight(
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.stretch,
                                          children: [
                                            Expanded(
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'Paid',
                                                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                                                      color: AppColor.primaryColor,
                                                    ),
                                                  ),
                                                  Text(
                                                    '${cubit.profitDetails!.data!.partnersOrder!.partordPaid!} ${cubit.profitDetails!.data!.partnersOrder!.currencyName!}',
                                                    style: Theme.of(context).textTheme.titleSmall,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'Remaining',
                                                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                                                      color: AppColor.primaryColor,
                                                    ),
                                                  ),
                                                  Text(
                                                    '${cubit.profitDetails!.data!.partnersOrder!.partordRemaining!} ${cubit.profitDetails!.data!.partnersOrder!.currencyName!}',
                                                    style: Theme.of(context).textTheme.titleSmall,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'Total',
                                                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                                                      color: AppColor.primaryColor,
                                                    ),
                                                  ),
                                                  Text(
                                                    '${cubit.profitDetails!.data!.partnersOrder!.partordTotal!} ${cubit.profitDetails!.data!.partnersOrder!.currencyName!}',
                                                    style: Theme.of(context).textTheme.titleSmall,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: height * 0.016,
                            horizontal: width * 0.02,
                          ),
                          child: Text(
                            'Payments',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                        if(cubit.profitDetails!.data!.payments!.length > 0)
                          ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Container(
                                  decoration: BoxDecoration(
                                    color: AppColor.primaryColor.withOpacity(0.4),
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  height: height * 0.016,

                                );
                              },
                              itemCount: cubit.profitDetails!.data!.payments!.length,
                          )
                        else
                          Center(
                            child: SizedBox(
                              height: height / 5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  SvgPicture.asset(
                                    'assets/icons/empty.svg'
                                  ),
                                  Text(
                                    'No Payments yet',
                                    style: Theme.of(context).textTheme.titleSmall,
                                  ),
                                ],
                              ),
                            ),
                          ),

                      ],
                  ),
                ),
              );
            }
            else if(state is GetDetailsError){
              return MessageWidget(
                width: width,
                height: height,
                heightImage: height,
                widthImage: width,
                imagePath: 'assets/images/error.png',
                message: 'Error while get data',
                clickBtn: () {
                  cubit.getDetails(profitId: profitId,fromPayment: fromPayment);
                },
                btnText: 'Reload',
              );
            }
            else if(state is NoInternetConnection){
              return MessageWidget(
                width: width,
                height: height,
                heightImage: height,
                widthImage: width,
                imagePath: 'assets/images/connection_error.svg',
                message: 'Check your internet connection',
                clickBtn: () {
                  cubit.getDetails(profitId: profitId,fromPayment: fromPayment);
                },
                btnText: 'Reload',
              );
            }
            else{
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
