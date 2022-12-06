import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_restapi/core/app_error.dart';
import 'package:riverpod_restapi/core/dio_exception.dart';
import 'package:riverpod_restapi/features/users/data/data_sources/user_remote_data_source.dart';
import 'package:riverpod_restapi/features/users/data/models/user_response_model.dart';

final userRepositoryProvider = Provider<UserRepository>((ref) {
  return UserRepositoryImpl(ref.read(userRemoteDataSourceProvider));
});

abstract class UserRepository {
  Future<Either<AppError, UserResponseModel>> getUsers();
}

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource _userRmoteDataSource;
  UserRepositoryImpl(this._userRmoteDataSource);
  @override
  Future<Either<AppError, UserResponseModel>> getUsers() async {
    try {
      final result = await _userRmoteDataSource.getUsers();
      return Right(result);
    } on DioException catch (e) {
      return Left(AppError(message: e.message!));
    }
  }
}
