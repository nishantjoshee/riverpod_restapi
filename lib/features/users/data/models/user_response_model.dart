// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:riverpod_restapi/constants/app_constants.dart';

class UserResponseModel {
  final int page;
  final int totalPages;
  final List<UserModel> data;
  UserResponseModel({
    required this.page,
    required this.totalPages,
    required this.data,
  });

  factory UserResponseModel.fromMap(Map<String, dynamic> map) {
    return UserResponseModel(
      page: map['page'] as int,
      totalPages: map['total_pages'] as int,
      data:
          List.from(map['data']).map((obj) => UserModel.fromMap(obj)).toList(),
    );
  }
}

class UserModel {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String avatar;
  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.avatar,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? 0,
      firstName: map['first_name'] ?? '',
      lastName: map['last_name'] ?? '',
      email: map['email'] ?? '',
      avatar: map['avatar'] ?? AppConstants.placeHolderImage,
    );
  }
}
