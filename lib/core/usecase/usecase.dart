import 'package:flutter_blog/core/theme/error/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class UserCase<SuccessType, Params >{
Future<Either<Failure, SuccessType >>call(Params params);
}