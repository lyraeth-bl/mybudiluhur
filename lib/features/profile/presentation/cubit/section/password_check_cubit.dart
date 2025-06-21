import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mybudiluhur/core/storage/flutter_secure_storage.dart';
import 'package:mybudiluhur/features/profile/data/api_profile_user_repository.dart';
import 'package:mybudiluhur/features/profile/presentation/cubit/section/password_check_state.dart';

class PasswordCheckCubit extends Cubit<PasswordCheckState> {
  final ApiProfileUserRepository apiProfileUserRepository;

  PasswordCheckCubit({required this.apiProfileUserRepository})
    : super(PasswordCheckInitial());

  Future<void> checkPassword({
    required String nis,
    required String password,
  }) async {
    emit(PasswordCheckLoading());
    try {
      final passwordUser = await secureStorage.read(key: "password");

      if (passwordUser == null) {
        emit(PasswordCheckError("User tidak ditemukan."));
        return;
      }

      if (password == passwordUser) {
        emit(PasswordCheckSuccess());
      } else {
        emit(PasswordCheckError("Password tidak sama."));
      }
    } catch (e) {
      emit(PasswordCheckError("Gagal verifikasi password."));
    }
  }

  void reset() {
    emit(PasswordCheckInitial());
  }
}
