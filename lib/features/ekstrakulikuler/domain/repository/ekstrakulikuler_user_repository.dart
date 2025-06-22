import 'package:mybudiluhur/features/ekstrakulikuler/domain/entities/ekstrakulikuler_user.dart';

abstract class EkstrakulikulerUserRepository {
  Future<List<EkstrakulikulerUser>?> fetchEkstrakulikulerUser(String nis);
  Future<List<EkstrakulikulerUser>?> fetchEkstrakulikuler();
  Future<List<EkstrakulikulerUser>?> refreshData(String nis);

  /// NOTE :
  ///
  /// Hapus Comment untuk fungsi yang dibutuhkan
  ///
  /// Create
  ///
  /// Future<void> createEkstrakulikulerUser(
  ///   EkstrakulikulerUser ekstrakulikulerUser,
  /// );

  /// Edit
  ///
  /// Future<void> editEkstrakulikulerUser({
  ///   required String? nis,
  ///   String? newKelas,
  ///   String? newNomorKelas,
  ///   String? newNamaKegiatan,
  ///   String? newTajaran,
  ///   String? newSemester,
  ///   String? newNilai,
  /// });
  ///
  /// Delete
  ///
  /// Future<void> deleteEkstrakulikulerUser({required String id})
}
