import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../component/Network Image/network_image.dart';
import '../../functions/fucntions.dart';

class BuildProductItem extends StatelessWidget {
  final String image;
  final String name;
  final String description;

  const BuildProductItem({
    super.key,
    required this.name,
    required this.image,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Card(
      child: Column(
        children: [
          SizedBox(
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: BuildImage(
                image: image,
                fit: BoxFit.cover,
                radius: 5.0,
                borderAll: false,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: height * 0.01, horizontal: width * 0.01),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: width,
                    child: Text(
                      name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  Text(
                    cleanHtmlToPlainText(description, maxLength: 200),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Colors.grey,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
