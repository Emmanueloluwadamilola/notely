import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

class UserDataDto {
  final String id;
  final String? name;
  final String email;
  final String country;
  final String state;
  final String? photoURL;

  UserDataDto(
      {required this.id,
       this.name,
      required this.email,
      required this.country,
      required this.state,
      this.photoURL});

      factory UserDataDto.fromFirebaseAuthUser(
    firebase_auth.User firebaseUser,
  ) {
    return UserDataDto(
      id: firebaseUser.uid,
      email: firebaseUser.email ?? '',
      name: firebaseUser.displayName,
      photoURL: firebaseUser.photoURL, country: '', state: '',
    );
  }
}
