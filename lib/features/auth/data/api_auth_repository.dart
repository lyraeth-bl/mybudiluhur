import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:mybudiluhur/core/api/api_url.dart';
import 'package:mybudiluhur/core/storage/flutter_secure_storage.dart';
import 'package:mybudiluhur/features/absensi_khs/domain/entities/absensi_user.dart';
import 'package:mybudiluhur/features/auth/domain/entities/app_user.dart';
import 'package:mybudiluhur/features/auth/domain/repository/auth_repository.dart';
import 'package:mybudiluhur/features/ekstrakulikuler/domain/entities/ekstrakulikuler_user.dart';

/// [ApiAuthRepository] adalah implementasi dari [AuthRepository]
/// yang menangani autentikasi pengguna melalui
/// API eksternal dan menyimpan data autentikasi secara lokal menggunakan [FlutterSecureStorage].

class ApiAuthRepository implements AuthRepository {
  /// URL endpoint API untuk login.
  /// mengambil dari class [ApiUrl]
  final _apiAuthUrl = ApiUrl.authBaseUrl;
  final _apiAbsensiUrl = ApiUrl.absensiBaseUrl;
  final _apiEkstrakulikulerUrl = ApiUrl.ekstrakulikulerBaseUrl;

  /// Melakukan login ke API menggunakan NIS dan password.
  @override
  Future<AppUser?> loginWithNisAndPassword({
    required String nis,
    required String password,
  }) async {
    try {
      // Post ke API
      final response = await http.post(
        Uri.parse(_apiAuthUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'nis': nis, 'password': password}),
      );

      /// Jika status code dari API adalah 200 (Berhasil)
      if (response.statusCode == 200) {
        /// Ubah data response dari API ke String
        final data = jsonDecode(response.body);

        /// Ambil String token dari API
        final accessToken = data['access_token'];

        /// Ambil String NIS dari API
        final nisSiswa = data['siswa']['NIS'];

        /// Ambil semua data siswa dari API
        final dataSiswa = data['siswa'];

        /// Menyimpan semua data yang diperlukan ke [FlutterSecureStorage]
        await secureStorage.write(key: "token", value: accessToken);
        await secureStorage.write(key: "nis", value: nisSiswa);
        await secureStorage.write(key: "password", value: password);
        await secureStorage.write(key: "siswa", value: jsonEncode(dataSiswa));

        /// Menyimpan data ke [AppUser]
        AppUser user = AppUser(nis: dataSiswa['NIS']);

        try {
          final absensi = await http.get(
            Uri.parse('$_apiAbsensiUrl/$nis'),
            headers: {'Authorization': 'Bearer $accessToken'},
          );

          final data = jsonDecode(absensi.body);

          await secureStorage.write(key: "absensi", value: jsonEncode(data));

          (data as List).map((item) => AbsensiUser.fromJson(item)).toList();
        } catch (e) {
          throw Exception("Fetch data Absensi gagal");
        }

        try {
          final ekstrakulikuler = await http.get(
            Uri.parse('$_apiEkstrakulikulerUrl/$nis'),
            headers: {'Authorization': 'Bearer $accessToken'},
          );

          final data = jsonDecode(ekstrakulikuler.body);

          await secureStorage.write(
            key: "ekstrakulikuler",
            value: jsonEncode(data),
          );

          (data as List)
              .map((item) => EkstrakulikulerUser.fromJson(item))
              .toList();
        } catch (e) {
          throw Exception("Fetch data Ekstrakulikuler gagal");
        }

        return user;
      }
    } catch (e) {
      /// Mengambil error
      throw Exception('Login gagal: $e');
    }
    return null;
  }

  /// Menghapus seluruh data yang tersimpan di secure storage (logout).
  @override
  Future<void> logout() async {
    await secureStorage.delete(key: 'nis');
    await secureStorage.delete(key: 'token');
    await secureStorage.delete(key: 'password');
    await secureStorage.delete(key: 'siswa');
    await secureStorage.delete(key: 'absensi');
    await secureStorage.delete(key: 'ekstrakulikuler');
  }

  /// Mengambil data pengguna yang sedang login dari secure storage.
  @override
  Future<AppUser?> getCurrentUser() async {
    final siswa = await secureStorage.read(key: "siswa");

    if (siswa == null) {
      return null;
    }

    final dataSiswa = jsonDecode(siswa);

    return AppUser(nis: dataSiswa['NIS']);
  }
}
