import 'package:flutter/material.dart';
import 'package:tricares_doctor_app/features/investments/screens/widgets/rent_button.dart';

import '../../../../core/globle/color/shared_color.dart';

class InvestmentCard extends StatelessWidget {
  final String imageLink;
  final String title;
  final String finishingCase;
  final String price;
  final VoidCallback cardClickFn;
  final VoidCallback rentClickFn;

  const InvestmentCard({Key? key , required this.finishingCase,required this.price,required this.title,
  required this.imageLink,
  required this.cardClickFn,
  required this.rentClickFn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: cardClickFn,
      child: Container(
        height: height * 0.45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(12.0),
                  topLeft: Radius.circular(12.0),
                ),
                child: Image.asset(
                  imageLink,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.only(
                  left: 20.0,
                  right: 10.0,
                  top: 10.0,
                  bottom: 10.0
                ),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(12.0),
                    bottomLeft: Radius.circular(12.0),
                  ),
                  color: AppColor.primaryColor,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            finishingCase,
                            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: Colors.white,
                            ),
                          ),

                        ],
                      ),
                    ),
                    RentButton(
                      fn: rentClickFn,
                      price: price,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
