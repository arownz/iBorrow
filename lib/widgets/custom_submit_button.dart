import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// Custom submit button for iBorrow application
class CustomSubmitButton extends StatelessWidget {
  const CustomSubmitButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.width,
    this.height,
    this.backgroundColor,
    this.textColor,
    this.fontSize,
    this.borderRadius,
    this.isEnabled = true,
    this.isLoading = false,
  }) : super(key: key);

  final String text;
  final VoidCallback? onPressed;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final Color? textColor;
  final double? fontSize;
  final double? borderRadius;
  final bool isEnabled;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final Color bgColor = backgroundColor ?? appTheme.colorFFFC85;
    final Color txtColor = textColor ?? appTheme.whiteCustom;
    final double btnWidth = width ?? double.infinity;
    final double btnHeight = height ?? 48.h;
    final double btnFontSize = fontSize ?? 16.fSize;
    final double btnBorderRadius = borderRadius ?? 8.h;

    return SizedBox(
      width: btnWidth,
      height: btnHeight,
      child: ElevatedButton(
        onPressed: (isEnabled && !isLoading) ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          foregroundColor: txtColor,
          disabledBackgroundColor: bgColor.withOpacity(0.5),
          disabledForegroundColor: txtColor.withOpacity(0.5),
          elevation: 2,
          shadowColor: appTheme.transparentCustom,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(btnBorderRadius),
          ),
          padding: EdgeInsets.zero,
        ),
        child: isLoading
            ? SizedBox(
                width: 20.h,
                height: 20.h,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(txtColor),
                ),
              )
            : Text(
                text,
                style: TextStyleHelper.instance.buttonText.copyWith(
                  fontSize: btnFontSize,
                  color: txtColor,
                ),
              ),
      ),
    );
  }
}
