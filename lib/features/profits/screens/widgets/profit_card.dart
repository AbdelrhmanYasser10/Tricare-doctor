import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tricares_doctor_app/core/Global%20Cubit/global_cubit.dart';
import 'package:tricares_doctor_app/core/component/ElevatedButton%20Widget/build_elevated_button.dart';
import 'package:tricares_doctor_app/core/component/SVG/svg.dart';
import 'package:tricares_doctor_app/core/functions/fucntions.dart';

import 'package:tricares_doctor_app/features/profits/screens/profit_details_screen.dart';

import '../../../../core/globle/color/shared_color.dart';
import '../../models/profits_model.dart';

class ProfitCard extends StatelessWidget {
  final PartnersOrders profit;
  const ProfitCard({Key? key, required this.profit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: height * 0.0176,
        horizontal: width * 0.0265,
      ),
      decoration: BoxDecoration(
        color:
        context.read<GlobalCubit>().isLight ? Colors.white : Colors.black,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: width * 0.08,
                backgroundColor: AppColor.primaryColor.withOpacity(0.6),
                child: BuildIconSvg(
                  name: 'profits.svg',
                  color: AppColor.primaryColor,
                  size: width * 0.08,
                ),
              ),
              SizedBox(
                width: width * 0.02,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Profit Request #${profit.pARTORDID}",
                      style: Theme.of(context).textTheme.headlineSmall,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      profit.partordDate!,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      '${profit.partordAmount!} ${profit.currencyName}',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  Text(
                    profit.status!,
                    style: Theme.of(context).textTheme.titleSmall,
                  )
                ],
              ),
              SizedBox(
                width: width * 0.02,
              ),
            ],
          ),
          SizedBox(
            height: height * 0.02,
          ),



          BuildButton(
            text: 'Show Details',
            onPressed: () {
              navigateTo(
                context,
                ProfitsDetailsScreen(
                  profitId: int.parse(profit.pARTORDID!),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
