import 'dart:ui';
import 'package:flutter/material.dart';

class FrostedGlass extends StatelessWidget {
  final double height;
  final double width;
  final double borderRadius;
  final Widget theChild;
  const FrostedGlass({
    super.key,
    required this.height,
    required this.width,
    required this.borderRadius,
    required this.theChild,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Container(
        height: height,
        width: width,
        color: Colors.transparent,
        child: Stack(
          children: [
            //blur effect ====================

            BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 4, //for horizontal blur
                sigmaY: 4, //for vertical blur
              ),
              child: Container(),
            ),
            //gradient effect ==================
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadius),
                border: Border.all(color: Colors.white.withOpacity(0.3), width: 2),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white.withOpacity(0.1),
                    Colors.white.withOpacity(0.07),
                  ],
                ),
              ),
            ),
            //child =====================
            Positioned(left: 10, right: 10, child: theChild),
          ],
        ),
      ),
    );
  }
}
