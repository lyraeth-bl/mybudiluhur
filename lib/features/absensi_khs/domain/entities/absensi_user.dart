// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:mybudiluhur/features/auth/domain/entities/app_user.dart';

class AbsensiUser extends AppUser {
  final String id;
  final String kelas;
  final String alasanKetidakhadiran;
  final String keterangan;
  final String tanggal;
  final String jamTerlambat;
  final String tajaran;
  final String semester;
  final String status;

  AbsensiUser({
    required this.id,
    required super.nis,
    required this.kelas,
    required this.alasanKetidakhadiran,
    required this.keterangan,
    required this.tanggal,
    required this.jamTerlambat,
    required this.tajaran,
    required this.semester,
    required this.status,
  });

  AbsensiUser copyWith({
    String? newKelas,
    String? newAlasanKetidakhadiran,
    String? newKeterangan,
    String? newTanggal,
    String? newJamTerlambat,
    String? newTajaran,
    String? newSemester,
    String? newStatus,
  }) {
    return AbsensiUser(
      id: id,
      nis: nis,
      kelas: newKelas ?? kelas,
      alasanKetidakhadiran: newAlasanKetidakhadiran ?? alasanKetidakhadiran,
      keterangan: newKeterangan ?? keterangan,
      tanggal: newTanggal ?? tanggal,
      jamTerlambat: newJamTerlambat ?? jamTerlambat,
      tajaran: newTajaran ?? tajaran,
      semester: newSemester ?? semester,
      status: newStatus ?? status,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id.toString(),
      'NIS': nis,
      'Kelas': kelas,
      'AlasanKetidakhadiran': alasanKetidakhadiran,
      'Keterangan': keterangan,
      'Tanggal': tanggal,
      'JamTerlambat': jamTerlambat,
      'Tajaran': tajaran,
      'Semester': semester,
      'Status': status,
    };
  }

  factory AbsensiUser.fromMap(Map<String, dynamic> map) {
    return AbsensiUser(
      id: map['id'].toString(),
      nis: map['NIS'] ?? '',
      kelas: map['Kelas'] ?? '',
      alasanKetidakhadiran: map['AlasanKetidakhadiran'] ?? '',
      keterangan: map['Keterangan'] ?? '',
      tanggal: map['Tanggal'] ?? '',
      jamTerlambat: map['JamTerlambat'] ?? '',
      tajaran: map['Tajaran'] ?? '',
      semester: map['Semester'] ?? '',
      status: map['Status'] ?? '',
    );
  }

  @override
  String toJson() => json.encode(toMap());

  factory AbsensiUser.fromJson(Map<String, dynamic> json) {
    return AbsensiUser(
      id: json['id'].toString(),
      nis: json['NIS'] ?? '',
      kelas: json['Kelas'] ?? '',
      alasanKetidakhadiran: json['AlasanKetidakhadiran'] ?? '',
      keterangan: json['Keterangan'] ?? '',
      tanggal: json['Tanggal'] ?? '',
      jamTerlambat: json['JamTerlambat'] ?? '',
      tajaran: json['Tajaran'] ?? '',
      semester: json['Semester'] ?? '',
      status: json['Status'] ?? '',
    );
  }
}
