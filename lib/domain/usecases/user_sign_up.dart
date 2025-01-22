import 'package:flutter_blog/core/theme/error/failure.dart';
import 'package:flutter_blog/core/usecase/usecase.dart';
import 'package:flutter_blog/core/common/entities/user.dart';
import 'package:flutter_blog/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class UserSignup implements UseCase<User, UserSignupParams> {
  final AuthRepository authRepository;

  UserSignup(this.authRepository);
  @override
  Future<Either<Failure, User>> call(UserSignupParams params) async {
    return authRepository.signUpWithEmailPassword(
      name: params.name,
      email: params.email,
      password: params.password,
    );
  }
}

class UserSignupParams {
  final String email;
  final String password;
  final String name;

  UserSignupParams({
    required this.email,
    required this.password,
    required this.name,
  });
}
