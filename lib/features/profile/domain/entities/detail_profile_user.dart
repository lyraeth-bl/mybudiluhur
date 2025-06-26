// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:mybudiluhur/features/auth/domain/entities/app_user.dart';

class DetailProfileUser extends AppUser {
  final String nisn;
  final String nama;
  final String tempLahir;
  final String tglLahir;
  final String jenisKelamin;
  final String agama;
  final String alamat;
  final String telpon;
  final String diterimaDiKelas;
  final String nomorKelas;
  final String tglDiTerima;
  final String semester;
  final String namaSekolahAsal;
  final String tahunIjasah;
  final String noIjasah;
  final String tahunSkhun;
  final String noSkhun;
  final String anakKe;
  final String statKel;
  final String namaAyah;
  final String namaIbu;
  final String pekerjaanAyah;
  final String pekerjaanIbu;
  final String alamatOrtu;
  final String namaWali;
  final String alamatWali;
  final String telpWali;
  final String pekerjaanWali;
  final String email;
  final String kelasSaatIni;
  final String nomorKelasSaatIni;
  final String aktif;
  final String statNaik;
  final String statUjian;
  final String aksesSkl;
  final String statLulus;

  DetailProfileUser({
    required super.nis,
    required this.nisn,
    required this.nama,
    required this.tempLahir,
    required this.tglLahir,
    required this.jenisKelamin,
    required this.agama,
    required this.alamat,
    required this.telpon,
    required this.diterimaDiKelas,
    required this.nomorKelas,
    required this.tglDiTerima,
    required this.semester,
    required this.namaSekolahAsal,
    required this.tahunIjasah,
    required this.noIjasah,
    required this.tahunSkhun,
    required this.noSkhun,
    required this.anakKe,
    required this.statKel,
    required this.namaAyah,
    required this.namaIbu,
    required this.pekerjaanAyah,
    required this.pekerjaanIbu,
    required this.alamatOrtu,
    required this.namaWali,
    required this.alamatWali,
    required this.telpWali,
    required this.pekerjaanWali,
    required this.email,
    required this.kelasSaatIni,
    required this.nomorKelasSaatIni,
    required this.aktif,
    required this.statNaik,
    required this.statUjian,
    required this.aksesSkl,
    required this.statLulus,
  });

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'NISN': nisn,
      'Nama': nama,
      'TempLahir': tempLahir,
      'TglLahir': tglLahir,
      'JenisKelamin': jenisKelamin,
      'Agama': agama,
      'Alamat': alamat,
      'Telpon': telpon,
      'DiterimaDiKelas': diterimaDiKelas,
      'NomorKelas': nomorKelas,
      'TglDiTerima': tglDiTerima,
      'Semester': semester,
      'NamaSekolahAsal': namaSekolahAsal,
      'TahunIjasah': tahunIjasah,
      'NoIjasah': noIjasah,
      'TahunSkhun': tahunSkhun,
      'NoSkhun': noSkhun,
      'AnakKe': anakKe,
      'StatKel': statKel,
      'NamaAyah': namaAyah,
      'NamaIbu': namaIbu,
      'PekerjaanAyah': pekerjaanAyah,
      'PekerjaanIbu': pekerjaanIbu,
      'AlamatOrtu': alamatOrtu,
      'NmWali': namaWali,
      'AlamatWali': alamatWali,
      'TelpWali': telpWali,
      'PekerjaanWali': pekerjaanWali,
      'Email': email,
      'KelasSaatIni': kelasSaatIni,
      'NomorKelasSaatIni': nomorKelasSaatIni,
      'Aktif': aktif,
      'StatNaik': statNaik,
      'StatUjian': statUjian,
      'Akses_skl': aksesSkl,
      'Stat_lulus': statLulus,
    };
  }

  factory DetailProfileUser.fromMap(Map<String, dynamic> map) {
    return DetailProfileUser(
      nis: map['NIS'] as String,
      nisn: map['NISN'] as String,
      nama: map['Nama'] as String,
      tempLahir: map['TempLahir'] as String,
      tglLahir: map['TglLahir'] as String,
      jenisKelamin: map['JenisKelamin'] as String,
      agama: map['Agama'] as String,
      alamat: map['Alamat'] as String,
      telpon: map['Telpon'] as String,
      diterimaDiKelas: map['DiterimaDiKelas'] as String,
      nomorKelas: map['NomorKelas'] as String,
      tglDiTerima: map['TglDiTerima'] as String,
      semester: map['Semester'] as String,
      namaSekolahAsal: map['NamaSekolahAsal'] as String,
      tahunIjasah: map['TahunIjasah'].toString(),
      noIjasah: map['NoIjasah'] as String,
      tahunSkhun: map['TahunSkhun'] as String,
      noSkhun: map['NoSkhun'] as String,
      anakKe: map['AnakKe'].toString(),
      statKel: map['StatKel'] as String,
      namaAyah: map['NamaAyah'] as String,
      namaIbu: map['NamaIbu'] as String,
      pekerjaanAyah: map['PekerjaanAyah'] as String,
      pekerjaanIbu: map['PekerjaanIbu'] as String,
      alamatOrtu: map['AlamatOrtu'] as String,
      namaWali: map['NmWali'] as String,
      alamatWali: map['AlamatWali'] as String,
      telpWali: map['TelpWali'] as String,
      pekerjaanWali: map['PekerjaanWali'] as String,
      email: map['Email'] as String,
      kelasSaatIni: map['KelasSaatIni'] as String,
      nomorKelasSaatIni: map['NomorKelasSaatIni'] as String,
      aktif: map['Aktif'] as String,
      statNaik: map['StatNaik'] as String,
      statUjian: map['StatUjian'].toString(),
      aksesSkl: map['Akses_skl'] as String,
      statLulus: map['Stat_lulus'] as String,
    );
  }

  @override
  String toJson() => json.encode(toMap());

  factory DetailProfileUser.fromJson(String source) =>
      DetailProfileUser.fromMap(json.decode(source) as Map<String, dynamic>);
}
