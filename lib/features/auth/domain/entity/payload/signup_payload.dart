class SignupPayload {
  final String email;
  final String password;
  final String name;
  final String country;
  final String state;

  SignupPayload({
    required this.country,
    required this.email,
    required this.name,
    required this.password,
    required this.state,
  });
}
