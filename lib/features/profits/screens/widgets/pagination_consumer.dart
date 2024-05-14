import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_paginator/number_paginator.dart';

import '../../../../core/globle/color/shared_color.dart';
import '../../../../core/network/Local/CashHelper.dart';
import '../../cubits/paginator_cubit/paginator_cubit.dart';
import '../../cubits/profits_cubit/profits_cubit.dart';
class PaginationConsumer extends StatefulWidget {
  const PaginationConsumer({Key? key}) : super(key: key);

  @override
  State<PaginationConsumer> createState() => _PaginationConsumerState();
}

class _PaginationConsumerState extends State<PaginationConsumer>
{
  NumberPaginatorController controller = NumberPaginatorController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaginatorCubit, PaginatorState>(
      listener: (c, s) {

      },
      builder: (c, s) {
        var pagCubit = PaginatorCubit.get(context);
        if(s is GetMaximumPageLoading){
          return const Center(
            child: LinearProgressIndicator(
              color: AppColor.primaryColor,
            ),
          );
        }
        else if(s is GetMaximumPageSuccess){
          return NumberPaginator(
            controller: controller,
            numberPages: s.max,
            onPageChange: (int index) {
              ProfitsCubit.get(context).getProfitsTable(
                  token: CashHelper.prefs.getString('token')!,
                  pageNumber: index + 1);
              setState(() {});
            },

          );
        }
        else{
          return NumberPaginator(
            controller:controller,
            numberPages: 10,
            onPageChange: (int index) {
              pagCubit.getMaximumPage();
              ProfitsCubit.get(context).getProfitsTable(
                  token: CashHelper.prefs.getString('token')!,
                  pageNumber: index + 1);
            },

          );
        }
      },
    );
  }
}
