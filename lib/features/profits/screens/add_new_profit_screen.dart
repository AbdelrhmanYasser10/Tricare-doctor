
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tricares_doctor_app/features/profile/cubit/profile_cubit.dart';
import 'package:tricares_doctor_app/features/profits/cubits/add_profit_cubit/add_profit_cubit.dart';
import 'package:tricares_doctor_app/features/profits/screens/widgets/add_new_profit_form_body_consumer.dart';
import 'package:tricares_doctor_app/features/profits/screens/widgets/balance_card_consumer.dart';

import '../../../generated/l10n.dart';


class AddNewProfitScreen extends StatefulWidget {
  const AddNewProfitScreen({Key? key}) : super(key: key);

  @override
  State<AddNewProfitScreen> createState() => _AddNewProfitScreenState();
}

class _AddNewProfitScreenState extends State<AddNewProfitScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProfileCubit()..postUserData(),
        ),
        BlocProvider(
          create: (context) => AddProfitCubit(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            S.of(context).addNewOrder,
          ),
        ),
        body: const SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              BalanceCardConsumer(),
              AddNewProfitFormBodyConsumer(),
            ],
          ),
        ),
      ),
    );
  }
}
