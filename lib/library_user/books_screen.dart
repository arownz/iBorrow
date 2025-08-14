import 'package:flutter/material.dart';
import '../core/app_export.dart';
import 'book_detail_screen.dart';

/// Books/Library screen for iBorrow application
/// Shows library catalog with search, categories, and book recommendations
class BooksScreen extends StatefulWidget {
  const BooksScreen({super.key});

  @override
  State<BooksScreen> createState() => _BooksScreenState();
}

class _BooksScreenState extends State<BooksScreen> {
  final TextEditingController _searchController = TextEditingController();

  // Sample book data - replace with real data from Supabase
  final List<Map<String, dynamic>> topReadBooks = [
    {
      'title': 'The Great Gatsby',
      'author': 'F. Scott Fitzgerald',
      'image': 'https://covers.openlibrary.org/b/id/8225261-M.jpg',
      'rating': 4.5,
      'category': 'Classic Literature',
    },
    {
      'title': 'To Kill a Mockingbird',
      'author': 'Harper Lee',
      'image': 'https://covers.openlibrary.org/b/id/8434586-M.jpg',
      'rating': 4.8,
      'category': 'Classic Literature',
    },
    {
      'title': '1984',
      'author': 'George Orwell',
      'image': 'https://covers.openlibrary.org/b/id/7222246-M.jpg',
      'rating': 4.7,
      'category': 'Dystopian Fiction',
    },
    {
      'title': 'Pride and Prejudice',
      'author': 'Jane Austen',
      'image': 'https://covers.openlibrary.org/b/id/7883916-M.jpg',
      'rating': 4.6,
      'category': 'Romance',
    },
    {
      'title': 'The Catcher in the Rye',
      'author': 'J.D. Salinger',
      'image': 'https://covers.openlibrary.org/b/id/8133317-M.jpg',
      'rating': 4.2,
      'category': 'Coming of Age',
    },
    {
      'title': 'Lord of the Flies',
      'author': 'William Golding',
      'image': 'https://covers.openlibrary.org/b/id/8134974-M.jpg',
      'rating': 4.3,
      'category': 'Adventure',
    },
  ];

