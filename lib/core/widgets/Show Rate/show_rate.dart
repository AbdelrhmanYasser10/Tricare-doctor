import 'package:flutter/material.dart';
import 'package:rate/rate.dart';

class ShowRateStar extends StatelessWidget {

  final double iconSize;
  final String rate;

  const ShowRateStar({super.key,  this.iconSize = 20, required this.rate});


  @override
  Widget build(BuildContext context) {
    return Rate(
        iconSize: iconSize,
        color: Colors.amber,
        allowHalf: true,
        allowClear: true,
        initialValue: double.parse(rate),
        readOnly: true,
    );
  }
}
