import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tricares_doctor_app/features/examination/cubits/examination_cubit/examination_cubit.dart';
import 'package:tricares_doctor_app/features/examination/screens/widgets/tab_button.dart';

import '../../../../core/globle/color/shared_color.dart';

class TabShape extends StatelessWidget {
  const TabShape({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocConsumer<ExaminationCubit, ExaminationState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ExaminationCubit.get(context);
        return SizedBox(
          height: height * 0.07,
          child: Row(
            children: [
              Expanded(
                child: TabButton(
                  cubit: cubit,
                  fn: (){
                    cubit.changeTabIdx(idx: 0);
                  },
                  txt: "Current",
                  activeIdx: 0,
                ),
              ),
              SizedBox(
                width: width * 0.07,
              ),
              Expanded(
                child: TabButton(
                  cubit: cubit,
                  fn: (){
                    cubit.changeTabIdx(idx: 1);
                  },
                  txt: "Previous",
                  activeIdx: 1,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
