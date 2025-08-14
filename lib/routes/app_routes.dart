import 'package:flutter/material.dart';
import '../auth/login_screen.dart';
import '../auth/signup_screen.dart';
import '../library_user/user_dashboard.dart';
import '../library_admin/admin_dashboard.dart';

/// App routes for iBorrow application
class AppRoutes {
  // Auth routes
  static const String loginScreen = '/login';
  static const String signupScreen = '/signup';

  // User routes
  static const String userDashboard = '/user_dashboard';

  // Admin routes
  static const String adminDashboard = '/admin_dashboard';

  // Initial route
  static const String initialRoute = '/';

  static Map<String, WidgetBuilder> get routes => {
    loginScreen: (context) => LoginScreen(),
    signupScreen: (context) => SignupScreen(),
    userDashboard: (context) => UserDashboard(),
    adminDashboard: (context) => AdminDashboard(),
    initialRoute: (context) => LoginScreen(),
  };
}
