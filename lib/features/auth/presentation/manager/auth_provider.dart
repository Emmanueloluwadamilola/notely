import 'package:flutter/material.dart';
import 'package:notely/features/auth/presentation/manager/auth_state.dart';

class AuthProvider extends ChangeNotifier {
  final state = AuthState();
}
