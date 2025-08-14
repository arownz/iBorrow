import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// Text style helper for iBorrow application
class TextStyleHelper {
  static TextStyleHelper? _instance;

  TextStyleHelper._();

  static TextStyleHelper get instance {
    _instance ??= TextStyleHelper._();
    return _instance!;
  }

  // Display Styles - Large headers
  TextStyle get display36RegularInter => TextStyle(
    fontSize: 36.fSize,
    fontWeight: FontWeight.w400,
    fontFamily: 'Inter',
    color: appTheme.blackCustom,
  );

  TextStyle get display36Regular => TextStyle(
    fontSize: 36.fSize,
    fontWeight: FontWeight.w400,
    color: appTheme.blackCustom,
  );

  // Title Styles
  TextStyle get title20RegularRoboto => TextStyle(
    fontSize: 20.fSize,
    fontWeight: FontWeight.w400,
    fontFamily: 'Roboto',
  );

  TextStyle get title18Bold => TextStyle(
    fontSize: 18.fSize,
    fontWeight: FontWeight.bold,
    color: appTheme.blackCustom,
  );

  // Body Styles - Standard content
  TextStyle get body16Regular => TextStyle(
    fontSize: 16.fSize,
    fontWeight: FontWeight.w400,
    color: appTheme.blackCustom,
  );

  TextStyle get body14 =>
      TextStyle(fontSize: 14.fSize, color: appTheme.blackCustom);

  TextStyle get body13RegularInter => TextStyle(
    fontSize: 13.fSize,
    fontWeight: FontWeight.w400,
    fontFamily: 'Inter',
    color: appTheme.blackCustom,
  );

  TextStyle get body13Regular => TextStyle(
    fontSize: 13.fSize,
    fontWeight: FontWeight.w400,
    color: appTheme.blackCustom,
  );

  TextStyle get body13 =>
      TextStyle(fontSize: 13.fSize, color: appTheme.blackCustom);

  // Label Styles - Small text
  TextStyle get label12Regular => TextStyle(
    fontSize: 12.fSize,
    fontWeight: FontWeight.w400,
    color: appTheme.blackCustom,
  );

  TextStyle get label10RegularInter => TextStyle(
    fontSize: 10.fSize,
    fontWeight: FontWeight.w400,
    fontFamily: 'Inter',
    color: appTheme.blackCustom,
  );

  TextStyle get label10BoldInter => TextStyle(
    fontSize: 10.fSize,
    fontWeight: FontWeight.w700,
    fontFamily: 'Inter',
    color: appTheme.colorFFA34A,
  );

  TextStyle get label10Regular => TextStyle(
    fontSize: 10.fSize,
    fontWeight: FontWeight.w400,
    color: appTheme.blackCustom,
  );

  TextStyle get label10Bold => TextStyle(
    fontSize: 10.fSize,
    fontWeight: FontWeight.bold,
    color: appTheme.colorFFA34A,
  );

  // Button Styles
  TextStyle get buttonText => TextStyle(
    fontSize: 14.fSize,
    fontWeight: FontWeight.w600,
    color: appTheme.whiteCustom,
  );

  // Other Styles
  TextStyle get bodyTextInter =>
      TextStyle(fontFamily: 'Inter', color: appTheme.blackCustom);

  // Error and Success styles
  TextStyle get errorText => TextStyle(
    fontSize: 12.fSize,
    color: Colors.red,
    fontWeight: FontWeight.w400,
  );

  TextStyle get successText => TextStyle(
    fontSize: 12.fSize,
    color: Colors.green,
    fontWeight: FontWeight.w400,
  );
}
