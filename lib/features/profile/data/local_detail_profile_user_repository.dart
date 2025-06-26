import 'dart:convert';

import 'package:mybudiluhur/core/storage/flutter_secure_storage.dart';
import 'package:mybudiluhur/features/profile/domain/entities/detail_profile_user.dart';
import 'package:mybudiluhur/features/profile/domain/repository/detail_profile_user_repository.dart';

class LocalDetailProfileUserRepository implements DetailProfileUserRepository {
  @override
  Future<DetailProfileUser?> fetchDetailProfileUser() async {
    final dataSiswa = await secureStorage.read(key: "siswa");

    if (dataSiswa == null) {
      return null;
    }

    final detailProfile = jsonDecode(dataSiswa);

    return DetailProfileUser(
      nis: detailProfile['NIS'],
      nisn: detailProfile['NISN'],
      nama: detailProfile['Nama'],
      tempLahir: detailProfile['TempLahir'],
      tglLahir: detailProfile['TglLahir'],
      jenisKelamin: detailProfile['JenisKelamin'],
      agama: detailProfile['Agama'],
      alamat: detailProfile['Alamat'],
      telpon: detailProfile['Telpon'],
      diterimaDiKelas: detailProfile['DiterimaDiKelas'],
      nomorKelas: detailProfile['NomorKelas'],
      tglDiTerima: detailProfile['TglDiTerima'],
      semester: detailProfile['Semester'],
      namaSekolahAsal: detailProfile['NamaSekolahAsal'],
      tahunIjasah: detailProfile['TahunIjasah'].toString(),
      noIjasah: detailProfile['NoIjasah'],
      tahunSkhun: detailProfile['TahunSkhun'],
      noSkhun: detailProfile['NoSkhun'],
      anakKe: detailProfile['AnakKe'].toString(),
      statKel: detailProfile['StatKel'],
      namaAyah: detailProfile['NamaAyah'],
      namaIbu: detailProfile['NamaIbu'],
      pekerjaanAyah: detailProfile['PekerjaanAyah'],
      pekerjaanIbu: detailProfile['PekerjaanIbu'],
      alamatOrtu: detailProfile['AlamatOrtu'],
      namaWali: detailProfile['NmWali'],
      alamatWali: detailProfile['AlamatWali'],
      telpWali: detailProfile['TelpWali'],
      pekerjaanWali: detailProfile['PekerjaanWali'],
      email: detailProfile['Email'],
      kelasSaatIni: detailProfile['KelasSaatIni'],
      nomorKelasSaatIni: detailProfile['NomorKelasSaatIni'],
      aktif: detailProfile['Aktif'],
      statNaik: detailProfile['StatNaik'],
      statUjian: detailProfile['StatUjian'].toString(),
      aksesSkl: detailProfile['Akses_skl'],
      statLulus: detailProfile['Stat_lulus'],
    );
  }
}
