import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:html/parser.dart' show parse;

void navigateTo(context, widget) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}

void navigateToToFinish(context, widget) {
  Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(builder: (context) => widget), (route) => false);
}


String formatTime(timeStamp) {
  var TimeStamp = DateTime.fromMillisecondsSinceEpoch(timeStamp);
  //return DateFormat('hh:mm a').format(TimeStamp).toString();


  // Convert timestamp string to DateTime
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);


  dateTime = dateTime.toLocal();



  // Format the DateTime to display only hours and minutes
  String formattedTime = DateFormat('hh:mm a', 'en_EG').format(dateTime.toLocal());

  return formattedTime;
}

void scrollToSelectedContent({required GlobalKey expansionTileKey}) {
  final keyContext = expansionTileKey.currentContext;
  if (keyContext != null) {
    Future.delayed(Duration(milliseconds: 200)).then((value) {
      Scrollable.ensureVisible(keyContext,
          duration: Duration(milliseconds: 200));
    });
  }
}



String cleanHtmlToPlainText(String htmlString, {int maxLength = 150}) {
  if (maxLength <= 0) {
    throw ArgumentError("maxLength must be greater than 0");
  }
  var document = parse(htmlString);
  String parsedString = parse(document.body!.text).documentElement!.text;

  // Truncate the result if it exceeds maxLength
  // if (parsedString.length > maxLength) {
  //   parsedString = parsedString.substring(0, maxLength) + "...";
  // }

  return parsedString;
}


class ContainerCliper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height -70);

    var firstStart = Offset(size.width * 0.5, size.height + 50);
    var firstend = Offset(size.width, size.height - 70);
    path.quadraticBezierTo(
        firstStart.dx, firstStart.dy, firstend.dx, firstend.dy);
    var secandStart = Offset(size.width, size.height);
    var secandend = Offset(size.width, size.height);
    path.quadraticBezierTo(
        secandStart.dx, secandStart.dy, secandend.dx, secandend.dy);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}