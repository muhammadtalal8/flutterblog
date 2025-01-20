import 'package:flutter_blog/data/datasources/auth_remote_data_source.dart';
import 'package:flutter_blog/data/datasources/repostiory/auth_repository_impl.dart';
import 'package:flutter_blog/domain/repository/auth_repository.dart';
import 'package:flutter_blog/domain/usecases/curent_user.dart';
import 'package:flutter_blog/domain/usecases/user_login.dart';
import 'package:flutter_blog/domain/usecases/user_sign_up.dart';
import 'package:flutter_blog/presentation/bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initAuth() {
    serviceLocator.registerFactory<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(serviceLocator()),
    );
    serviceLocator.registerFactory<AuthRepository>(
      () => AuthRepositoryImpl(serviceLocator()),
    );
    serviceLocator.registerFactory(
      () => UserSignup(serviceLocator()),
    );
    serviceLocator.registerFactory(
      () => UserLogin(serviceLocator()),
    );

    serviceLocator.registerFactory(
      () => CurrentUser(serviceLocator()),
    );

    serviceLocator.registerLazySingleton(
      () => AuthBloc(
        userSignUp: serviceLocator(),
        userLogin: serviceLocator(),
        currentUser: serviceLocator(),
      ),
    );
  }
}
