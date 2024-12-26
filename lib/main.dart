import 'package:flutter/material.dart';
import 'package:flutter_blog/core/theme/theme.dart';
import 'package:flutter_blog/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Talal Blog App Demo',
      theme: AppTheme.darkThemeMode,
      home:  const LoginPage());
  }
}

