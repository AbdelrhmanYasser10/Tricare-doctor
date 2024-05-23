import 'package:flutter/material.dart';
import 'package:tricares_doctor_app/features/Introduction/On%20Boarding%20Screen/widgets/top_image.dart';

import '../../../../generated/l10n.dart';
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
      title: S.current.board1Title,
      description: S.current.introDescription
  ),
  OnBoardingData(
      image: 'assets/images/board2.jpg',
      title: S.current.board2Title,
      description: S.current.introDescription
  ),

  OnBoardingData(
      image: 'assets/images/board3.jpg',
      title: S.current.board3Title,
      description: S.current.introDescription
  ),
];
