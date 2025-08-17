class LoginPayloadDto {
  final String email;
  final String password;

  LoginPayloadDto({
    required this.email,
    required this.password,
  });

  factory LoginPayloadDto.fromJson(Map<String, dynamic> json) =>
      LoginPayloadDto(
        email: json["email"],
        password: json['password'],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}
