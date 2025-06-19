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
  Future<ProfileUser?> fetchProfileUser(String nis) async {
    final token = await secureStorage.read(key: "token");

    try {
      final response = await http.get(
        Uri.parse('$_apiUrl/$nis'),
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final passwordUser = await secureStorage.read(key: "password");

        return ProfileUser(
          nis: nis,
          nisn: data['NISN'],
          nama: data['Nama'],
          password: passwordUser,
          tempLahir: data['TempLahir'],
          tglLahir: data['TglLahir'],
          email: data['Email'],
          kelasSaatIni: data['KelasSaatIni'],
          aktif: data['Aktif'],
          statLulus: data['Stat_lulus'],
          profileImageUrl: data['profileImageUrl'] ?? '',
        );
      }
      return null;
    } catch (e) {
      return null;
    }
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
