import 'package:flutter/material.dart';

class Circle extends StatelessWidget {
  final double size;
  final List<Color> colors;

  const Circle({super.key, required this.size, required this.colors})
      : assert(size > 0),
        assert(colors.length >= 2); //size != null &&

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          //color: Color.fromARGB(255, 10, 108, 181),
          shape: BoxShape.circle,
          gradient: LinearGradient(
              colors: colors,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
    );
  }
}
