import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_restapi/features/users/data/models/user_response_model.dart';
import 'package:riverpod_restapi/features/users/data/repositories/user_repository.dart';

final userControllerProvider =
    StateNotifierProvider<UserController, AsyncValue<UserResponseModel>>((ref) {
  return UserController(ref.read(userRepositoryProvider));
});

class UserController extends StateNotifier<AsyncValue<UserResponseModel>> {
  UserController(this._userRepository) : super(const AsyncValue.loading()) {
    fetchUsers();
  }

  final UserRepository _userRepository;

  fetchUsers() async {
    final result = await _userRepository.getUsers();
    result.fold(
      (l) =>
          state = AsyncValue.error(l.message, StackTrace.fromString(l.message)),
      (r) => state = AsyncValue.data(r),
    );
  }
}
