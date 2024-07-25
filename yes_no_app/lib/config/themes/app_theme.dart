import 'package:flutter/material.dart';

const Color _customColor = Color(
    0xFF49149F); //en flutter se debe poner el prefijo 0xFF antes del hexadeciaml del color
const List<Color> _colorThemes = [
  _customColor,
  Colors.black,
  Colors.cyan,
  Colors.blueGrey,
  Colors.lightGreen,
  Colors.orangeAccent,
  Colors.teal,
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0 && selectedColor <= _colorThemes.length - 1,
            'Colors must be between 0 and ${_colorThemes.length}');

  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[selectedColor],
      //brightness: Brightness.dark,
    );
  }
}
