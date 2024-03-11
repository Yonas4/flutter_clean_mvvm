import 'package:flutter/material.dart';

import 'package:flutter_clean_mvvm/presentation/resources/font_manager.dart';

TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color) {
  return TextStyle(
    fontSize: fontSize,
    fontFamily: FontConstants.fontFamily,
    color: color,
    fontWeight: fontWeight,
  );
}

// regular style

TextStyle getRegularStyle({
  required Color color,
  double fontSize = FontSize.s12,
}) {
  return _getTextStyle(fontSize, FontWeightManager.regular, color);
}

// medium style

TextStyle getMediumStyle({
  required Color color,
  double fontSize = FontSize.s12,
}) {
  return _getTextStyle(fontSize, FontWeightManager.medium, color);
}

// medium style

TextStyle getLightStyle({
  required Color color,
  double fontSize = FontSize.s12,
}) {
  return _getTextStyle(fontSize, FontWeightManager.light, color);
}

// bold style

TextStyle getBoldStyle({
  required Color color,
  double fontSize = FontSize.s12,
}) {
  return _getTextStyle(fontSize, FontWeightManager.bold, color);
}

// semibold style

TextStyle getSemiBoldStyle({
  required Color color,
  double fontSize = FontSize.s12,
}) {
  return _getTextStyle(fontSize, FontWeightManager.semiBold, color);
}
