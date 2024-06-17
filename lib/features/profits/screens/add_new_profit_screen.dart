import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tricares_doctor_app/features/profile/cubit/profile_cubit.dart';
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
  void initState() {
    super.initState();
    context.read<ProfileCubit>().postUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
