import 'package:flutter/material.dart';
import '../core/app_export.dart';

class BookDetailScreen extends StatefulWidget {
  final Map<String, dynamic>? book;

  const BookDetailScreen({super.key, this.book});

  @override
  State<BookDetailScreen> createState() => _BookDetailScreenState();
}

class _BookDetailScreenState extends State<BookDetailScreen> {
  bool _isOverviewExpanded = false;

  @override
  Widget build(BuildContext context) {
    final book = widget.book ?? _getDefaultBook();

    return Scaffold(
      backgroundColor: appTheme.lightCream,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(context),
                SizedBox(height: 24.h),
                _buildBookInfo(book),
                SizedBox(height: 24.h),
                _buildStockStatus(),
                SizedBox(height: 24.h),
                _buildOverviewSection(book),
                SizedBox(height: 32.h),
                _buildUserReviewsSection(),
                SizedBox(height: 80.h), // Space for Reserve button
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: _buildReserveButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            width: 25.h,
            height: 25.h,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(4.h),
            ),
            child: Icon(
              Icons.arrow_back_ios,
              size: 18.h,
              color: appTheme.black,
            ),
          ),
        ),
        SizedBox(width: 16.h),
        Text(
          "Back",
          style: TextStyleHelper.instance.body16Regular.copyWith(
            color: appTheme.black,
          ),
        ),
      ],
    );
  }

  Widget _buildBookInfo(Map<String, dynamic> book) {
    return Column(
      children: [
        // Book Cover
        Center(
          child: Container(
            width: 138.h,
            height: 198.h,
            decoration: BoxDecoration(
              color: appTheme.fieldGray,
              borderRadius: BorderRadius.circular(8.h),
            ),
            child: book['cover_url'] != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(8.h),
                    child: Image.network(
                      book['cover_url'],
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Center(
                          child: Icon(
                            Icons.book,
                            size: 48.h,
                            color: appTheme.gray500,
                          ),
                        );
                      },
                    ),
                  )
                : Center(
                    child: Icon(
                      Icons.book,
                      size: 48.h,
                      color: appTheme.gray500,
                    ),
                  ),
          ),
        ),
        SizedBox(height: 16.h),

        // Book Title
        Text(
          book['title'] ?? 'Unknown Title',
          style: TextStyleHelper.instance.display36RegularInter.copyWith(
            fontSize: 32.fSize,
            fontWeight: FontWeight.w700,
            color: appTheme.black,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 8.h),

        // Author
        Text(
          book['author'] ?? 'Unknown Author',
          style: TextStyleHelper.instance.body14.copyWith(
            fontWeight: FontWeight.w100,
            color: appTheme.black,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 8.h),

        // Rating
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Rating: ${book['rating']?.toStringAsFixed(1) ?? '0.0'}",
              style: TextStyleHelper.instance.body14.copyWith(
                fontWeight: FontWeight.w200,
                color: appTheme.black,
              ),
            ),
            SizedBox(width: 8.h),
            _buildStarRating(book['rating']?.toDouble() ?? 0.0),
          ],
        ),
        SizedBox(height: 16.h),

        // Progress Bar for Rating
        _buildRatingProgressBar(book['rating']?.toDouble() ?? 0.0),
      ],
    );
  }

  Widget _buildStarRating(double rating) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Padding(
          padding: EdgeInsets.only(right: 2.h),
          child: Icon(
            index < rating ? Icons.star : Icons.star_border,
            size: 12.h,
            color: appTheme.black,
          ),
        );
      }),
    );
  }

  Widget _buildRatingProgressBar(double rating) {
    return Container(
      width: 87.h,
      height: 3.h,
      decoration: BoxDecoration(
        color: const Color(0xFFE8E8E8),
        borderRadius: BorderRadius.circular(26.h),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          width: (87 * (rating / 5)).h,
          height: 3.h,
          decoration: BoxDecoration(
            color: const Color(0xFF7E7B7B),
            borderRadius: BorderRadius.circular(26.h),
          ),
        ),
      ),
    );
  }

  Widget _buildStockStatus() {
    return Center(
      child: Text(
        "In Stock",
        style: TextStyleHelper.instance.body14.copyWith(
          fontWeight: FontWeight.w500,
          color: appTheme.black,
        ),
      ),
    );
  }

  Widget _buildOverviewSection(Map<String, dynamic> book) {
    final description =
        book['description'] ??
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.";

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Overview",
          style: TextStyleHelper.instance.body14.copyWith(
            fontWeight: FontWeight.w500,
            color: appTheme.black,
          ),
        ),
        SizedBox(height: 16.h),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: appTheme.fieldGray, width: 1.h),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(bottom: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _isOverviewExpanded
                      ? description
                      : description.length > 150
                      ? '${description.substring(0, 150)}...'
                      : description,
                  style: TextStyleHelper.instance.body13Regular.copyWith(
                    color: appTheme.black,
                  ),
                ),
                if (description.length > 150) ...[
                  SizedBox(height: 8.h),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isOverviewExpanded = !_isOverviewExpanded;
                      });
                    },
                    child: Text(
                      _isOverviewExpanded ? "Less....." : "More.....",
                      style: TextStyleHelper.instance.label10Regular.copyWith(
                        fontWeight: FontWeight.w300,
                        color: appTheme.black,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildUserReviewsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "User Review",
              style: TextStyleHelper.instance.body14.copyWith(
                fontWeight: FontWeight.w500,
                color: appTheme.black,
              ),
            ),
            Row(
              children: [
                Text(
                  "See All",
                  style: TextStyleHelper.instance.body14.copyWith(
                    fontWeight: FontWeight.w300,
                    color: appTheme.black,
                  ),
                ),
                SizedBox(width: 8.h),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 12.h,
                  color: appTheme.black,
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 24.h),
        _buildReviewList(),
      ],
    );
  }

  Widget _buildReviewList() {
    final reviews = [
      {
        'name': 'Anonymous',
        'rating': 4.0,
        'review':
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      },
      {
        'name': 'Anonymous',
        'rating': 5.0,
        'review':
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      },
    ];

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: _buildReviewCard(reviews[0])),
        SizedBox(width: 8.h),
        Expanded(child: _buildReviewCard(reviews[1])),
      ],
    );
  }

  Widget _buildReviewCard(Map<String, dynamic> review) {
    return Container(
      padding: EdgeInsets.all(12.h),
      decoration: BoxDecoration(
        color: appTheme.fieldGray,
        borderRadius: BorderRadius.circular(8.h),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 9.h,
                backgroundColor: const Color(0xFF968D8D),
                child: Icon(Icons.person, size: 12.h, color: Colors.white),
              ),
              SizedBox(width: 8.h),
              Text(
                review['name'],
                style: TextStyleHelper.instance.label12Regular.copyWith(
                  fontWeight: FontWeight.w600,
                  color: appTheme.black,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            review['review'],
            style: TextStyleHelper.instance.body13Regular.copyWith(
              color: appTheme.black,
            ),
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 8.h),
          _buildStarRating(review['rating']?.toDouble() ?? 0.0),
        ],
      ),
    );
  }

  Widget _buildReserveButton() {
    return Container(
      width: 191.h,
      height: 33.h,
      margin: EdgeInsets.only(bottom: 16.h),
      child: ElevatedButton(
        onPressed: () {
          // Handle reserve book action
          _showReserveDialog();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: appTheme.primaryOrange,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.h),
          ),
        ),
        child: Text(
          "Reserve",
          style: TextStyleHelper.instance.body13Regular.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }

  void _showReserveDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Reserve Book",
            style: TextStyleHelper.instance.title18Bold,
          ),
          content: Text(
            "Would you like to reserve '${widget.book?['title'] ?? 'this book'}'?",
            style: TextStyleHelper.instance.body16Regular,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Cancel", style: TextStyle(color: appTheme.gray500)),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Book reserved successfully!"),
                    backgroundColor: appTheme.primaryOrange,
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: appTheme.primaryOrange,
              ),
              child: Text("Reserve", style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }

  Map<String, dynamic> _getDefaultBook() {
    return {
      'title': 'The Great Gatsby',
      'author': 'F. Scott Fitzgerald',
      'rating': 4.2,
      'cover_url': null,
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
    };
  }
}
