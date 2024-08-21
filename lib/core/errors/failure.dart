abstract class Failure {}

class ServerFailure extends Failure {}

class AuthFailure extends Failure {
  final String message;
  AuthFailure(this.message);
}