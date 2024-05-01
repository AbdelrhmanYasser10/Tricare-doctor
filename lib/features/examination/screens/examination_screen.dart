import 'package:flutter/material.dart';
import 'package:tricares_doctor_app/features/examination/screens/widgets/page_view_shape.dart';
import 'package:tricares_doctor_app/features/examination/screens/widgets/tab_shape.dart';

class ExaminationsScreen extends StatelessWidget {
  final bool fromHome;
  const ExaminationsScreen({Key? key , required this.fromHome}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: fromHome ? AppBar(
        title: Text(
          "Your Examinations",
        ),
        centerTitle: true,
      ):null,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TabShape(),
            Expanded(
              child: PageViewShape(),
            ),
          ],
        ),
      ),
    );
  }
}
