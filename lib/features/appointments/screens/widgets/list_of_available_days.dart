import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:tricares_doctor_app/core/component/ElevatedButton%20Widget/build_elevated_button.dart';

import '../../../../core/globle/color/shared_color.dart';

class ListOfAvailableDays extends StatefulWidget {
  const ListOfAvailableDays({Key? key}) : super(key: key);

  @override
  State<ListOfAvailableDays> createState() => _ListOfAvailableDaysState();
}

class _ListOfAvailableDaysState extends State<ListOfAvailableDays> {
  Map<String, bool> availableDays = {
    "Saturday": false,
    "Sunday": false,
    "Monday": false,
    "Tuesday": false,
    "Wednesday": false,
    "Thursday": false,
    "Friday": false,
  };
  Map<String, List<TextEditingController>> mapOfFromTo = {
    "Saturday": [],
    "Sunday": [],
    "Monday": [],
    "Tuesday": [],
    "Wednesday": [],
    "Thursday": [],
    "Friday": [],
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
                onTap: () {
                  setState(() {
                    availableDays[keyVal] = !availableDays[keyVal]!;
                    if (availableDays[keyVal]!) {
                      availableDaysList.add(keyVal);
                      mapOfFromTo[keyVal]!.addAll([
                        TextEditingController(),
                        TextEditingController(),
                      ]);
                    } else {
                      availableDaysList.remove(keyVal);
                      mapOfFromTo[keyVal] = [];
                    }
                  });
                },
                child: Container(
                  height: 40,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 5.0),
                  decoration: BoxDecoration(
                      color: res
                          ? AppColor.primaryColor
                          : Colors.blueGrey.shade200,
                      borderRadius: BorderRadius.circular(12.0)),
                  child: Center(
                    child: Text(
                      availableDays.keys.elementAt(index),
                      style: res
                          ? Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(color: Colors.white)
                          : Theme.of(context).textTheme.labelLarge,
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
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        availableDaysList[index],
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    /*TextButton(
                        onPressed: (){
                          setState(() {
                            mapOfFromTo[availableDaysList[index]]!.addAll([
                              TextEditingController(),
                              TextEditingController(),
                            ]);
                          });
                        },
                        child: Text(
                          "Add Another Interval",
                          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: AppColor.primaryColor,
                          ),
                        ),
                    ),*/
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                ListView.separated(
                    itemBuilder: (_, i) {
                      var textEditingControllerFrom = mapOfFromTo[availableDaysList[index]]![i];
                      var textEditingControllerTo = mapOfFromTo[availableDaysList[index]]![i + 1];
                      var hint1 = timeFormatter(pickedTime: TimeOfDay.now());
                      var hint2 = timeFormatter(pickedTime: TimeOfDay.fromDateTime(DateTime.now().add(const Duration(minutes: 30))));
                      return Row(
                        children: [
                          Expanded(
                            child: _timePickerFormField(
                              hintText: "From",
                              editingController: textEditingControllerFrom,
                              hint: hint1,
                              validator: (p0) {

                              },
                            ),
                          ),
                          const SizedBox(
                            width: 50.0,
                          ),
                          Expanded(
                            child: _timePickerFormField(
                              hintText: "to",
                              hint: hint2,
                              validator: (p0) {

                              },
                              editingController: textEditingControllerTo,
                            ),
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (context_, _) {
                      return const SizedBox(
                        height: 10.0,
                      );
                    },
                    itemCount: (mapOfFromTo[availableDaysList[index]]!.length / 2).round(),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
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
        ),
        SizedBox(
          height: 50.0,
        ),
        BuildButton(
            text: "Set",
          onPressed: () {
          },
        ),
      ],
    );
  }

  Widget _timePickerFormField({
    required String hintText,
    required TextEditingController editingController,
    required String hint,
    required String?Function(String?) validator,
  }) {
    return GestureDetector(
      onTap: () {
        showTimePicker(
          context: context,
          initialTime: TimeOfDay.now(),
        ).then((value) {
          if(value!=null) {
            editingController.text = timeFormatter(pickedTime: value);
          }
        });
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            hintText,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          TextFormField(
            controller: editingController,
            validator: validator,
            style: Theme.of(context).textTheme.bodyLarge,

            decoration: InputDecoration(
                enabled: false,
                fillColor: Colors.blueGrey.shade200,
                hintText: hint,
                hintStyle: Theme.of(context).textTheme.bodyLarge,
                filled: true,
                suffixIcon: const Icon(
                  Icons.arrow_downward_outlined,
                  color: Colors.black,
                ),
            ),
          ),
        ],
      ),
    );
  }

  String timeFormatter({required TimeOfDay pickedTime}){
    String formattedTime = '${pickedTime.hour.toString().padLeft(2, '0')}:${pickedTime.minute.toString().padLeft(2, '0')}';
    return formattedTime;
  }
}
