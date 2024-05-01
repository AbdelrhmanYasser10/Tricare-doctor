import 'package:flutter/material.dart';



class GreatPerson extends StatelessWidget {
  final String? name;
  const GreatPerson({super.key,this.name});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return  Padding(
      padding:  EdgeInsets.symmetric(vertical: height*0.01),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hello, ${name??''} 👋',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Text(
            'Welcome To TriCare',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}