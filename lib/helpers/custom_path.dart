import 'package:flutter/material.dart';

class CustomClipPath extends CustomClipper<Path> {
  var radius = 5.0;

  @override
  Path getClip(Size size) {
    final w = size.width;
    final h = size.height;
    Path path = Path();

    // (0,0)
    path.moveTo(0, 0);
    path.lineTo(0, h);
    path.lineTo(w, h);
    path.lineTo(w, h * 0.6);
    path.lineTo(w * 0.8, 0);
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
