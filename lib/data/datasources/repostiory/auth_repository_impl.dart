import 'package:flutter_blog/core/theme/error/exception.dart';
import 'package:flutter_blog/core/theme/error/failure.dart';
import 'package:flutter_blog/data/datasources/auth_remote_data_source.dart';
import 'package:flutter_blog/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(AuthRemoteDataSourceImpl authRemoteDataSourceImpl, {required this.remoteDataSource});
  @override
  Future<Either<Failure, String>> loginWithEmailPassword({
    required String email,
    required String password,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final userId = await remoteDataSource.signUpWithEmailPassword(
        name: name,
        email: email,
        password: password,
      );
      return right(userId);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
