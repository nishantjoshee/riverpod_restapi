import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_restapi/constants/api_constants.dart';
import 'package:riverpod_restapi/core/api_service.dart';
import 'package:riverpod_restapi/features/users/data/models/user_response_model.dart';

final userRemoteDataSourceProvider = Provider<UserRemoteDataSource>((ref) {
  return UserRemoteDataSourceImpl(ref.read(apiServiceProvider));
});

abstract class UserRemoteDataSource {
  Future<UserResponseModel> getUsers();
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final ApiService _apiService;
  UserRemoteDataSourceImpl(this._apiService);
  @override
  Future<UserResponseModel> getUsers() async {
    final result = await _apiService.getData(endpoint: ApiConstants.users);
    return UserResponseModel.fromMap(result);
  }
}
