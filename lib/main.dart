import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'core/app_export.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Lock device orientation to portrait
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((
    _,
  ) {
    runApp(iBorrowApp());
  });
}

class iBorrowApp extends StatelessWidget {
  const iBorrowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          title: 'iBorrow - Library Management',
          theme: theme,
          navigatorKey: NavigatorService.navigatorKey,
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.initialRoute,
          routes: AppRoutes.routes,
          // Ensure consistent text scaling
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(
                context,
              ).copyWith(textScaler: TextScaler.linear(1.0)),
              child: child!,
            );
          },
        );
      },
    );
  }
}
