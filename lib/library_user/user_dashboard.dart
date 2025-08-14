import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// User dashboard for iBorrow application
/// Main screen for library users to browse and borrow books
class UserDashboard extends StatefulWidget {
  const UserDashboard({Key? key}) : super(key: key);

  @override
  State<UserDashboard> createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.colorFFFFF2,
      appBar: AppBar(
        backgroundColor: appTheme.colorFFFC85,
        title: Text(
          'iBorrow - Library',
          style: TextStyleHelper.instance.title18Bold.copyWith(
            color: appTheme.whiteCustom,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.logout, color: appTheme.whiteCustom),
            onPressed: _onLogout,
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildWelcomeSection(),
            SizedBox(height: 24.h),
            _buildQuickActions(),
            SizedBox(height: 24.h),
            _buildRecentBooks(),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigation(),
    );
  }

  Widget _buildWelcomeSection() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.h),
      decoration: BoxDecoration(
        color: appTheme.whiteCustom,
        borderRadius: BorderRadius.circular(12.h),
        boxShadow: [
          BoxShadow(
            color: appTheme.greyCustom.withOpacity(0.1),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome to iBorrow!',
            style: TextStyleHelper.instance.title18Bold,
          ),
          SizedBox(height: 8.h),
          Text(
            'Discover, borrow, and enjoy books from our digital library.',
            style: TextStyleHelper.instance.body13Regular,
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Quick Actions', style: TextStyleHelper.instance.title18Bold),
        SizedBox(height: 16.h),
        Row(
          children: [
            Expanded(
              child: _buildActionCard(
                'Browse Books',
                Icons.book,
                () => _showComingSoon('Browse Books'),
              ),
            ),
            SizedBox(width: 12.h),
            Expanded(
              child: _buildActionCard(
                'My Borrowed',
                Icons.bookmark,
                () => _showComingSoon('My Borrowed Books'),
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        Row(
          children: [
            Expanded(
              child: _buildActionCard(
                'Search',
                Icons.search,
                () => _showComingSoon('Search Books'),
              ),
            ),
            SizedBox(width: 12.h),
            Expanded(
              child: _buildActionCard(
                'Favorites',
                Icons.favorite,
                () => _showComingSoon('Favorite Books'),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildActionCard(String title, IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 80.h,
        decoration: BoxDecoration(
          color: appTheme.whiteCustom,
          borderRadius: BorderRadius.circular(12.h),
          border: Border.all(color: appTheme.colorFFFC85.withOpacity(0.3)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 24.h, color: appTheme.colorFFFC85),
            SizedBox(height: 8.h),
            Text(
              title,
              style: TextStyleHelper.instance.label12Regular,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentBooks() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Recently Added', style: TextStyleHelper.instance.title18Bold),
        SizedBox(height: 16.h),
        Container(
          height: 200.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3, // Mock data
            itemBuilder: (context, index) {
              return _buildBookCard('Book ${index + 1}', 'Author ${index + 1}');
            },
          ),
        ),
      ],
    );
  }

  Widget _buildBookCard(String title, String author) {
    return Container(
      width: 120.h,
      margin: EdgeInsets.only(right: 12.h),
      decoration: BoxDecoration(
        color: appTheme.whiteCustom,
        borderRadius: BorderRadius.circular(8.h),
        boxShadow: [
          BoxShadow(
            color: appTheme.greyCustom.withOpacity(0.1),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 140.h,
            decoration: BoxDecoration(
              color: appTheme.colorFFFC85.withOpacity(0.2),
              borderRadius: BorderRadius.vertical(top: Radius.circular(8.h)),
            ),
            child: Center(
              child: Icon(Icons.book, size: 48.h, color: appTheme.colorFFFC85),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyleHelper.instance.body13Regular.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4.h),
                Text(
                  author,
                  style: TextStyleHelper.instance.label10Regular,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigation() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: appTheme.whiteCustom,
      selectedItemColor: appTheme.colorFFFC85,
      unselectedItemColor: appTheme.greyCustom,
      currentIndex: 0,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: 'Borrowed'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
      onTap: (index) {
        if (index != 0) {
          _showComingSoon('Navigation');
        }
      },
    );
  }

  void _showComingSoon(String feature) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$feature feature coming soon!'),
        backgroundColor: appTheme.colorFFFC85,
      ),
    );
  }

  void _onLogout() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Logout'),
          content: Text('Are you sure you want to logout?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                NavigatorService.pushReplacementNamed(AppRoutes.loginScreen);
              },
              child: Text('Logout'),
            ),
          ],
        );
      },
    );
  }
}
