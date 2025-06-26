import 'package:mybudiluhur/features/absensi_khs/domain/entities/absensi_user.dart';

abstract class AbsensiUserRepository {
  Future<List<AbsensiUser>?> fetchAbsensi();
  Future<List<AbsensiUser>?> refreshData(String nis);
}
