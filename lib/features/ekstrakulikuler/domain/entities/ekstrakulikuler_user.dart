// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:mybudiluhur/features/auth/domain/entities/app_user.dart';

class EkstrakulikulerUser extends AppUser {
  final String id;
  final String kelas;
  final String nomorKelas;
  final String namaKegiatan;
  final String tajaran;
  final String semester;
  final String nilai;

  EkstrakulikulerUser({
    required this.id,
    required super.nis,
    required this.kelas,
    required this.nomorKelas,
    required this.namaKegiatan,
    required this.tajaran,
    required this.semester,
    required this.nilai,
  });

  EkstrakulikulerUser copyWith({
    String? newKelas,
    String? newNomorKelas,
    String? newNamaKegiatan,
    String? newTajaran,
    String? newSemester,
    String? newNilai,
  }) {
    return EkstrakulikulerUser(
      id: id,
      nis: nis,
      kelas: newKelas ?? kelas,
      nomorKelas: newNomorKelas ?? nomorKelas,
      namaKegiatan: newNamaKegiatan ?? namaKegiatan,
      tajaran: newTajaran ?? tajaran,
      semester: newSemester ?? semester,
      nilai: newNilai ?? nilai,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'NIS': nis,
      'Kelas': kelas,
      'NomorKelas': nomorKelas,
      'NamaKegiatan': namaKegiatan,
      'Tajaran': tajaran,
      'Semester': semester,
      'Nilai': nilai,
    };
  }

  factory EkstrakulikulerUser.fromMap(Map<String, dynamic> map) {
    return EkstrakulikulerUser(
      id: map['id'].toString(),
      nis: map['NIS'] ?? '',
      kelas: map['Kelas'] ?? '',
      nomorKelas: map['NomorKelas'] ?? '',
      namaKegiatan: map['NamaKegiatan'] ?? '',
      tajaran: map['Tajaran'] ?? '',
      semester: map['Semester'] ?? '',
      nilai: map['Nilai'] ?? '',
    );
  }

  @override
  String toJson() => json.encode(toMap());

  factory EkstrakulikulerUser.fromJson(Map<String, dynamic> json) {
    return EkstrakulikulerUser(
      id: json['id'].toString(),
      nis: json['NIS'] ?? '',
      kelas: json['Kelas'] ?? '',
      nomorKelas: json['NomorKelas'] ?? '',
      namaKegiatan: json['NamaKegiatan'] ?? '',
      tajaran: json['Tajaran'] ?? '',
      semester: json['Semester'] ?? '',
      nilai: json['Nilai'] ?? '',
    );
  }
}
