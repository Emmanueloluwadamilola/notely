// // lib/domain/entities/sign_up_response.dart

// import 'dart:convert';

// import 'package:notely/features/auth/domain/entity/user_data.dart';

// class SignUpResponseDto {
//   final bool success;
//   final String? userId;
//   final String? email;
//   final String? error;

//   SignUpResponseDto({
//     required this.success,
//     this.userId,
//     this.email,
//     this.error,
//   });

//   SignUpResponse toAuthResponse() {
//     return SignUpResponse(success: success, userId: userId, email: email, error: email);
//   }

//   Map<String, dynamic> toJson() => {
//         'success': success,
//         'userId': userId,
//         'email': email,
//         'error': error,
//       };

//   String toJsonString() => json.encode(toJson());

//   factory SignUpResponseDto.fromJson(Map<String, dynamic> json) =>
//       SignUpResponseDto(
//         success: json['success'],
//         userId: json['userId'],
//         email: json['email'],
//         error: json['error'],
//       );

//   factory SignUpResponseDto.success(String userId, String email) =>
//       SignUpResponseDto(
//         success: true,
//         userId: userId,
//         email: email,
//       );

//   factory SignUpResponseDto.failure(String error) => SignUpResponseDto(
//         success: false,
//         error: error,
//       );
// }

// To parse this JSON data, do
//
//     final signUpResponseDto = signUpResponseDtoFromJson(jsonString);

// import 'package:meta/meta.dart';
// import 'dart:convert';

// import 'package:notely/features/auth/domain/entity/user_data.dart';

// SignUpResponseDto signUpResponseDtoFromJson(String str) =>
//     SignUpResponseDto.fromJson(json.decode(str));

// String signUpResponseDtoToJson(SignUpResponseDto data) =>
//     json.encode(data.toJson());

// class SignUpResponseDto {
//   final bool success;
//    String? userId;
//    String? email;
//    String? error;

//   SignUpResponseDto({
//     required this.success,
//      this.userId,
//      this.email,
//      this.error,
//   });

//   SignUpResponse toResponse() {
//     return SignUpResponse(
//         success: success, userId: userId, email: email, error: error);
//   }

//   factory SignUpResponseDto.fromJson(Map<String, dynamic> json) =>
//       SignUpResponseDto(
//         success: json["success"],
//         userId: json["userId"],
//         email: json["email"],
//         error: json["error"],
//       );

//   Map<String, dynamic> toJson() => {
//         "success": success,
//         "userId": userId,
//         "email": email,
//         "error": error,
//       };

//       factory SignUpResponseDto.success(String userId, String email) =>
//       SignUpResponseDto(
//         success: true,
//         userId: userId,
//         email: email,
//       );

//   factory SignUpResponseDto.failure(String error) => SignUpResponseDto(
//         success: false,
//         error: error,
//       );
// }

// lib/domain/entities/sign_up_response.dart

// import 'dart:convert';

// class SignUpResponse {
//   final bool success;
//   final String? userId;
//   final String? email;
//   final String? error;

//   SignUpResponse({
//     required this.success,
//     this.userId,
//     this.email,
//     this.error,
//   });

//   Map<String, dynamic> toJson() => {
//     'success': success,
//     'userId': userId,
//     'email': email,
//     'error': error,
//   };

//   String toJsonString() => json.encode(toJson());

//   factory SignUpResponse.fromJson(Map<String, dynamic> json) => SignUpResponse(
//     success: json['success'],
//     userId: json['userId'],
//     email: json['email'],
//     error: json['error'],
//   );

//   factory SignUpResponse.success(String userId, String email) => SignUpResponse(
//     success: true,
//     userId: userId,
//     email: email,
//   );

//   factory SignUpResponse.failure(String error) => SignUpResponse(
//     success: false,
//     error: error,
//   );
// }

// To parse this JSON data, do
//
//     final signUpResponse = signUpResponseFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

import 'package:notely/features/auth/domain/entity/user_data.dart';

SignUpResponse signUpResponseFromJson(String str) =>
    SignUpResponse.fromJson(json.decode(str));

String signUpResponseToJson(SignUpResponse data) => json.encode(data.toJson());

class SignUpResponse {
  final bool success;
  final String? userId;
  final String? email;
  final String? error;

  SignUpResponse({
    required this.success,
    this.userId,
    this.email,
    this.error,
  });

  SignUpRes toRes() {
    return SignUpRes(success: success, email: email, userId: userId);
  }

  factory SignUpResponse.success(String userId, String email) => SignUpResponse(
        success: true,
        userId: userId,
        email: email,
      );

  factory SignUpResponse.failure(String error) => SignUpResponse(
        success: false,
        error: error,
      );
  factory SignUpResponse.fromJson(Map<String, dynamic> json) => SignUpResponse(
        success: json["success"],
        userId: json["userId"],
        email: json["email"],
        error: json["error"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "userId": userId,
        "email": email,
        "error": error,
      };
}
