import 'package:flutter/material.dart';

import '../../../../core/globle/color/shared_color.dart';

class TitleSubTitleWidget extends StatelessWidget {
  final String  title;
  final String subtitle;
  const TitleSubTitleWidget({Key? key,required this.title, required this.subtitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 5,),
        Text(
          subtitle,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: AppColor.primaryColor,
          ),
        ),
      ],
    );
  }
}
