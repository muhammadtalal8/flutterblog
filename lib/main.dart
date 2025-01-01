// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_blog/core/secret/app_secrets.dart';
import 'package:flutter_blog/core/theme/theme.dart';
import 'package:flutter_blog/presentation/pages/login_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final supabase = await Supabase.initialize(
    url: AppSecrets.supabaseUrl,
    anonKey: AppSecrets.supabaseAnonKey,
  );
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
        home: const LoginPage());
  }
}
