import 'package:flutter/material.dart';
import 'package:tricares_doctor_app/core/functions/fucntions.dart';
import 'package:tricares_doctor_app/features/appointments/screens/appointments_screen.dart';
import 'package:tricares_doctor_app/features/examination/screens/examination_screen.dart';
import 'package:tricares_doctor_app/features/investments/screens/investments_screen.dart';
import 'package:tricares_doctor_app/features/profits/screens/profits_screen.dart';


class InsideIconWidget extends StatelessWidget {
  const InsideIconWidget({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    List<String> categoriesIcon = [
      'assets/images/schedule.png',
      'assets/images/examination.png',
      'assets/images/investment.png',
      'assets/images/profits.png',
    ];

    List<String> categoriesName = [
      'Schedule',
      'Examinations',
      'Investments',
      'Profits',
    ];

    List<Widget> screens = const [
      AppointmentsScreen(),
      ExaminationsScreen(
        fromHome: true,
      ),
      InvestmentsScreen(),
      ProfitsScreen(),
    ];

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return  GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, // number of items in each row
          mainAxisSpacing: 8.0, // spacing between rows
          crossAxisSpacing: 8.0, // spacing between columns


        ),
        itemCount: 4,
        itemBuilder: (context,index){
          return  InkWell(
            onTap: (){
              navigateTo(context, screens[index]);
            },
            child: Column(
              children: [
                Expanded(
                  child: SizedBox(
                    width: width,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Image.asset(categoriesIcon[index]),
                      ),
                    ),
                  ),
                ),
                Text(
                  categoriesName[index],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          );
        }
    );
  }
}