library noise_generation;

export 'noisegenerationcode.dart';

import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';

/// A Noise Generation App.

class NoiseBox extends StatefulWidget {
  @override
  State<NoiseBox> createState() => _NoiseBoxState();
}

class _NoiseBoxState extends State<NoiseBox>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  //dimension of noise box
  double _WIDTH = 100.0;
  double _HEIGHT = 100.0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Container(
          color: Colors.white,
          width: _WIDTH,
          height: _HEIGHT,
          child: AnimatedBuilder(
              animation: _animationController,
              builder: (BuildContext ctx, Widget? w) {
                return CustomPaint(
                  painter: NoisePainter(
                    width: _WIDTH,
                    height: _HEIGHT,
                  ),
                );
              }),
        ),
      ),
    );
  }
}

class NoisePainter extends CustomPainter {
  final double width;
  final double height;

  NoisePainter({required this.width, required this.height});

  List<Color> colors = [
    Colors.red,
    Colors.black,
    Colors.grey,
    Colors.purple,
    Colors.green
  ];

  @override
  void paint(Canvas canvas, Size size) {
    Random random = Random();

    for (int i = 0; i < this.width; i += 5) {
      for (int j = 0; j < this.height; j += 5) {
        Offset point = Offset(
          random.nextDouble() * (this.width), //getting random width
          random.nextDouble() * (this.height), //getting random height
        );
        Paint p = Paint();
        p.color = colors[random.nextInt(colors.length)];
        p.strokeWidth = random.nextDouble() * 2;

        canvas.drawPoints(PointMode.points, [point], p);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
