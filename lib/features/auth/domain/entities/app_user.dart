// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

/// Kelas [AppUser] merepresentasikan entitas pengguna aplikasi.
class AppUser {
  /// Properti:
  /// - [nis]: Nomor Induk Siswa, wajib diisi.
  final String nis;

  /// - [password]: Kata sandi pengguna, opsional.
  final String? password;

  /// Konstruktor:
  /// - Membuat instance [AppUser] dengan [nis] yang wajib dan [password] yang opsional.
  AppUser({required this.nis, this.password});

  /// - [toMap]: Mengubah objek [AppUser] menjadi map.
  Map<String, dynamic> toMap() {
    return <String, dynamic>{'nis': nis, 'password': password};
  }

  /// - [fromMap]: Membuat objek [AppUser] dari map.
  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
      nis: map['NIS'] as String,
      password: map['Password'] as String,
    );
  }

  /// - [toJson]: Mengubah objek [AppUser] menjadi string JSON.
  String toJson() => json.encode(toMap());

  /// - [fromJson]: Membuat objek [AppUser] dari string JSON.
  factory AppUser.fromJson(String source) =>
      AppUser.fromMap(json.decode(source) as Map<String, dynamic>);
}
