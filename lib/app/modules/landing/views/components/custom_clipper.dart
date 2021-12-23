import 'package:ash_tree/app/constants/colors.dart';
import 'package:flutter/material.dart';

class WaveClipper extends CustomClipper<Path> {
  final Color color = kPrimaryColor;
  WaveClipper();

  @override
  Path getClip(Size size) {
    final height = size.height;
    final width = size.width;
    var path = Path();
    path.lineTo(0, height * 0.8);
    path.quadraticBezierTo(
        width * 0.1, height * 0.95, width * 0.22, height * 0.8);
    path.quadraticBezierTo(
        width * 0.4, height * 0.55, width * 0.49, height * 0.85);
    path.quadraticBezierTo(width * 0.55, height, width * 0.62, height * 0.85);
    path.quadraticBezierTo(
        width * 0.78, height * 0.4, width * 0.9, height * 0.7);
    path.quadraticBezierTo(width * 0.95, height * 0.8, width, height * 0.75);
    path.lineTo(width, 0);
    path.lineTo(0, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
