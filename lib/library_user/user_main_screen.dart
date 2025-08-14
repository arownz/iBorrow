import 'package:flutter/material.dart';
import '../core/app_export.dart';
import 'home_screen.dart';
import 'library_screen.dart';
import 'saved_screen.dart';
import 'profile_screen.dart';

/// Main navigation wrapper for user screens with bottom navigation
class UserMainScreen extends StatefulWidget {
  const UserMainScreen({super.key});

  @override
  State<UserMainScreen> createState() => _UserMainScreenState();
}

class _UserMainScreenState extends State<UserMainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    LibraryScreen(),
    SavedScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.colorFFFFF2,
      body: IndexedStack(index: _currentIndex, children: _screens),
      bottomNavigationBar: _buildBottomNavigation(),
    );
  }

  Widget _buildBottomNavigation() {
    return Container(
      height: 76.h,
      decoration: BoxDecoration(
        color: appTheme.colorFFFC85,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -4),
            blurRadius: 4,
            color: Colors.black.withValues(alpha: 0.25),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Selected tab background
          Positioned(
            left: (_currentIndex * (412.h / 4)),
            top: 0,
            child: Container(
              width: 101.h,
              height: 76.h,
              color: appTheme.colorFFBA5A,
            ),
          ),
          // Navigation items
          Row(
            children: [
              _buildNavItem(0, 'Home', Icons.home),
              _buildNavItem(1, 'Library', Icons.library_books),
              _buildNavItem(2, 'Saved', Icons.star),
              _buildNavItem(3, 'Profile', Icons.person),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(int index, String title, IconData icon) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _currentIndex = index;
          });
        },
        child: SizedBox(
          height: 76.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 24.h, color: appTheme.whiteCustom),
              SizedBox(height: 4.h),
              Text(
                title,
                style: TextStyleHelper.instance.label12Regular.copyWith(
                  color: appTheme.whiteCustom,
                  fontSize: 14.fSize,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
