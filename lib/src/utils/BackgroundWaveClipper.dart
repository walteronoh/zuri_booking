import 'package:flutter/material.dart';

class BackgroundWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    var endPoint1 = Offset(20, size.height - 10);
    var controlPoint1 = Offset(10, size.height - 17.5);
    var endPoint2 = Offset(size.width - 20, size.height - 10);
    var controlPoint2 = Offset(size.width - 10, size.height - 5);
    path.lineTo(0.0, size.height - 25);
    path.quadraticBezierTo(controlPoint1.dx, controlPoint1.dy, endPoint1.dx, endPoint1.dy);
    path.lineTo(endPoint1.dx, endPoint1.dy);
    path.lineTo(endPoint2.dx, endPoint2.dy);
    path.quadraticBezierTo(controlPoint2.dx, controlPoint2.dy, endPoint2.dx, endPoint2.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return oldClipper != this;
  }
}
