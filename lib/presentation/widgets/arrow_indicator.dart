import 'package:flutter/material.dart';

class ArrowIndicator extends StatelessWidget {
  final double direction;

  const ArrowIndicator({
    Key? key,
    required this.direction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// For rotation of triangle pointer
    return Transform.rotate(
      angle: direction,
      alignment: Alignment.center,
      child: Center(
        child: CustomPaint(
          size: const Size(50, 50),
          painter: DrawTriangleShape(),
        ),
      ),
    );
  }
}

class DrawTriangleShape extends CustomPainter {
  var painter = Paint()
    ..color = Colors.white
    ..style = PaintingStyle.fill;

  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();

    /// For Top point of triangle
    path.moveTo(size.width / 2, size.height * -1.8);

    /// For Bottom right point of triangle
    path.lineTo(0, size.height * -1);

    /// For Bottom left point
    path.lineTo(size.width, size.height * -1); // For Bottom left point
    path.close();
    canvas.drawPath(path, painter);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
