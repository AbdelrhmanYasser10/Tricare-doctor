import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tricares_doctor_app/core/functions/fucntions.dart';
import 'package:tricares_doctor_app/features/investments/screens/widgets/investment_card.dart';

import 'investments_details_screen.dart';

class InvestmentsScreen extends StatelessWidget {
  const InvestmentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Investments",
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 10.0,
          vertical: 10.0,
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    if(index == 12){
                      return SizedBox(
                        height: height * 0.03,
                      );
                    }
                    return InvestmentCard(
                      price: "1000",
                      title: "Clinic name",
                      cardClickFn: (){
                        navigateTo(context, InvestmentDetailsScreen(name: "Clinic name",));
                      },
                      finishingCase: "Great case",
                      imageLink: "assets/images/clinic.jpg",
                      rentClickFn: (){},
                    );

                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 10.0,
                    );
                  },
                  itemCount: 13,
                  physics: const BouncingScrollPhysics(),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
