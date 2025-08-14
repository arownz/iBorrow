# iBorrow - Library Management App

## Overview
iBorrow is a mobile library management application built with Flutter and designed to work with Supabase. It provides an intuitive interface for both library users and administrators to manage book borrowing efficiently.

## Features

### For Users:
- 📚 Browse available books
- 🔍 Search books by title, author, or genre
- 📖 Borrow and return books
- ⭐ Mark favorite books
- 📊 Track borrowing history
- ⚡ Smart filters and recommendations

### For Administrators:
- 👥 Manage library users
- 📊 View comprehensive statistics
- 📚 Add and manage book inventory
- 🔍 Track borrowing activity
- ⚠️ Monitor overdue books
- 📈 Generate reports

## Project Structure

```
lib/
├── auth/                   # Authentication screens
│   ├── login_screen.dart   # Unified login for users and admins
│   └── signup_screen.dart  # User registration
├── core/                   # Core utilities and configurations
│   ├── app_export.dart     # Central exports
│   └── utils/              # Utility classes
├── library_admin/          # Admin-specific screens
│   └── admin_dashboard.dart
├── library_user/           # User-specific screens
│   └── user_dashboard.dart
├── routes/                 # Navigation management
│   └── app_routes.dart
├── theme/                  # UI themes and styling
│   ├── theme_helper.dart
│   └── text_style_helper.dart
├── widgets/                # Reusable UI components
│   ├── custom_image_view.dart
│   ├── custom_submit_button.dart
│   └── custom_text_field.dart
└── main.dart              # App entry point
```

## Design Integration

This project has been integrated with UI components from a Figma-generated Flutter design featuring:

### Visual Elements:
- **Color Scheme**: Orange-themed palette (#FC8520, #BA5A13, #FFF2DF)
- **Typography**: Inter font family with responsive sizing
- **Assets**: Background images and icons properly integrated
- **Responsive Design**: Figma-based responsive scaling system

### UI Components:
- Custom text fields with validation
- Branded submit buttons with loading states
- Flexible image view component
- Consistent spacing and styling

## Technology Stack

- **Frontend**: Flutter 3.8.1+
- **Backend**: Supabase (ready for integration)
- **State Management**: Provider
- **UI Components**: Custom widgets with Material Design
- **Authentication**: Supabase Auth (planned)
- **Database**: PostgreSQL via Supabase (planned)

## Authentication Flow

### Dual Login System:
- **Users**: Create accounts via signup screen
- **Admins**: Use predefined admin credentials
- **Route Logic**: Email-based detection for admin vs user dashboard routing

### Security Features:
- Input validation for all forms
- Password strength requirements
- Remember me functionality
- Secure logout with confirmation

## Getting Started

### Prerequisites:
- Flutter SDK 3.8.1 or higher
- Dart 3.0.0 or higher

### Installation:
1. Clone the repository
2. Run `flutter pub get` to install dependencies
3. Configure Supabase connection (when ready)
4. Run `flutter run` to start the app

### Dependencies:
- `provider`: State management
- `supabase_flutter`: Backend integration
- `flutter_svg`: SVG image support
- `shared_preferences`: Local storage
- `connectivity_plus`: Network status

## Assets Integrated

From the original Figma design:
- ✅ Login/Signup background images
- ✅ Icon assets and illustrations
- ✅ Inter font family (Regular & Bold)
- ✅ Color palette and theme
- ✅ Responsive scaling system

## Next Steps

1. **Supabase Integration**: Configure authentication and database
2. **Book Management**: Implement CRUD operations for books
3. **Search & Filters**: Advanced search functionality
4. **Notifications**: Push notifications for due dates
5. **Analytics**: Usage statistics and reporting
6. **Offline Support**: Local caching for better performance

## Development Notes

- The app uses a responsive design system based on Figma specifications
- All UI components are built with accessibility in mind
- The architecture supports easy integration with Supabase
- State management is set up for scalable development
- Code is organized following Flutter best practices

## Contributing

This app is structured to support team development with:
- Clear separation of user and admin functionality
- Modular widget architecture
- Consistent coding patterns
- Proper error handling and validation

---

**iBorrow** - Making library management simple and efficient! 📚✨
