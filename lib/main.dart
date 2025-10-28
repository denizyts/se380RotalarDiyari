import 'package:deneme/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'core/theme/theme.dart';
import 'routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'rotaci genclik',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      onGenerateRoute: AppRoutes.generateRoute,
      initialRoute: AppRoutes.auth,
    );
  }
}

