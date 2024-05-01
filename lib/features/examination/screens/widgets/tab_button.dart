import 'package:flutter/material.dart';
import 'package:tricares_doctor_app/features/examination/cubits/examination_cubit/examination_cubit.dart';

import '../../../../core/globle/color/shared_color.dart';

class TabButton extends StatelessWidget {
  final String txt;
  final VoidCallback fn;
  final ExaminationCubit cubit;
  final int activeIdx;
  const TabButton({Key? key , required this.activeIdx,required this.txt,required this.fn , required this.cubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:fn,
      child: Container(
        decoration: BoxDecoration(
          color: cubit.tabIdx == activeIdx
              ? AppColor.primaryColor
              : Colors.blueGrey.shade200,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Center(
          child: Text(
            txt,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color:
              cubit.tabIdx == activeIdx ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
