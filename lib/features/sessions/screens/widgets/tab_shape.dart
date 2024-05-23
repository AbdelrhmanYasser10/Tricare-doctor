import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tricares_doctor_app/features/sessions/screens/widgets/tab_button.dart';

import '../../../../generated/l10n.dart';
import '../../cubits/sessions_cubit/sessions_cubit.dart';

class TabShape extends StatelessWidget {
  const TabShape({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocConsumer<SessionsCubit, SessionsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = SessionsCubit.get(context);
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
                  txt: S.of(context).currentWord,
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
                  txt: S.of(context).previous,
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
