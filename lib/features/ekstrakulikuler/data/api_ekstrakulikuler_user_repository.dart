import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mybudiluhur/core/api/api_url.dart';
import 'package:mybudiluhur/core/storage/flutter_secure_storage.dart';
import 'package:mybudiluhur/features/ekstrakulikuler/domain/entities/ekstrakulikuler_user.dart';
import 'package:mybudiluhur/features/ekstrakulikuler/domain/repository/ekstrakulikuler_user_repository.dart';

class ApiEkstrakulikulerUserRepository
    implements EkstrakulikulerUserRepository {
  final _apiUrl = ApiUrl.ekstrakulikulerBaseUrl;

  @override
  Future<List<EkstrakulikulerUser>?> fetchEkstrakulikulerUser(
    String nis,
  ) async {
    final token = await secureStorage.read(key: "token");

    try {
      final response = await http.get(
        Uri.parse('$_apiUrl/$nis'),
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        await secureStorage.write(
          key: "ekstrakulikuler",
          value: jsonEncode(data),
        );

        return (data as List)
            .map((item) => EkstrakulikulerUser.fromJson(item))
            .toList();
      }
      return null;
    } catch (e) {
      throw Exception("Failed to fetch data ekstrakulikuler : $e");
    }
  }

  @override
  Future<List<EkstrakulikulerUser>?> fetchEkstrakulikuler() async {
    final ekstrakulikulerUser = await secureStorage.read(
      key: "ekstrakulikuler",
    );

    if (ekstrakulikulerUser == null) {
      return null;
    }

    return (ekstrakulikulerUser as List)
        .map(
          (item) => EkstrakulikulerUser(
            id: item['id'],
            nis: item['NIS'],
            kelas: item['Kelas'],
            nomorKelas: item['NomorKelas'],
            namaKegiatan: item['NamaKegiatan'],
            tajaran: item['Tajaran'],
            semester: item['Semester'],
            nilai: item['Nilai'],
          ),
        )
        .toList();
  }

  @override
  Future<List<EkstrakulikulerUser>?> refreshData(String nis) async {
    // Ambil token buat fetch ke API
    final token = await secureStorage.read(key: "token");

    // Delete data siswa di SecureStorage
    await secureStorage.delete(key: "ekstrakulikuler");

    try {
      final response = await http.get(
        Uri.parse('$_apiUrl/$nis'),
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        await secureStorage.write(
          key: "ekstrakulikuler",
          value: jsonEncode(data),
        );
      }
      return null;
    } catch (e) {
      throw Exception("Failed to refresh data ekstrakulikuler : $e");
    }
  }
}
