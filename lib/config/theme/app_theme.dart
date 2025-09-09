import 'package:flutter/material.dart';

const List<Color> appColors = [
  Color(0xFF3B82F6),
  Color(0xFF10B981),
  Color(0xFF8B5CF6),
  Color(0xFF06B6D4),
  Color(0xFFF97316),
  Color(0xFF64748B),
  Color(0xFFEF4444)
];

class AppTheme {

  final int selectedColor;
  final bool isDarkMode;

  AppTheme({
    this.selectedColor = 3,
    this.isDarkMode = false
  }) : assert(selectedColor >= 0 && selectedColor < appColors.length, "Error: selectedColor must be >= 0 and < ${appColors.length}");

  ThemeData themeApp() => ThemeData(
    brightness: isDarkMode ? Brightness.dark : Brightness.light,
    colorSchemeSeed: appColors[selectedColor]
  );

  AppTheme copyWith({
    int? selectedColor,
    bool? isDarkMode
  }) => AppTheme(
    //selectedColor: selectedColor ?? this.selectedColor,
    isDarkMode: isDarkMode ?? this.isDarkMode
  );
  
}