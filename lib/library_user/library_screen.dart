import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// Library screen showing all available books for browsing
class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.colorFFFFF2,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.library_books,
                size: 64.h,
                color: appTheme.colorFFFC85,
              ),
              SizedBox(height: 16.h),
              Text(
                'Library Screen',
                style: TextStyleHelper.instance.title18Bold,
              ),
              SizedBox(height: 8.h),
              Text(
                'Browse all available books',
                style: TextStyleHelper.instance.body13Regular.copyWith(
                  color: appTheme.greyCustom,
                ),
              ),
              SizedBox(height: 24.h),
              Text(
                'Coming soon in next step!',
                style: TextStyleHelper.instance.body13Regular.copyWith(
                  color: appTheme.colorFFFC85,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
