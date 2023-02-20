import 'package:flutter/material.dart';

/// Its height and width are infinite, if undefined.
class SpecialButton extends StatelessWidget {
  const SpecialButton({
    required this.child,
    this.height,
    this.width,
    super.key,
  });

  final double? height;
  final double? width;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color.fromARGB(255, 255, 59, 94),
            Color.fromARGB(255, 255, 0, 46),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(
            blurRadius: 10,
            offset: Offset(0, 2),
            color: Color.fromARGB(194, 255, 0, 47),
          ),
        ],
      ),
      padding: const EdgeInsets.all(15),
      height: height ?? double.infinity,
      width: width ?? double.infinity,
      alignment: Alignment.center,
      child: child,
    );
  }
}
