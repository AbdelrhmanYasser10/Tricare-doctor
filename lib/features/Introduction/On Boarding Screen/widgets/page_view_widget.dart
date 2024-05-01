import 'package:flutter/material.dart';
import 'package:tricares_doctor_app/features/Introduction/On%20Boarding%20Screen/widgets/top_image.dart';

import 'down_container.dart';


class BuildPageViewWidget extends StatelessWidget {
  final PageController boardController;

  const BuildPageViewWidget({super.key, required this.boardController});

  @override
  Widget build(BuildContext context) {

    return PageView.builder(
      itemCount: 3,
      itemBuilder: (context, index) {
        return Stack(
          children: [
            BuildTopWidget(image: data[index].image),
            BuildDownContainer(
              title: data[index].title,
              description: data[index].description,
            )
          ],
        );
      },
      controller: boardController,
    );
  }


}

class OnBoardingData {
  final String image;
  final String title;
  final String description;

  OnBoardingData(
      {required this.image, required this.title, required this.description});
}

List<OnBoardingData> data = [
  OnBoardingData(
      image: 'assets/images/board1.jpg',
      title: 'Welcome To TriCare',
      description: 'welcome to TriCare, your trusted companion for personalized medical care. Experience a new era of healthcare right at your fingertips'
  ),
  OnBoardingData(
      image: 'assets/images/board2.jpg',
      title: 'Your Health Your Way',
      description: 'welcome to TriCare, your trusted companion for personalized medical care. Experience a new era of healthcare right at your fingertips'
  ),

  OnBoardingData(
      image: 'assets/images/board3.jpg',
      title: 'Connect With TriCare',
      description: 'welcome to TriCare, your trusted companion for personalized medical care. Experience a new era of healthcare right at your fingertips'
  ),
];