  final List<Map<String, dynamic>> recommendedBooks = [
    {
      'title': 'Dune',
      'author': 'Frank Herbert',
      'image': 'https://covers.openlibrary.org/b/id/8234166-M.jpg',
      'rating': 4.6,
      'category': 'Science Fiction',
    },
    {
      'title': 'The Hobbit',
      'author': 'J.R.R. Tolkien',
      'image': 'https://covers.openlibrary.org/b/id/6979861-M.jpg',
      'rating': 4.7,
      'category': 'Fantasy',
    },
    {
      'title': 'Fahrenheit 451',
      'author': 'Ray Bradbury',
      'image': 'https://covers.openlibrary.org/b/id/8194018-M.jpg',
      'rating': 4.4,
      'category': 'Dystopian Fiction',
    },
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.colorFFFFF2,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(),
                SizedBox(height: 20.h),
                _buildBrowseLibraryButton(),
                SizedBox(height: 20.h),
                _buildSearchBar(),
                SizedBox(height: 24.h),
                _buildTopReadSection(),
                SizedBox(height: 32.h),
                _buildRecommendedSection(),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Text(
      'Library',
      style: TextStyleHelper.instance.display36Regular.copyWith(
        fontSize: 32.fSize,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  Widget _buildBrowseLibraryButton() {
    return Container(
      width: double.infinity,
      height: 45.h,
      decoration: BoxDecoration(
        color: appTheme.whiteCustom,
        borderRadius: BorderRadius.circular(8.h),
        border: Border.all(color: appTheme.blackCustom, width: 1),
      ),
      child: InkWell(
        onTap: () => _onBrowseLibrary(),
        borderRadius: BorderRadius.circular(8.h),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.h),
          child: Row(
            children: [
              Icon(Icons.list, size: 25.h, color: appTheme.blackCustom),
              SizedBox(width: 12.h),
              Expanded(
                child: Text(
                  'Browse Library',
                  style: TextStyleHelper.instance.body16Regular,
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 16.h,
                color: appTheme.blackCustom,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      height: 49.h,
      decoration: BoxDecoration(
        color: Color(0xFFE8E8E8),
        borderRadius: BorderRadius.circular(26.h),
      ),
      child: Row(
        children: [
          SizedBox(width: 16.h),
          Icon(Icons.search, size: 26.h, color: appTheme.blackCustom),
          SizedBox(width: 12.h),
          Expanded(
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Explore our Library',
                border: InputBorder.none,
                hintStyle: TextStyleHelper.instance.body16Regular.copyWith(
                  color: appTheme.greyCustom,
                ),
              ),
              style: TextStyleHelper.instance.body16Regular,
              onChanged: (value) => _onSearchChanged(value),
            ),
          ),
          SizedBox(width: 16.h),
        ],
      ),
    );
  }

  Widget _buildTopReadSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Top Read',
          style: TextStyleHelper.instance.title18Bold.copyWith(
            fontSize: 20.fSize,
          ),
        ),
        SizedBox(height: 16.h),
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.7,
            crossAxisSpacing: 16.h,
            mainAxisSpacing: 16.h,
          ),
          itemCount: topReadBooks.length,
          itemBuilder: (context, index) {
            return _buildBookCard(topReadBooks[index], isLarge: true);
          },
        ),
      ],
    );
  }

  Widget _buildRecommendedSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Recommended For You',
              style: TextStyleHelper.instance.title18Bold.copyWith(
                fontSize: 20.fSize,
              ),
            ),
            GestureDetector(
              onTap: () => _onViewAllRecommended(),
              child: Row(
                children: [
                  Text(
                    'View all',
                    style: TextStyleHelper.instance.body16Regular,
                  ),
                  SizedBox(width: 4.h),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 14.h,
                    color: appTheme.blackCustom,
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        SizedBox(
          height: 280.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: recommendedBooks.length,
            itemBuilder: (context, index) {
              return Container(
                width: 140.h,
                margin: EdgeInsets.only(right: 16.h),
                child: _buildBookCard(recommendedBooks[index], isLarge: false),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildBookCard(Map<String, dynamic> book, {required bool isLarge}) {
    return GestureDetector(
      onTap: () => _onBookTapped(book),
      child: Container(
        decoration: BoxDecoration(
          color: appTheme.whiteCustom,
          borderRadius: BorderRadius.circular(12.h),
          boxShadow: [
            BoxShadow(
              color: appTheme.greyCustom.withValues(alpha: 0.1),
              blurRadius: 8,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Book cover
            Expanded(
              flex: isLarge ? 3 : 4,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(12.h),
                  ),
                  color: appTheme.colorFFD9D9,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(12.h),
                  ),
                  child: Image.network(
                    book['image'],
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        decoration: BoxDecoration(
                          color: appTheme.colorFFFC85.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(12.h),
                          ),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.book,
                            size: isLarge ? 48.h : 32.h,
                            color: appTheme.colorFFFC85,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            // Book info
            Expanded(
              flex: isLarge ? 2 : 2,
              child: Padding(
                padding: EdgeInsets.all(12.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      book['title'],
                      style: TextStyleHelper.instance.body13Regular.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: isLarge ? 14.fSize : 12.fSize,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      book['author'],
                      style: TextStyleHelper.instance.label10Regular.copyWith(
                        fontSize: isLarge ? 12.fSize : 10.fSize,
                        color: appTheme.greyCustom,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (isLarge) ...[
                      SizedBox(height: 8.h),
                      Row(
                        children: [
                          Icon(Icons.star, size: 14.h, color: Colors.amber),
                          SizedBox(width: 4.h),
                          Text(
                            book['rating'].toString(),
                            style: TextStyleHelper.instance.label10Regular
                                .copyWith(
                                  fontSize: 11.fSize,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onBrowseLibrary() {
    // TODO: Implement browse library functionality
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Browse Library functionality coming soon!'),
        backgroundColor: appTheme.colorFFFC85,
      ),
    );
  }

  void _onSearchChanged(String query) {
    // TODO: Implement search functionality
    print('Search query: $query');
  }

  void _onViewAllRecommended() {
    // TODO: Navigate to all recommended books
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('View all recommended books coming soon!'),
        backgroundColor: appTheme.colorFFFC85,
      ),
    );
  }

  void _onBookTapped(Map<String, dynamic> book) {
    // Navigate to book details screen
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => BookDetailScreen(book: book)),
    );
  }
}
