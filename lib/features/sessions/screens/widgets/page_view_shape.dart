import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/sessions_cubit/sessions_cubit.dart';
import 'current_sessions_widget.dart';

class PageViewShape extends StatelessWidget {
  const PageViewShape({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SessionsCubit, SessionsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = SessionsCubit.get(context);
        List<String> filters = ['current', 'upcoming', 'past', 'all'];
        return PageView.builder(
          controller: context.read<SessionsCubit>().pageController,
          itemBuilder: (context, index) {
            return SessionsBodyWidget(
              filterString: filters[index],
            );
          },
          physics: const NeverScrollableScrollPhysics(),
          itemCount: filters.length,
          onPageChanged: (value) {},
        );
      },
    );
  }
}
