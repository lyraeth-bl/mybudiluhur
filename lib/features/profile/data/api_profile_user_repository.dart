import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mybudiluhur/core/api/api_url.dart';
import 'package:mybudiluhur/core/storage/flutter_secure_storage.dart';
import 'package:mybudiluhur/features/profile/domain/entities/profile_user.dart';
import 'package:mybudiluhur/features/profile/domain/repository/profile_user_repository.dart';

class ApiProfileUserRepository implements ProfileUserRepository {
  final _apiUrl = ApiUrl.profileBaseUrl;

  @override
  Future<void> editProfileUser(ProfileUser profileUser) async {
    final token = await secureStorage.read(key: "token");

    try {
      await http.put(
        Uri.parse('$_apiUrl/${profileUser.nis}'),
        headers: {'Authorization': 'Bearer $token'},
        body: {'Password': profileUser.password},
      );
      await secureStorage.write(key: "password", value: profileUser.password);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<ProfileUser?> fetchProfileUser() async {
    final dataSiswa = await secureStorage.read(key: "siswa");

    if (dataSiswa == null) {
      return null;
    }

    final data = jsonDecode(dataSiswa);

    return ProfileUser(
      nis: data['NIS'] ?? '',
      nisn: data['NISN'] ?? '',
      nama: data['Nama'] ?? '',
      tempLahir: data['TempLahir'] ?? '',
      tglLahir: data['TglLahir'] ?? '',
      email: data['Email'] ?? '',
      kelasSaatIni: data['KelasSaatIni'] ?? '',
      aktif: data['Aktif'] ?? '',
      statLulus: data['Stat_lulus'] ?? '',
      profileImageUrl: data['profileImageUrl'] ?? '',
    );
  }

  @override
  Future<void> uploadProfileImage(
    ProfileUser profileUser,
    String filePath,
    String fileName,
  ) async {
    final token = await secureStorage.read(key: "token");

    final uploadImage =
        http.MultipartRequest("POST", Uri.parse('$_apiUrl/${profileUser.nis}'))
          ..headers['Authorization'] = 'Bearer $token'
          ..fields['_method'] = 'PUT'
          ..fields['profileImageUrl']
          ..files.add(
            await http.MultipartFile.fromPath(
              'profileImageUrl',
              filePath,
              filename: fileName,
            ),
          );

    try {
      await uploadImage.send();
    } catch (e) {
      throw Exception('Error during upload: $e');
    }
  }
}
