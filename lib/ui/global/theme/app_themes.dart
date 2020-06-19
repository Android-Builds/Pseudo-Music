import 'package:flutter/material.dart';

enum AppTheme {
  GreenLight,
  GreenDark,
  BlueLight,
  BlueDark,
}

final appThemeData = {
  AppTheme.GreenLight: Colors.green,
  AppTheme.GreenDark: Colors.green[700],
  AppTheme.BlueLight: Colors.blue,
  AppTheme.BlueDark: Colors.blue[700],
};
