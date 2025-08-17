import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:notely/core/errors/failure.dart';
import 'package:notely/core/usecase/usecase.dart';
import 'package:notely/features/auth/data/dto/sign_up_dto.dart';
import 'package:notely/features/auth/domain/entity/user_data.dart';
import 'package:notely/features/auth/domain/repository/auth_repository.dart';

//@lazySingleton
class SignUpUsecase extends UseCase<SignUpRes, String> {
  late AuthRepository repo;

  SignUpUsecase(this.repo, this.email, this.password, this.name, this.country, this.city);
  @override
  Future<Either<Failure, SignUpRes>> invoke() async {
    return await repo.signUp(email, password, name, country, city);
  }

  String email;
  String password;
  String name;
  String country;
  String city;
}
