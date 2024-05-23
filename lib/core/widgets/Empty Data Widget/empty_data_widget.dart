import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';
import '../../component/SVG/svg.dart';

class BuildEmptyDataWidget extends StatelessWidget {

  String? text;


   BuildEmptyDataWidget({
    Key? key,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return  Center(
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: width*0.04),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const BuildIconSvg(name: 'empty.svg',size: 120,color: Colors.black,),
            SizedBox(height: height*0.03,),
            Text(
             text?? S.of(context).emptyData,
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
