import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/globle/color/shared_color.dart';

class ListOfAvailableDays extends StatefulWidget {
  const ListOfAvailableDays({Key? key}) : super(key: key);

  @override
  State<ListOfAvailableDays> createState() => _ListOfAvailableDaysState();
}

class _ListOfAvailableDaysState extends State<ListOfAvailableDays> {

  Map<String ,bool> availableDays = {
    "Saturday":false,
    "Sunday":false,
    "Monday":false,
    "Tuesday":false,
    "Wednesday":false,
    "Thursday":false,
    "Friday":false,
  };

  List<String> availableDaysList = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 50.0,
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              String keyVal = availableDays.keys.elementAt(index);
              bool res = availableDays[keyVal]!;
              return GestureDetector(
                onTap: (){
                  setState(() {
                    availableDays[keyVal] = !availableDays[keyVal]!;
                    if(availableDays[keyVal]!){
                      availableDaysList.add(keyVal);
                    }
                    else{
                      availableDaysList.remove(keyVal);
                    }
                  });
                },
                child: Container(
                  height: 40,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 5.0
                  ),
                  decoration: BoxDecoration(
                      color: res ? AppColor.primaryColor : Colors.blueGrey.shade200,
                      borderRadius: BorderRadius.circular(12.0)
                  ),
                  child: Center(
                    child: Text(
                      availableDays.keys.elementAt(index),
                      style: res ? Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: Colors.white
                      ): Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                width: 5.0,
              );
            },
            itemCount: 7,
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        ListView.separated(
            itemBuilder: (context,index){
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    availableDaysList[index],
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                              enabled: false,
                              fillColor: Colors.blueGrey.shade200,
                              hintText: "10:30 PM",
                              hintStyle: Theme.of(context).textTheme.bodyLarge,
                              filled: true,
                              suffixIcon: const Icon(
                                Icons.arrow_downward_outlined,
                                color: Colors.black,
                              )
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 50.0,
                      ),
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            enabled: false,
                            fillColor: Colors.blueGrey.shade200,
                            hintText: "10:30 PM",
                            hintStyle: Theme.of(context).textTheme.bodyLarge,
                            filled: true,
                            suffixIcon: const Icon(
                              Icons.arrow_downward_outlined,
                              color: Colors.black,
                            )
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 20.0,
              );
            },
            itemCount: availableDaysList.length,
            physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
        )
      ],
    );
  }
}
