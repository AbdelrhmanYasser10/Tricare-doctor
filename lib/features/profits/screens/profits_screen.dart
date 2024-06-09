import 'package:flutter/material.dart';
import 'package:tricares_doctor_app/core/widgets/Login%20First/login_first_widget.dart';
import 'package:tricares_doctor_app/features/Drawer/screen/drawer_screen.dart';
import 'package:tricares_doctor_app/features/profits/screens/widgets/bodyConsumer.dart';

import '../../../core/network/Local/CashHelper.dart';
import '../../../generated/l10n.dart';

class ProfitsScreen extends StatefulWidget {
  const ProfitsScreen({Key? key}) : super(key: key);

  @override
  State<ProfitsScreen> createState() => _ProfitsScreenState();
}

class _ProfitsScreenState extends State<ProfitsScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      drawer: const DrawerScreen(
        isFromHome: false,
      ),
      appBar: AppBar(
        title: Text(
            S.of(context).myProfits
        ),
      ),
      body: CashHelper.getData(key: 'login') == null
          ? BuildLoginFirst(
              width: width,
              height: height,
              heightImage: width,
              widthImage: width,
            )
          : const ProfitsBodyConsumer(),
    );
  }
}
