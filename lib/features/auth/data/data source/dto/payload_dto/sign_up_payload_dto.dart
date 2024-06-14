class SignUpPayloadDto {
  final String email;
  final String password;
  final String name;
  final String country;
  final String state;

  SignUpPayloadDto({
    required this.country,
    required this.email,
    required this.name,
    required this.password,
    required this.state,
  });

  factory SignUpPayloadDto.fromJson(Map<String, dynamic> json) =>
      SignUpPayloadDto(
        email: json["email"],
        name: json["name"],
        country: json["country"],
        state: json["state"],
        password: json['password'],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "name": name,
        "country": country,
        "password": password,
        "state": state
      };
}
