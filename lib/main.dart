import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blog/core/theme/theme.dart';
import 'package:flutter_blog/int_dependensies.dart';
import 'package:flutter_blog/presentation/bloc/auth_bloc.dart';
import 'package:flutter_blog/presentation/pages/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependensies();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (_) =>serviceLocator<AuthBloc>()
      ),
    ],
    child: const MyApp(),
  ));
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
