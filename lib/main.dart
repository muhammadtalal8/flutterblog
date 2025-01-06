// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blog/core/secret/app_secrets.dart';
import 'package:flutter_blog/core/theme/theme.dart';
import 'package:flutter_blog/data/datasources/auth_remote_data_source.dart';
import 'package:flutter_blog/data/datasources/repostiory/auth_repository_impl.dart';
import 'package:flutter_blog/presentation/bloc/auth_bloc.dart';
import 'package:flutter_blog/presentation/pages/login_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final supabase = await Supabase.initialize(
    url: AppSecrets.supabaseUrl,
    anonKey: AppSecrets.supabaseAnonKey,
  );
  runApp(MultiBlocProvider(
    providers:  [
BlocProvider(create: (_)=> AuthBloc(userSignUp: UserSignUp(AuthRepositoryImpl(AuthRemoteDataSourceImpl(supabase.client), remoteDataSource: re))))
    ],
    child: const MyApp(),
  ));
}

UserSignUp(AuthRepositoryImpl authRepositoryImpl) {
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
