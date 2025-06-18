import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mybudiluhur/features/auth/data/api_auth_repository.dart';
import 'package:mybudiluhur/features/auth/domain/entities/app_user.dart';
import 'package:mybudiluhur/features/auth/presentation/cubit/auth_state.dart';

/// [AuthCubit] adalah kelas Cubit yang mengelola state autentikasi pengguna
/// menggunakan package [Cubit] untuk state.
///
/// Kelas ini bertanggung jawab untuk:
/// - Mengecek status autentikasi pengguna saat aplikasi dijalankan.
/// - Melakukan proses login menggunakan NIS dan password.
/// - Melakukan proses logout.
/// - Menyimpan dan memulihkan state autentikasi secara otomatis.
class AuthCubit extends Cubit<AuthState> {
  /// - [apiAuthRepository]: Repository yang digunakan untuk berkomunikasi dengan API autentikasi.
  final ApiAuthRepository apiAuthRepository;

  /// - [_currentUser]: Menyimpan data pengguna yang sedang login (jika ada).
  AppUser? _currentUser;

  AuthCubit({required this.apiAuthRepository}) : super(AuthInitial());

  /// - [checkAuth]: Mengecek apakah pengguna sudah login dengan membaca token dari storage
  ///   dan mengambil data pengguna dari repository. Jika pengguna ditemukan, state akan diubah
  ///   menjadi [Authenticated], jika tidak menjadi [Unauthenticated].
  void checkAuth() async {
    final AppUser? user = await apiAuthRepository.getCurrentUser();

    if (user != null) {
      _currentUser = user;

      emit(Authenticated(user));
    } else {
      emit(Unauthenticated());
    }
  }

  /// - [currentUser]: Getter untuk mendapatkan data pengguna yang sedang login.
  AppUser? get currentUser => _currentUser;

  /// - [login]: Melakukan proses login dengan NIS dan password.
  ///   Jika berhasil, state akan diubah menjadi [Authenticated], jika gagal akan mengeluarkan
  ///   [AuthError] dan [Unauthenticated].
  Future<void> login(String nis, String password) async {
    try {
      /// State berubah menjadi AuthLoading saat proses berlangsung.
      emit(AuthLoading());

      final user = await apiAuthRepository.loginWithNisAndPassword(
        nis: nis,
        password: password,
      );

      /// Jika login berhasil, state berubah menjadi Authenticated.
      if (user != null) {
        _currentUser = user;
        emit(Authenticated(user));
      } else {
        /// Jika gagal, state berubah menjadi AuthError dan kemudian Unauthenticated.
        emit(AuthError("NIS atau Password salah"));
        emit(Unauthenticated());
      }
    } catch (e) {
      emit(AuthError(e.toString()));
      emit(Unauthenticated());
    }
  }

  /// - [logout]: Melakukan proses logout dan mengubah state menjadi [Unauthenticated].
  Future<void> logout() async {
    apiAuthRepository.logout();
    await Future.delayed(Duration(milliseconds: 300));
    emit(Unauthenticated());
  }

  /// For Test [AuthCubitTest]
  Future<void> initialize() async {
    emit(AuthInitial());
    await Future.delayed(Duration(milliseconds: 300));
    emit(Unauthenticated());
  }
}
