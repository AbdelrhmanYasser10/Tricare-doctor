import 'package:flutter/material.dart';
import 'package:tricares_doctor_app/features/home/screens/widget/great_perosn.dart';
import 'package:tricares_doctor_app/features/home/screens/widget/inside_icon_widgets.dart';
import 'package:tricares_doctor_app/features/home/screens/widget/my_tab_container.dart';
import 'package:tricares_doctor_app/features/home_layout/cubits/app_cubit/app_cubit.dart';
import '../../../core/widgets/Carousel Widget/carsousel_widget_screen.dart';
import '../../../core/widgets/product Item Widget/build_product_item.dart';
import 'widget/title_widget.dart';

class HomeScreen extends StatefulWidget {
   const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();

  List<String> images = [
    'https://www.shutterstock.com/image-photo/medicine-healthcare-people-concept-female-600nw-2188588635.jpg',
    'https://www.shutterstock.com/image-photo/smiling-young-female-doctor-shake-600nw-1930973966.jpg',
    'https://www.shutterstock.com/image-photo/female-doctor-holding-application-form-600nw-158366573.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: width*0.03),
        child:   SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const GreatPerson(name: 'Ahmed Magdy',),
              SizedBox(height: height*0.02,),
              CarouselSliderWidget(
                width: double.infinity,
                height: height,
                images: images,

              ),
              TitleWidget(
                title: 'Check Your',
                onTap: (){},
                showSeeAll: false,
              ),
              const InsideIconWidget(),
              TitleWidget(
                title: 'About us',
                onTap: (){},
                showSeeAll: false,
              ),
              MyTabContainer(
                height: height,
                width: width,
                cubit: AppCubit.get(context),
              ),

              SizedBox(height: height*0.03,),

            ],
          ),
        ),
      ),
    );
  }
}
