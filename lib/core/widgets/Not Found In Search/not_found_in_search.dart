import 'package:flutter/material.dart';

import '../../globle/color/shared_color.dart';

class NoItemInSearch extends StatelessWidget {
  final String text;
  const NoItemInSearch({super.key,required this.text});

  @override
  Widget build(BuildContext context) {
    return    Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.search_off,size: 80,color: AppColor.primaryColor,),
          Text(
            text,
            style: Theme.of(context).textTheme.titleSmall,
          )
        ],
      ),
    );
  }
}
