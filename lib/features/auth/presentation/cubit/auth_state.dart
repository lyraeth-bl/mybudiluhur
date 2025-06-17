import 'package:mybudiluhur/features/auth/domain/entities/app_user.dart';

/// State dasar untuk proses autentikasi.
abstract class AuthState {}

/// State awal sebelum proses autentikasi dimulai.
class AuthInitial extends AuthState {}

/// State yang menunjukkan proses autentikasi sedang berlangsung.
class AuthLoading extends AuthState {}

/// State yang menunjukkan pengguna telah berhasil diautentikasi.
///
/// [appUser] berisi data pengguna yang telah login.
/// [token] adalah token autentikasi yang didapatkan setelah login berhasil.
class Authenticated extends AuthState {
  final AppUser? appUser;
  Authenticated(this.appUser);
}

/// State yang menunjukkan pengguna belum diautentikasi atau telah logout.
class Unauthenticated extends AuthState {}

/// State yang menunjukkan terjadi kesalahan saat proses autentikasi.
///
/// [message] berisi pesan error yang menjelaskan penyebab kegagalan autentikasi.
class AuthError extends AuthState {
  final String message;
  AuthError(this.message);
}
