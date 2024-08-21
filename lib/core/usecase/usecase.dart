import 'package:dartz/dartz.dart';
import 'package:notely/core/errors/failure.dart';

abstract class UseCase<Type, Param> {
  final Param? param;
  UseCase({this.param});
  Future<Either<Failure, Type>> invoke();
  
  // Future<Either<Failure, Type>> invoke(Params params);
}
