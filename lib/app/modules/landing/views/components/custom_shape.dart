import 'package:ash_tree/app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WavePainter extends CustomPainter {
  final Color color = kPrimaryColor;
  WavePainter();
  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;
    final totalHeight = Get.height;
    var paint = Paint();
    paint.color = color;
    paint.style = PaintingStyle.fill;
    var path = Path();
    path.lineTo(0, height * 0.8);

    if (height < totalHeight * 0.2) {
      path.lineTo(width, height * 0.8);
    } else {
      path.quadraticBezierTo(
          width * 0.1, height * 0.95, width * 0.22, height * 0.8);
      path.quadraticBezierTo(
          width * 0.4, height * 0.55, width * 0.49, height * 0.85);
      path.quadraticBezierTo(width * 0.55, height, width * 0.62, height * 0.85);
      path.quadraticBezierTo(
          width * 0.78, height * 0.4, width * 0.9, height * 0.7);
      path.quadraticBezierTo(width * 0.95, height * 0.8, width, height * 0.75);
    }
    path.lineTo(width, 0);
    path.lineTo(0, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class WavePainterHeader extends CustomPainter {
  final Color color = kPrimaryColor;
  WavePainterHeader();
  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;
    final totalHeight = Get.height;
    var paint = Paint();
    paint.color = color;
    paint.style = PaintingStyle.fill;
    var path = Path();
    path.lineTo(0, height * 0.9);

    if (height < totalHeight * 0.3) {
      path.lineTo(width, height * 0.9);
    } else {
      path.quadraticBezierTo(
          width * 0.1, height * 0.95, width * 0.22, height * 0.8);
      path.quadraticBezierTo(
          width * 0.4, height * 0.55, width * 0.49, height * 0.85);
      path.quadraticBezierTo(width * 0.55, height, width * 0.62, height * 0.85);
      path.quadraticBezierTo(
          width * 0.78, height * 0.4, width * 0.9, height * 0.7);
      path.quadraticBezierTo(width * 0.95, height * 0.8, width, height * 0.75);
    }
    path.lineTo(width, 0);
    path.lineTo(0, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
