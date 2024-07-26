import 'package:flutter/material.dart';
import 'package:punto_venta/utils/responsive.dart';
import 'package:punto_venta/widgets/circle.dart';
import 'package:punto_venta/widgets/icon_container.dart';
import 'package:punto_venta/widgets/login_form.dart';

class LoginPage extends StatefulWidget {
  static const routeName = 'login';
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    //final Size size = MediaQuery.of(context).size;
    final double yellowSize = responsive.wp(70);
    final double blueSize = responsive.wp(60);
    final double pinkSize = responsive.wp(65);
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Container(
            width: responsive.width,
            height: responsive.height,
            color: Colors.white,
            child: Stack(alignment: Alignment.center, children: [
              Positioned(
                right: (yellowSize) * 0.3, //70
                top: -(yellowSize) * 0.4, //-100
                child: Circle(
                  size: yellowSize, //350
                  colors: const [
                    Color.fromARGB(255, 215, 215, 0),
                    Color.fromARGB(255, 255, 255, 1)
                  ],
                ),
              ),
              Positioned(
                left: -(blueSize) * 0.15, //-90
                top: -(blueSize) * 0.6, //-150
                child: Circle(
                  size: blueSize, //300
                  colors: const [
                    Color.fromARGB(255, 0, 68, 141),
                    Color.fromARGB(255, 10, 108, 181),
                  ],
                ),
              ),
              Positioned(
                right: -(pinkSize) * 0.2, //-100
                top: -(pinkSize) * 0.4, //-150
                child: Circle(
                  size: pinkSize, //380
                  colors: const [
                    Color.fromARGB(255, 150, 0, 57),
                    Color.fromARGB(255, 190, 1, 97)
                  ],
                ),
              ),
              Positioned(
                top: (pinkSize * 0.4),
                child: IconContainer(
                  size: responsive.wp(20),
                ),
              ),
              const LoginForm()
            ]),
          ),
        ),
      ),
    );
  }
}
