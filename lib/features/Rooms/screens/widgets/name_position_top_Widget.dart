import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';


class NamePositionTopWidget extends StatelessWidget {
  final String name;
  final String branch;
  final String location;

  const NamePositionTopWidget({super.key, required this.name, required this.branch,required this.location});


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            name,
            style: Theme.of(context).textTheme.titleMedium,
            maxLines: 1,
          ),

          Text(
            '${S.of(context).branch} $branch',
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: Colors.grey,
            ),
            maxLines: 1,
          ),

          const SizedBox(height: 5,),

           /*ShowRateStar(
            iconSize: 15,
            rate: location,
          ),*/
        ],
      ),
    );
  }
}
