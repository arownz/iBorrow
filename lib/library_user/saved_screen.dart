import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// Saved books screen for iBorrow application
/// Shows user's saved/bookmarked books organized by shelves
class SavedScreen extends StatefulWidget {
  const SavedScreen({super.key});

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.lightCream,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            _buildTabBar(),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [_buildBooksTab(), _buildShelvesTab()],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.all(16.h),
      child: Row(
        children: [
          Text(
            'Saved',
            style: TextStyleHelper.instance.display36RegularInter.copyWith(
              fontSize: 28.fSize,
              fontWeight: FontWeight.w700,
              color: appTheme.black,
            ),
          ),
          Spacer(),
          IconButton(
            onPressed: () => _showSearchDialog(),
            icon: Icon(Icons.search, size: 24.h, color: appTheme.black),
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.h),
      decoration: BoxDecoration(
        color: appTheme.fieldGray.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(25.h),
      ),
      child: TabBar(
        controller: _tabController,
        labelColor: Colors.white,
        unselectedLabelColor: appTheme.black,
        indicator: BoxDecoration(
          color: appTheme.primaryOrange,
          borderRadius: BorderRadius.circular(25.h),
        ),
        labelStyle: TextStyleHelper.instance.body14.copyWith(
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: TextStyleHelper.instance.body14.copyWith(
          fontWeight: FontWeight.w400,
        ),
        tabs: [
          Tab(text: 'Books'),
          Tab(text: 'Shelves'),
        ],
      ),
    );
  }

  Widget _buildBooksTab() {
    return Padding(
      padding: EdgeInsets.all(16.h),
      child: Column(
        children: [
          SizedBox(height: 16.h),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.bookmark_border,
                    size: 80.h,
                    color: appTheme.gray500,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'No saved books yet',
                    style: TextStyleHelper.instance.title18Bold.copyWith(
                      color: appTheme.black,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Start exploring the library to save your favorite books',
                    style: TextStyleHelper.instance.body14.copyWith(
                      color: appTheme.gray500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 24.h),
                  ElevatedButton(
                    onPressed: () {
                      // This would need to be handled by the parent navigation
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Navigate to Books tab'),
                          backgroundColor: appTheme.primaryOrange,
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: appTheme.primaryOrange,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(
                        horizontal: 32.h,
                        vertical: 12.h,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.h),
                      ),
                    ),
                    child: Text(
                      'Browse Library',
                      style: TextStyleHelper.instance.body14.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShelvesTab() {
    return Padding(
      padding: EdgeInsets.all(16.h),
      child: Column(
        children: [
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'My Shelves',
                style: TextStyleHelper.instance.title18Bold.copyWith(
                  fontSize: 20.fSize,
                ),
              ),
              IconButton(
                onPressed: () => _showCreateShelfDialog(),
                icon: Icon(
                  Icons.add,
                  size: 24.h,
                  color: appTheme.primaryOrange,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.library_books,
                    size: 80.h,
                    color: appTheme.gray500,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'No shelves created yet',
                    style: TextStyleHelper.instance.title18Bold.copyWith(
                      color: appTheme.black,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Create shelves to organize your favorite books',
                    style: TextStyleHelper.instance.body14.copyWith(
                      color: appTheme.gray500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 24.h),
                  ElevatedButton(
                    onPressed: () => _showCreateShelfDialog(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: appTheme.primaryOrange,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(
                        horizontal: 32.h,
                        vertical: 12.h,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.h),
                      ),
                    ),
                    child: Text(
                      'Create Shelf',
                      style: TextStyleHelper.instance.body14.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showSearchDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Search Saved Books'),
        content: Text('Search functionality coming soon!'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  void _showCreateShelfDialog() {
    final TextEditingController shelfNameController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Create New Shelf',
          style: TextStyleHelper.instance.title18Bold,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: shelfNameController,
              decoration: InputDecoration(
                labelText: 'Shelf Name',
                hintText: 'Enter shelf name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.h),
                ),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel', style: TextStyle(color: appTheme.gray500)),
          ),
          ElevatedButton(
            onPressed: () {
              if (shelfNameController.text.isNotEmpty) {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Shelf "${shelfNameController.text}" created!',
                    ),
                    backgroundColor: appTheme.primaryOrange,
                  ),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: appTheme.primaryOrange,
            ),
            child: Text('Create', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
