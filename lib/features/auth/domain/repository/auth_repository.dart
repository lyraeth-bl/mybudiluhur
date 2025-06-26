import 'package:mybudiluhur/features/auth/domain/entities/app_user.dart';

/// Repository abstrak untuk autentikasi pengguna [AuthRepository].
abstract class AuthRepository {
  /// - [loginWithNisAndPassword]: Melakukan proses login menggunakan NIS dan password.
  Future<AppUser?> loginWithNisAndPassword({
    required String nis,
    required String password,
  });

  /// - [logout]: Melakukan proses logout pengguna.
  Future<void> logout();

  /// - [getCurrentUser]: Mengambil data pengguna yang sedang login (jika ada).
  Future<AppUser?> getCurrentUser();
}
