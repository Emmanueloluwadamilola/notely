import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:notely/confiq/di/injector_container.dart';
import 'package:notely/features/auth/data/dto/sign_up_dto.dart';

abstract class FirebaseAuthDataSource {
  Future<SignUpResponse> signIn(String email, String password);
  Future<SignUpResponse> signUp(
      String email, String password, String name, String country, String city);
}

@LazySingleton(as: FirebaseAuthDataSource)
class FirebaseAuthDataSourceImpl implements FirebaseAuthDataSource {
  final _firebaseAuth = sl.get<FirebaseAuth>();
  final _firestore = sl.get<FirebaseFirestore>();

  FirebaseAuthDataSourceImpl();

  @override
  Future<SignUpResponse> signIn(String email, String password) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return SignUpResponse.success(
          credential.user!.uid, credential.user!.email!);
    } on FirebaseAuthException catch (e) {
      return SignUpResponse.failure(e.message ?? 'An unknown error occurred');
    } catch (e) {
      return SignUpResponse.failure('Error ');
    }
  }

  @override
  Future<SignUpResponse> signUp(String email, String password, String name,
      String country, String city) async {
    try {
      UserCredential credential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await _firestore.collection('users').doc(credential.user!.uid).set({
        'name': name,
        'country': country,
        'city': city,
      });
      print('>>>>>> okkkkkkkkkkkkkkkkkkkkkkkkk');
      return SignUpResponse.success(
          credential.user!.uid, credential.user!.email!);
    } on FirebaseAuthException catch (e) {
      return SignUpResponse.failure(e.message ?? 'An unknown error occurred');
    } catch (e) {
      return SignUpResponse.failure('Error ');
    }
  }
}
