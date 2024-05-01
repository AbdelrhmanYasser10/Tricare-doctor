import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tricares_doctor_app/core/component/SVG/svg.dart';
import 'package:tricares_doctor_app/core/globle/color/light_app_color.dart';

import '../../../../core/globle/color/shared_color.dart';
import '../../cubits/examination_cubit/examination_cubit.dart';
class PageViewShape extends StatelessWidget {
  const PageViewShape({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocConsumer<ExaminationCubit, ExaminationState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ExaminationCubit.get(context);
        return PageView.builder(
          controller: context.read<ExaminationCubit>().pageController,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return Container(
                      height: height * 0.21,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                        vertical: 8.0
                      ),
                      decoration: BoxDecoration(
                        color: AppColor.primaryColor,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 24,
                                  backgroundColor: Colors.white,
                                  child: BuildIconSvg(
                                    name: "person.svg",
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.07,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Patient Name",
                                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                        color: Colors.white
                                      ),
                                    ),
                                    Text(
                                      "Status",
                                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                        color: Colors.white
                                      ),
                                    ),

                                  ],
                                ),

                              ],
                            ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: width * 0.03,
                                vertical: height * 0.021
                            ),
                            decoration: BoxDecoration(
                              color: AppColor.patientCardColor,
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.date_range,
                                        color: Colors.white,
                                        size: 25.0,
                                      ),
                                      SizedBox(
                                        width: width * 0.03,
                                      ),
                                      Text(
                                        "Monday, 26 Jul",
                                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.02,
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.access_time_outlined,
                                        color: Colors.white,
                                        size: 25.0,
                                      ),
                                      SizedBox(
                                        width: width * 0.03,
                                      ),
                                      Text(
                                        "10:00 AM",
                                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 20.0,
                    );
                  },
                  itemCount: 12,
              ),
            );
          },
          physics: const BouncingScrollPhysics(),
          itemCount: 2,
          onPageChanged: (value) {
            cubit.changeTabIdx(idx: value);
          },
        );
      },
    );
  }
}
