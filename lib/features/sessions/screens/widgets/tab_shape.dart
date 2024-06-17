import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tricares_doctor_app/features/sessions/screens/widgets/tab_button.dart';

import '../../../../generated/l10n.dart';
import '../../cubits/sessions_cubit/sessions_cubit.dart';

class TabShape extends StatefulWidget {
  const TabShape({Key? key}) : super(key: key);

  @override
  State<TabShape> createState() => _TabShapeState();
}

class _TabShapeState extends State<TabShape> {
  @override
  Widget build(BuildContext context) {
    List<String> tabs = [
      S.of(context).today,
      S.of(context).upcoming,
      S.of(context).past,
      S.of(context).all,

    ];
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocConsumer<SessionsCubit, SessionsState>(
      listener: (context, state) {},
      builder: (context, state) {

        var cubit = SessionsCubit.get(context);
        return SizedBox(
          width: double.infinity,
          height: height * 0.07,
          child: ListView.separated(
            itemCount: tabs.length,
            itemBuilder: (context, index) {
              return TabButton(
                cubit: cubit,
                fn: (){

                  cubit.changeTabIdx(idx: index);
                },
                txt: tabs[index],
                activeIdx: index,
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                width: width * 0.02,
              );
            },
            scrollDirection: Axis.horizontal,

          ),
        );
      },
    );
  }
}
