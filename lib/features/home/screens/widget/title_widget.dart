import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  final bool showSeeAll;
  const TitleWidget({super.key, required this.title,required this.onTap , this.showSeeAll = true});



  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return  Padding(
      padding:  EdgeInsets.symmetric(vertical: height*0.02),
      child: Row(
        textBaseline: TextBaseline.alphabetic,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const Spacer(),
          showSeeAll ? InkWell(
            onTap: onTap,
            child: Text(
              'See All',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Colors.grey,
              ),


            ),

          ):const SizedBox.shrink(),
        ],
      ),
    );
  }
}
