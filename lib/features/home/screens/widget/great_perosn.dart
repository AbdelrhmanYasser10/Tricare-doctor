import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../generated/l10n.dart';
import '../../../profile/cubit/profile_cubit.dart';



class GreatPerson extends StatelessWidget {
  final String? name;
  const GreatPerson({super.key,this.name});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: height * 0.01),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              var cubit = context.read<ProfileCubit>();
              return Text(
                '${S.of(context).hello} ${cubit.userModel == null?'':cubit.userModel!.hasError?'': cubit.userModel!.data!.partner!.partnerFullname} 👋',
                style: Theme.of(context).textTheme.titleLarge,
              );
            },
          ),


        ],
      ),
    );
  }
}