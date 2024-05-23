import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:google_fonts/google_fonts.dart';

class TabContent extends StatelessWidget {

  final String  htmlContent;
  const TabContent({Key? key,required this.htmlContent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.03, vertical: height * 0.03),
        child: HtmlWidget(
          htmlContent,
          textStyle: GoogleFonts.cairo(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
