import 'package:flutter/material.dart';

class BuildGridView extends StatelessWidget {

  final int itemCount;
  final  Widget? Function(BuildContext, int) itemBuilder;

  const BuildGridView({super.key, required this.itemCount, required this.itemBuilder});


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // number of items in each row
        mainAxisSpacing: 8.0, // spacing between rows
        crossAxisSpacing: 8.0, // spacing between columns
        mainAxisExtent: height * 0.25,
      ),
      itemCount: itemCount,
      itemBuilder: itemBuilder,
    );
  }
}