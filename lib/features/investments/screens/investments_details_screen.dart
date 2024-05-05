import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:tricares_doctor_app/core/component/SVG/svg.dart';
import 'package:tricares_doctor_app/core/globle/color/light_app_color.dart';

import '../../../core/component/ElevatedButton Widget/build_elevated_button.dart';
import '../../../core/widgets/Carousel Widget/carsousel_widget_screen.dart';

class InvestmentDetailsScreen extends StatefulWidget {
  final String name;
  const InvestmentDetailsScreen({Key? key,required this.name}) : super(key: key);

  @override
  State<InvestmentDetailsScreen> createState() => _InvestmentDetailsScreenState();
}

class _InvestmentDetailsScreenState extends State<InvestmentDetailsScreen> {
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    super.initState();
    _tooltipBehavior = TooltipBehavior(enable: true);
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CarouselSliderWidget(
                  width: width,
                  height: height,
                  images: const [
                    "https://images.unsplash.com/photo-1629909613654-28e377c37b09?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Y2xpbmljfGVufDB8fDB8fHww",
                    "https://img.freepik.com/free-photo/clinical-reception-with-waiting-room-facility-lobby-registration-counter-used-patients-with-medical-appointments-empty-reception-desk-health-center-checkup-visits_482257-51247.jpg?size=626&ext=jpg&ga=GA1.1.553209589.1714780800&semt=sph",
                    "https://img.freepik.com/free-photo/patient-nurse-sitting-reception-desk-talking-female-receptionist-about-disease-diagnosis-healthcare-support-diverse-people-working-health-center-registration-counter_482257-51641.jpg",
                  ],
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                  horizontal:  width * 0.026,
                  vertical:  height * 0.016
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Clinic Name",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Finishing case"*10,
                              style: Theme.of(context).textTheme.labelLarge,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const BuildIconSvg(
                                  name: "floor_space.svg",
                                color: LightAppColor.textColor,
                              ),
                              SizedBox(
                                height: height * 0.01,
                              ),
                              Text(
                                '120mx70m',
                                style: Theme.of(context).textTheme.labelSmall,

                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      SfCartesianChart(

                          primaryXAxis: CategoryAxis(),
                          // Chart title
                          title: const ChartTitle(text: 'Profit sales analysis'),
                          // Enable legend
                          legend: const Legend(isVisible: true),
                          // Enable tooltip
                          tooltipBehavior: _tooltipBehavior,

                          series: <LineSeries<SalesData, String>>[
                            LineSeries<SalesData, String>(
                                dataSource:  <SalesData>[
                                  SalesData('Jan', 35),
                                  SalesData('Feb', 28),
                                  SalesData('Mar', 34),
                                  SalesData('Apr', 32),
                                  SalesData('May', 40),
                                  SalesData('Jun', 40),
                                  SalesData('Jul', 20),
                                  SalesData('Aug', 10),
                                  SalesData('Sep', 20),
                                  SalesData('Oct', 100),
                                  SalesData('Nov', 50),
                                ],
                                xValueMapper: (SalesData sales, _) => sales.month,
                                yValueMapper: (SalesData sales, _) => sales.profit,
                                // Enable data label
                                dataLabelSettings: const DataLabelSettings(isVisible: true)
                            )
                          ]
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.026,
                  vertical: height * 0.016,
                ),
                child: BuildButton(
                  text: "Invest",
                  onPressed: () {

                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SalesData {
  late String month;
  late int profit;
  SalesData(this.month,this.profit);
}
