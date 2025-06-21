import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mybudiluhur/core/api/api_url.dart';
import 'package:mybudiluhur/core/storage/flutter_secure_storage.dart';
import 'package:mybudiluhur/features/home/domain/entities/home_user.dart';
import 'package:mybudiluhur/features/home/domain/repository/home_user_repository.dart';

class ApiHomeUserRepository implements HomeUserRepository {
  final _apiUrl = ApiUrl.profileBaseUrl;

  @override
  Future<HomeUser?> fetchHomeUserData() async {
    final dataSiswa = await secureStorage.read(key: "siswa");

    if (dataSiswa == null) {
      return null;
    }

    final homeUser = jsonDecode(dataSiswa);

    return HomeUser(
      nis: homeUser['NIS'],
      nama: homeUser['Nama'],
      profileImageUrl: homeUser['profileImageUrl'],
    );
  }

  @override
  Future<void> refreshData(String nis) async {
    // Ambil token buat fetch ke API
    final token = await secureStorage.read(key: "token");

    // Delete data siswa di SecureStorage
    await secureStorage.delete(key: "siswa");

    // Fetch data baru dari DB / API
    try {
      final response = await http.get(
        Uri.parse('$_apiUrl/$nis'),
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        // masukin data baru dari db ke SecureStorage
        await secureStorage.write(key: "siswa", value: jsonEncode(data));
      }
    } catch (e) {
      throw Exception("Refresh data gagal : $e");
    }
  }
}
