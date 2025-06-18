// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:mybudiluhur/features/auth/domain/entities/app_user.dart';

class HomeUser extends AppUser {
  final String nama;
  final String profileImageUrl;

  HomeUser({
    required super.nis,
    required this.nama,
    required this.profileImageUrl,
  });

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'NIS': nis,
      'Nama': nama,
      'profileImageUrl': profileImageUrl,
    };
  }

  factory HomeUser.fromMap(Map<String, dynamic> map) {
    return HomeUser(
      nis: map['NIS'] as String,
      nama: map['Nama'] as String,
      profileImageUrl: map['profileImageUrl'] as String,
    );
  }

  @override
  String toJson() => json.encode(toMap());

  factory HomeUser.fromJson(String source) =>
      HomeUser.fromMap(json.decode(source) as Map<String, dynamic>);
}
