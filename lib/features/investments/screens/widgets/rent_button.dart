import 'package:flutter/material.dart';

class RentButton extends StatelessWidget {
  final VoidCallback fn;
  final String price;
  const RentButton({Key? key , required this.fn , required this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: fn,
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 8,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Rent Price",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.blueGrey
                ),
              ),
              Text(
                "$price EGP/Mon",
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: Colors.black
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
