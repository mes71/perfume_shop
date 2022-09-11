import 'package:flutter/material.dart';

class AppClipper extends CustomClipper<Path> {
  double radius;
  double midRightRadius;
  double bottomRightRadius;
  bool clockWiseFloatActionButton;

  AppClipper(this.radius, this.midRightRadius, this.bottomRightRadius,
      [this.clockWiseFloatActionButton = false]);

  @override
  Path getClip(Size size) {
    var cp = Offset((size.width) / 100, (size.height / 1.25) - size.height);
    return Path()
      ..moveTo(0, size.height / 3)
      ..lineTo(0, size.height - radius)
      ..arcToPoint(Offset(radius, size.height),
          radius: Radius.circular(radius), clockwise: false)
      ..lineTo(radius, size.height)
      ..lineTo(size.width - bottomRightRadius, size.height)
      ..arcToPoint(Offset(size.width, size.height - bottomRightRadius),
          radius: Radius.circular(bottomRightRadius),
          clockwise: clockWiseFloatActionButton)
      ..lineTo(size.width, size.height / 2)
      ..arcToPoint(
          Offset(size.width - 2, (size.height / 2) - (midRightRadius / 5)),
          clockwise: false,
          radius: Radius.circular(midRightRadius))
      ..quadraticBezierTo(cp.dx, cp.dy, 0, (size.height / 5) - radius)
      ..close();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
