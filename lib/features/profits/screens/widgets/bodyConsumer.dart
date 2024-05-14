import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:tricares_doctor_app/core/globle/color/shared_color.dart';
import 'package:tricares_doctor_app/features/profits/cubits/paginator_cubit/paginator_cubit.dart';
import 'package:tricares_doctor_app/features/profits/screens/widgets/message_widget.dart';
import 'package:tricares_doctor_app/features/profits/screens/widgets/pagination_consumer.dart';
import 'package:tricares_doctor_app/features/profits/screens/widgets/table_view.dart';

import '../../../../core/component/Loading Widget/loading_widget.dart';
import '../../../../core/network/Local/CashHelper.dart';
import '../../../../core/utils/utils.dart';
import '../../cubits/profits_cubit/profits_cubit.dart';

class ProfitsBodyConsumer extends StatefulWidget {
  const ProfitsBodyConsumer({Key? key}) : super(key: key);

  @override
  State<ProfitsBodyConsumer> createState() => _ProfitsBodyConsumerState();
}

class _ProfitsBodyConsumerState extends State<ProfitsBodyConsumer> {
  String token = CashHelper.prefs.getString('token')!;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Expanded(
          child: BlocConsumer<ProfitsCubit, ProfitsState>(
            listener: (context, state) {
              if (state is GetProfitsTableError) {
                var snackBar = Utils.buildSnackBar2(
                  contentType: ContentType.failure,
                  context: context,
                  message: state.message,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            },
            builder: (context, state) {
              var cubit = ProfitsCubit.get(context);
              if (state is GetProfitsTableLoading) {
                return const Center(
                  child: BuildLoadingWidget(),
                );
              } else if (state is GetProfitsTableSuccessfully) {
                if (cubit.profitsModel!.data!.partnersOrders!.isNotEmpty) {
                  return TableGridView(
                    profits: cubit.profitsModel!.data!.partnersOrders!,
                  );
                } else {
                  return MessageWidget(
                    width: width,
                    height: height,
                    heightImage: height / 2,
                    widthImage: width / 2,
                    imagePath: 'assets/images/empty.svg',
                    message: 'There\'s no data',
                    clickBtn: () {
                      cubit.getProfitsTable(token: token);
                    },
                    btnText: 'Reload',
                  );
                }
              } else if (state is GetProfitsTableError) {
                return MessageWidget(
                  width: width,
                  height: height,
                  heightImage: height,
                  widthImage: width,
                  imagePath: 'assets/images/error.png',
                  message: 'Error while get data',
                  clickBtn: () {
                    cubit.getProfitsTable(token: token);
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
                    cubit.getProfitsTable(token: token);
                  },
                  btnText: 'Reload',
                );
              } else {
                print(state);
                return const SizedBox();
              }
            },
          ),
        ),
        PaginationConsumer(),
      ],
    );
  }
}
