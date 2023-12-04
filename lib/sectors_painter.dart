import 'package:flutter/material.dart';
import 'package:touchable/touchable.dart';

class SectorsPainter extends CustomPainter {
  final BuildContext context;
  final String middleText;
  final Function onTap;

  SectorsPainter(
      {required this.context, required this.middleText, required this.onTap});

  @override
  void paint(Canvas canvas, Size size) {
    var myCanvas = TouchyCanvas(context, canvas);

    final Paint paint = Paint()
      ..isAntiAlias = true
      ..strokeWidth = 3.0
      ..style = PaintingStyle.fill;

    final double mainCircleDiameter = size.width;
    final double innerCircleDiameter = size.width / 5.5;

    Offset circleOffset = Offset(size.width / 2, size.width / 2);

    final arcsRect =
        Rect.fromLTWH(0, 0, mainCircleDiameter, mainCircleDiameter);
    const useCenter = true;

    List<Color> sectorColors = [
      const Color.fromARGB(255, 59, 169, 179),
      const Color.fromARGB(255, 46, 189, 194),
      const Color.fromARGB(255, 76, 208, 205),
      const Color.fromARGB(255, 59, 169, 179),
      const Color.fromARGB(255, 46, 189, 194),
      const Color.fromARGB(255, 76, 208, 205),
      const Color.fromARGB(255, 59, 169, 179),
      const Color.fromARGB(255, 46, 189, 194),
      const Color.fromARGB(255, 59, 169, 179),
      const Color.fromARGB(255, 76, 208, 205),
    ];

    List<String> toDo = [
      "Commute",
      "Walking",
      "At Work",
      "Big Event",
      "SOS",
      "Tough Day",
      "After Work",
      "Sleep",
      "Morning",
      "Taking A Break",
    ];

    const double sweepAngle = 0.628319; //36° en radians
    double startAngle = 0.0;

    for (int i = 0; i < 10; i++) {
      myCanvas.drawArc(arcsRect, startAngle, sweepAngle, useCenter,
          paint..color = sectorColors[i], onTapDown: (tapDetail) {
        onTap(toDo[i]);
      });
      startAngle = startAngle + sweepAngle;
    }

    canvas.drawCircle(circleOffset, innerCircleDiameter,
        paint..color = const Color.fromARGB(255, 28, 34, 45));

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
