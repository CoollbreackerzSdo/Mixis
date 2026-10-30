import 'package:flutter/material.dart';

class PixelShadow extends BoxShadow {
  const PixelShadow({Color color = const Color(0xFF3B2F2F)})
      : super(color: color, offset: const Offset(4, 4), blurRadius: 0, spreadRadius: 0);
}

class PixelCard extends StatelessWidget {
  const PixelCard({super.key, required this.child, this.padding = const EdgeInsets.all(12)});
  final Widget child;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final border = isDark ? Colors.white70 : const Color(0xFF3B2F2F);
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        border: Border.all(color: border, width: 3),
        boxShadow: [PixelShadow(color: border)],
      ),
      child: child,
    );
  }
}

class CheckerboardBackground extends StatelessWidget {
  const CheckerboardBackground({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _CheckerPainter(Theme.of(context).brightness),
      child: child,
    );
  }
}

class _CheckerPainter extends CustomPainter {
  _CheckerPainter(this.brightness);
  final Brightness brightness;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = (brightness == Brightness.dark
              ? const Color(0xFF2A2320)
              : const Color(0xFFEFE6D8))
          .withValues(alpha: 0.35);
    const cell = 16.0;
    for (double y = 0; y < size.height; y += cell) {
      for (double x = 0; x < size.width; x += cell) {
        final ix = (x / cell).floor();
        final iy = (y / cell).floor();
        if ((ix + iy) % 2 == 0) {
          canvas.drawRect(Rect.fromLTWH(x, y, cell, cell), paint);
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant _CheckerPainter old) => old.brightness != brightness;
}
