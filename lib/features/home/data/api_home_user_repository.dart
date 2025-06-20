import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mybudiluhur/core/api/api_url.dart';
import 'package:mybudiluhur/core/storage/flutter_secure_storage.dart';
import 'package:mybudiluhur/features/home/domain/entities/home_user.dart';
import 'package:mybudiluhur/features/home/domain/repository/home_user_repository.dart';

class ApiHomeUserRepository implements HomeUserRepository {
  final _apiUrl = ApiUrl.profileBaseUrl;
  @override
  Future<HomeUser?> fetchHomeUserData(String nis) async {
    final token = await secureStorage.read(key: "token");

    try {
      final response = await http.get(
        Uri.parse('$_apiUrl/$nis'),
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        return HomeUser(
          nis: nis,
          nama: data['Nama'],
          profileImageUrl: data['profileImageUrl'] ?? '',
        );
      }
      return null;
    } catch (e) {
      return null;
    }
  }
}
