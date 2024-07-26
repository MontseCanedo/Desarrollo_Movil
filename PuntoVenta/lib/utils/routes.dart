import 'package:flutter/material.dart';

import 'package:punto_venta/pages/home_page.dart';
import 'package:punto_venta/pages/login_page.dart';

class Routes extends StatelessWidget {
  final int index;

  const Routes({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> myList = [
      const HomePage(),
      const LoginPage(),
    ];
    return myList[index];
  }
}
