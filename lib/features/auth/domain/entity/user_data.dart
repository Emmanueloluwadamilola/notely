class UserData {
  final String id;
  final String name;
  final String email;
  final String country;
  final String state;
  final String? photoURL;

  UserData(
      {required this.id,
      required this.name,
      required this.email,
      required this.country,
      required this.state,
      this.photoURL});
}
