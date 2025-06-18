import 'dart:convert';

import 'package:mybudiluhur/core/storage/flutter_secure_storage.dart';
import 'package:mybudiluhur/features/home/domain/entities/home_user.dart';
import 'package:mybudiluhur/features/home/domain/repository/home_user_repository.dart';

class ApiHomeUserRepository implements HomeUserRepository {
  @override
  Future<HomeUser?> fetchHomeUserData() async {
    final dataSiswa = await secureStorage.read(key: 'siswa');

    if (dataSiswa == null) {
      return null;
    }

    final siswa = jsonDecode(dataSiswa);

    return HomeUser(
      nis: siswa['NIS'],
      nama: siswa['Nama'],
      profileImageUrl: siswa['profileImageUrl'] ?? '',
    );
  }
}
