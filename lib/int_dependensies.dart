import 'package:flutter_blog/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:flutter_blog/core/secret/app_secrets.dart';
import 'package:flutter_blog/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:flutter_blog/features/auth/data/datasources/repostiory/auth_repository_impl.dart';
import 'package:flutter_blog/features/auth/domain/repository/auth_repository.dart';
import 'package:flutter_blog/features/auth/domain/usecases/curent_user.dart';
import 'package:flutter_blog/features/auth/domain/usecases/user_login.dart';
import 'package:flutter_blog/features/auth/domain/usecases/user_sign_up.dart';
import 'package:flutter_blog/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initAuth();
  final supabase = await Supabase.initialize(
    url: AppSecrets.supabaseUrl,
    anonKey: AppSecrets.supabaseAnonKey,
  );
  serviceLocator.registerLazySingleton(() => supabase.client);
  serviceLocator.registerLazySingleton(() => AppUserCubit());
}

void _initAuth() {
  serviceLocator
    ..registerFactory<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(serviceLocator()),
    )
    ..registerFactory<AuthRepository>(
      () => AuthRepositoryImpl(serviceLocator()),
    )
    ..registerFactory(
      () => UserSignup(serviceLocator()),
    )
    ..registerFactory(
      () => UserLogin(serviceLocator()),
    )
    ..registerFactory(
      () => CurrentUser(serviceLocator()),
    )
    ..registerLazySingleton(
      () => AuthBloc(
        userSignUp: serviceLocator(),
        userLogin: serviceLocator(),
        currentUser: serviceLocator(),
        appUserCubit: serviceLocator(),
      ),
    );
}
