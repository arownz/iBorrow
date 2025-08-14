import 'package:flutter/material.dart';
import '../core/app_export.dart';
import '../widgets/custom_image_view.dart';

/// Home screen showing user's dashboard with currently borrowing books and recommendations
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Mock user data - replace with actual user data from Supabase
  final String userName = "BookLover123";

  // Mock book data - replace with actual data from Supabase
  final List<BookModel> currentlyBorrowing = [
    BookModel(
      title: "The Quantum Universe",
      author: "Brian Cox",
      coverUrl:
          "https://images.unsplash.com/photo-1544716278-ca5e3f4abd8c?w=300",
      dueDate: "2025-08-21",
    ),
  ];

  final List<BookModel> scienceFictionBooks = [
    BookModel(
      title: "Dune",
      author: "Frank Herbert",
      coverUrl:
          "https://images.unsplash.com/photo-1589829085413-56de8ae18c73?w=300",
    ),
    BookModel(
      title: "Foundation",
      author: "Isaac Asimov",
      coverUrl:
          "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=300",
    ),
    BookModel(
      title: "Neuromancer",
      author: "William Gibson",
      coverUrl:
          "https://images.unsplash.com/photo-1481627834876-b7833e8f5570?w=300",
    ),
  ];

  final List<BookModel> recommendedBooks = [
    BookModel(
      title: "Sapiens",
      author: "Yuval Noah Harari",
      coverUrl:
          "https://images.unsplash.com/photo-1512820790803-83ca734da794?w=300",
    ),
    BookModel(
      title: "The Midnight Library",
      author: "Matt Haig",
      coverUrl:
          "https://images.unsplash.com/photo-1535905557558-afc4877cca3d?w=300",
    ),
    BookModel(
      title: "Atomic Habits",
      author: "James Clear",
      coverUrl:
          "https://images.unsplash.com/photo-1544947950-fa07a98d237f?w=300",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.colorFFFFF2,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 100.h), // Account for bottom nav
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              SizedBox(height: 32.h),
              _buildCurrentlyBorrowingSection(),
              SizedBox(height: 40.h),
              _buildScienceFictionSection(),
              SizedBox(height: 40.h),
              _buildRecommendedSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.h, vertical: 24.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hi, $userName!',
                style: TextStyleHelper.instance.body13RegularInter.copyWith(
                  fontSize: 13.fSize,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                'What would you like\nto read today?',
                style: TextStyleHelper.instance.display36Regular.copyWith(
                  fontSize: 24.fSize,
                  height: 1.2,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 24.h,
            height: 24.h,
            child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                _showNotifications();
              },
              icon: Icon(
                Icons.notifications_outlined,
                size: 24.h,
                color: appTheme.blackCustom,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCurrentlyBorrowingSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.h),
          child: Text(
            'Currently Borrowing',
            style: TextStyleHelper.instance.title18Bold.copyWith(
              fontSize: 20.fSize,
            ),
          ),
        ),
        SizedBox(height: 16.h),
        if (currentlyBorrowing.isNotEmpty)
          _buildLargeBorrowingCard(currentlyBorrowing.first)
        else
          _buildEmptyBorrowingCard(),
      ],
    );
  }

  Widget _buildLargeBorrowingCard(BookModel book) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30.h),
      height: 156.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.h),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.h),
        child: Row(
          children: [
            // Book cover
            SizedBox(
              width: 120.h,
              height: 156.h,
              child: CustomImageView(
                imagePath: book.coverUrl,
                fit: BoxFit.cover,
              ),
            ),
            // Book details
            Expanded(
              child: Container(
                padding: EdgeInsets.all(16.h),
                color: appTheme.whiteCustom,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      book.title,
                      style: TextStyleHelper.instance.body16Regular.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'by ${book.author}',
                      style: TextStyleHelper.instance.body13Regular.copyWith(
                        color: appTheme.greyCustom,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.h,
                        vertical: 4.h,
                      ),
                      decoration: BoxDecoration(
                        color: appTheme.colorFFFC85.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(4.h),
                      ),
                      child: Text(
                        'Due: ${book.dueDate}',
                        style: TextStyleHelper.instance.label10Regular.copyWith(
                          color: appTheme.colorFFBA5A,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyBorrowingCard() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30.h),
      height: 156.h,
      decoration: BoxDecoration(
        color: appTheme.whiteCustom,
        borderRadius: BorderRadius.circular(12.h),
        border: Border.all(color: appTheme.grey200),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.book_outlined, size: 48.h, color: appTheme.greyCustom),
            SizedBox(height: 8.h),
            Text(
              'No books currently borrowed',
              style: TextStyleHelper.instance.body13Regular.copyWith(
                color: appTheme.greyCustom,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildScienceFictionSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.h),
          child: Text(
            'Science Fiction',
            style: TextStyleHelper.instance.title18Bold.copyWith(
              fontSize: 20.fSize,
            ),
          ),
        ),
        SizedBox(height: 16.h),
        _buildBookGrid(scienceFictionBooks),
      ],
    );
  }

  Widget _buildRecommendedSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.h),
          child: Text(
            'Recommended for You',
            style: TextStyleHelper.instance.title18Bold.copyWith(
              fontSize: 20.fSize,
            ),
          ),
        ),
        SizedBox(height: 16.h),
        _buildBookGrid(recommendedBooks),
      ],
    );
  }

  Widget _buildBookGrid(List<BookModel> books) {
    return SizedBox(
      height: 156.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 30.h),
        itemCount: books.length,
        itemBuilder: (context, index) {
          return _buildBookCard(books[index]);
        },
      ),
    );
  }

  Widget _buildBookCard(BookModel book) {
    return Container(
      width: 131.h,
      margin: EdgeInsets.only(right: 16.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.h),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.h),
        child: Stack(
          children: [
            CustomImageView(
              imagePath: book.coverUrl,
              width: 131.h,
              height: 156.h,
              fit: BoxFit.cover,
            ),
            Container(
              width: 131.h,
              height: 156.h,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black.withValues(alpha: 0.7)],
                ),
              ),
            ),
            Positioned(
              bottom: 8.h,
              left: 8.h,
              right: 8.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    book.title,
                    style: TextStyleHelper.instance.label12Regular.copyWith(
                      color: appTheme.whiteCustom,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    book.author,
                    style: TextStyleHelper.instance.label10Regular.copyWith(
                      color: appTheme.whiteCustom.withValues(alpha: 0.8),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showNotifications() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Notifications feature coming soon!'),
        backgroundColor: appTheme.colorFFFC85,
      ),
    );
  }
}

/// Book model class for representing book data
class BookModel {
  final String title;
  final String author;
  final String coverUrl;
  final String? dueDate;

  BookModel({
    required this.title,
    required this.author,
    required this.coverUrl,
    this.dueDate,
  });
}
