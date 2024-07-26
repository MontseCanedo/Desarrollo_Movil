import 'package:flutter/material.dart';
//import 'package:flutter_svg/flutter_svg.dart';

class IconContainer extends StatelessWidget {
  final double size;
  const IconContainer({super.key, required this.size}) : assert(size > 0);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(size * 0.17),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 20,
            offset: Offset(0, 15),
          )
        ],
      ),
      padding: EdgeInsets.all(size * 0.042),
      child: Center(
        child: Image.asset(
          'assets/logoTTP.ico',
          width: size * 0.83,
          height: size * 0.83,
        ),
        /* SvgPicture.asset(
          'assets/logoTTP.png',
          width: 80,
          height: 80,
        ), */
      ),
    );
  }
}
