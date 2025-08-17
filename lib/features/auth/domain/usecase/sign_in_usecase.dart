import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:notely/core/errors/failure.dart';
import 'package:notely/core/usecase/usecase.dart';
import 'package:notely/features/auth/data/dto/sign_up_dto.dart';
import 'package:notely/features/auth/domain/entity/user_data.dart';
import 'package:notely/features/auth/domain/repository/auth_repository.dart';


//@lazySingleton
class SignInUsecase extends UseCase<SignUpRes, String> {
  late AuthRepository repo;

  SignInUsecase(this.repo, this.email, this.password);
  @override
  Future<Either<Failure, SignUpRes>> invoke() async {
    return await repo.signIn(email, password);
  }

  String email;
  String password;
  
}
