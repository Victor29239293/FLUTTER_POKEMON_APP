import 'dart:math' as math;
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
//import 'package:flutter_svg/flutter_svg.dart';

import '../../domain/domain.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key, required this.pokemon, required this.press});
  final Pokemon pokemon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    final random = math.Random();

    return FadeInUp(
      from: random.nextInt(100) + 80,
      delay: Duration(milliseconds: random.nextInt(450) + 0),
      child: GestureDetector(
        onTap: press,
        child: Container(
          height: 200,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(17),
                child: Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        const Color.fromARGB(255, 2, 51, 124),
                        const Color.fromARGB(255, 30, 80, 150),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(17),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: CustomPaint(painter: PokeBallPatternPainter()),
                ),
              ),

              Positioned(
                right: -18,
                top: 40,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final cardWidth = MediaQuery.of(context).size.width - 32;
                    const cardHeight = 200.0;
                    final maxImgWidth = cardWidth * 0.35;
                    final maxImgHeight = cardHeight * 0.6;
                    final imageSize = maxImgWidth < maxImgHeight
                        ? maxImgWidth
                        : maxImgHeight;
                    return Hero(
                      tag: "${pokemon.id}",
                      child: Container(
                        height: imageSize,
                        width: imageSize,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white.withOpacity(0.2),
                              blurRadius: 20,
                              spreadRadius: 5,
                            ),
                          ],
                        ),
                        child: ClipOval(
                          child: SvgPicture.network(
                            pokemon.sprites.other.dreamWorld.frontDefault,
                            height: imageSize,
                            width: imageSize,
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.1),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.catching_pokemon,
                                  color: Colors.white54,
                                  size: 60,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PokeBallPatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width * 0.85, size.height * 0.15);
    const radius = 40.0;
    const centerButtonRadius = 10.0;
    const innerButtonRadius = 6.0;
    final paintUpperHalf = Paint()
      ..color = Colors.red.withOpacity(0.15)
      ..style = PaintingStyle.fill;
    final paintLowerHalf = Paint()
      ..color = Colors.white.withOpacity(0.2)
      ..style = PaintingStyle.fill;
    final paintOutline = Paint()
      ..color = Colors.white.withOpacity(0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    final paintCenter = Paint()
      ..color = Colors.white.withOpacity(0.4)
      ..style = PaintingStyle.fill;
    final paintCenterOutline = Paint()
      ..color = Colors.grey.withOpacity(0.5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    final paintInnerButton = Paint()
      ..color = Colors.black.withOpacity(0.2)
      ..style = PaintingStyle.fill;
    final upperHalf = Path()
      ..addArc(
        Rect.fromCircle(center: center, radius: radius),
        -math.pi,
        math.pi,
      )
      ..close();
    canvas.drawPath(upperHalf, paintUpperHalf);
    final lowerHalf = Path()
      ..addArc(Rect.fromCircle(center: center, radius: radius), 0, math.pi)
      ..close();
    canvas.drawPath(lowerHalf, paintLowerHalf);
    canvas.drawLine(
      Offset(center.dx - radius, center.dy),
      Offset(center.dx + radius, center.dy),
      paintOutline,
    );
    canvas.drawCircle(center, radius, paintOutline);
    canvas.drawCircle(center, centerButtonRadius, paintCenter);
    canvas.drawCircle(center, centerButtonRadius, paintCenterOutline);
    canvas.drawCircle(center, innerButtonRadius, paintInnerButton);
    final shinePaint = Paint()
      ..color = Colors.white.withOpacity(0.6)
      ..style = PaintingStyle.fill;

    canvas.drawCircle(Offset(center.dx - 3, center.dy - 3), 2, shinePaint);
    final decorativePaint = Paint()
      ..color = Colors.white.withOpacity(0.15)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(
      Offset(center.dx - radius * 0.5, center.dy - radius * 0.5),
      3,
      decorativePaint,
    );

    canvas.drawCircle(
      Offset(center.dx + radius * 0.4, center.dy + radius * 0.4),
      2,
      decorativePaint,
    );
    final center2 = Offset(size.width * 0.15, size.height * 0.85);
    const radius2 = 25.0;
    final paintSmallUpper = Paint()
      ..color = Colors.blue.withOpacity(0.1)
      ..style = PaintingStyle.fill;
    final paintSmallLower = Paint()
      ..color = Colors.white.withOpacity(0.15)
      ..style = PaintingStyle.fill;
    final paintSmallOutline = Paint()
      ..color = Colors.white.withOpacity(0.25)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;
    final upperHalf2 = Path()
      ..addArc(
        Rect.fromCircle(center: center2, radius: radius2),
        -math.pi,
        math.pi,
      )
      ..close();
    canvas.drawPath(upperHalf2, paintSmallUpper);

    final lowerHalf2 = Path()
      ..addArc(Rect.fromCircle(center: center2, radius: radius2), 0, math.pi)
      ..close();
    canvas.drawPath(lowerHalf2, paintSmallLower);

    canvas.drawLine(
      Offset(center2.dx - radius2, center2.dy),
      Offset(center2.dx + radius2, center2.dy),
      paintSmallOutline,
    );

    canvas.drawCircle(center2, radius2, paintSmallOutline);
    canvas.drawCircle(center2, 6, paintCenter);
    canvas.drawCircle(center2, 4, paintInnerButton);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
