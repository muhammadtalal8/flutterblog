import 'package:flutter/material.dart';
import 'package:flutter_blog/core/theme/theme.dart';
import 'package:flutter_blog/pages/Signup_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Talal Blog App Demo',
      theme: AppTheme.darkThemeMode,
      home: const SignUpPage());
  }
}

