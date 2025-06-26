import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mybudiluhur/core/api/api_url.dart';
import 'package:mybudiluhur/core/storage/flutter_secure_storage.dart';
import 'package:mybudiluhur/features/absensi_khs/domain/entities/absensi_user.dart';
import 'package:mybudiluhur/features/absensi_khs/domain/repository/absensi_user_repository.dart';

class ApiAbsensiUserRepository implements AbsensiUserRepository {
  final _apiUrl = ApiUrl.absensiBaseUrl;

  @override
  Future<List<AbsensiUser>?> fetchAbsensi() async {
    final absensiUser = await secureStorage.read(key: "absensi");

    if (absensiUser == null) {
      return null;
    }

    final absensi = jsonDecode(absensiUser);

    return (absensi as List)
        .map(
          (item) => AbsensiUser(
            id: item['id'].toString(),
            nis: item['NIS'],
            kelas: item['Kelas'],
            alasanKetidakhadiran: item['AlasanKetidakhadiran'],
            keterangan: item['Keterangan'],
            tanggal: item['Tanggal'],
            jamTerlambat: item['JamTerlambat'],
            tajaran: item['Tajaran'],
            semester: item['Semester'],
            status: item['Status'],
          ),
        )
        .toList();
  }

  @override
  Future<List<AbsensiUser>?> refreshData(String nis) async {
    // Ambil token buat fetch ke API
    final token = await secureStorage.read(key: "token");

    // Delete data siswa di SecureStorage
    await secureStorage.delete(key: "absensi");

    try {
      final response = await http.get(
        Uri.parse('$_apiUrl/$nis'),
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        await secureStorage.write(key: "absensi", value: jsonEncode(data));
      }
      return null;
    } catch (e) {
      throw Exception("Failed to refresh data absensi : $e");
    }
  }
}
