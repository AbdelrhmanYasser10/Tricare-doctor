import 'package:flutter/material.dart';

import '../../../../core/functions/fucntions.dart';
import '../../../Authentication/screens/Login/login_screen.dart';

class MainProfileScreen extends StatelessWidget {
  const MainProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            navigateTo(context, LoginScreen());
          },
          child: Text('login'),
        ),
      ),
    );
  }
}
