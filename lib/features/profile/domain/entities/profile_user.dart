// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:mybudiluhur/features/auth/domain/entities/app_user.dart';

class ProfileUser extends AppUser {
  final String nama;
  final String nisn;
  final String tempLahir;
  final String tglLahir;
  final String email;
  final String kelasSaatIni;
  final String aktif;
  final String statLulus;
  final String profileImageUrl;

  ProfileUser({
    required super.nis,
    required this.nisn,
    required this.nama,
    super.password,
    required this.tempLahir,
    required this.tglLahir,
    required this.email,
    required this.kelasSaatIni,
    required this.aktif,
    required this.statLulus,
    required this.profileImageUrl,
  });

  ProfileUser copyWith({String? newPassword, String? newprofileImageUrl}) {
    return ProfileUser(
      nis: nis,
      nisn: nisn,
      nama: nama,
      password: newPassword ?? password,
      tempLahir: tempLahir,
      tglLahir: tglLahir,
      email: email,
      kelasSaatIni: kelasSaatIni,
      aktif: aktif,
      statLulus: statLulus,
      profileImageUrl: newprofileImageUrl ?? profileImageUrl,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'NIS': nis,
      'NISN': nisn,
      'Nama': nama,
      'TempLahir': tempLahir,
      'TglLahir': tglLahir,
      'Email': email,
      'KelasSaatIni': kelasSaatIni,
      'Aktif': aktif,
      'Stat_lulus': statLulus,
      'profileImageUrl': profileImageUrl,
    };
  }

  factory ProfileUser.fromMap(Map<String, dynamic> map) {
    return ProfileUser(
      nis: map['NIS'] as String,
      nisn: map['NISN'] as String,
      nama: map['Nama'] as String,
      tempLahir: map['TempLahir'] as String,
      tglLahir: map['TglLahir'] as String,
      email: map['Email'] as String,
      kelasSaatIni: map['KelasSaatIni'] as String,
      aktif: map['Aktif'] as String,
      statLulus: map['Stat_lulus'] as String,
      profileImageUrl: map['profileImageUrl'] as String,
    );
  }

  @override
  String toJson() => json.encode(toMap());

  factory ProfileUser.fromJson(String source) =>
      ProfileUser.fromMap(json.decode(source) as Map<String, dynamic>);
}
