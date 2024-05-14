import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tricares_doctor_app/core/component/SVG/svg.dart';
import 'package:tricares_doctor_app/core/globle/color/light_app_color.dart';

import '../../../../core/globle/color/shared_color.dart';
import '../../cubits/sessions_cubit/sessions_cubit.dart';
import 'current_sessions_widget.dart';
class PageViewShape extends StatelessWidget {
  const PageViewShape({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocConsumer<SessionsCubit, SessionsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = SessionsCubit.get(context);
        return PageView.builder(
          controller: context.read<SessionsCubit>().pageController,
          itemBuilder: (context, index) {
            return CurrentSessionsWidget();
          },
          physics: const BouncingScrollPhysics(),
          itemCount: 2,
          onPageChanged: (value) {
            cubit.changeTabIdx(idx: value);
          },
        );
      },
    );
  }
}
