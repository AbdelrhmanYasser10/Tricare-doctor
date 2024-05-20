import 'package:flutter/material.dart';

import '../../../component/components.dart';

class BuildLoadingShimmerNotification extends StatelessWidget {
  const BuildLoadingShimmerNotification({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BuildShimmer(
      child: ListView.builder(
        itemCount: 20,
        itemBuilder: (context,index){
          return Container(
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(8),
            ),
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(10),
            child: SizedBox(
              child: Row(
                children: [

                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Loading.....',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        Row(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.date_range,
                                  size: 15,
                                ),
                                SizedBox(
                                  width: width * 0.01,
                                ),
                                Text(
                                  'Loading.....',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ],
                            ),
                            SizedBox(
                              width: width * 0.03,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.timer_outlined,
                                  size: 15,
                                ),
                                SizedBox(
                                  width: width * 0.01,
                                ),
                                Text(
                                  'Loading.....',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: width*0.02,),

                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
