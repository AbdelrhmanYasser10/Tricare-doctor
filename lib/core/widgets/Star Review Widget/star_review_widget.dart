import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:flutter/material.dart';

class StarWidget extends StatelessWidget {

  final double initialRating;
  final bool readOnly;
  final double size;

  const StarWidget({super.key, required this.initialRating, this.readOnly = false, this.size = 25});





  @override
  Widget build(BuildContext context) {
    return  AnimatedRatingStars(
      initialRating: 3.5,
      minRating: 0.0,
      maxRating: 5.0,
      filledColor: Colors.amber,
      emptyColor: Colors.grey,
      filledIcon: Icons.star,
      halfFilledIcon: Icons.star_half,
      emptyIcon: Icons.star_border,
      onChanged: (double rating) {
        print('Rating: $rating');
      },
      displayRatingValue: false,
      interactiveTooltips: true,
      customFilledIcon: Icons.star,
      customHalfFilledIcon: Icons.star_half,
      customEmptyIcon: Icons.star_border,
      starSize: size,

      animationDuration: Duration(milliseconds: 300),
      readOnly: readOnly,
    );
  }

}
