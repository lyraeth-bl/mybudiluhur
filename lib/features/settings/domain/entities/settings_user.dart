// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:mybudiluhur/features/auth/domain/entities/app_user.dart';

class SettingsUser extends AppUser {
  final String theme;
  final String notification;

  SettingsUser({
    required super.nis,
    required this.theme,
    required this.notification,
  });

  SettingsUser copyWith({String? newTheme, String? newNotification}) {
    return SettingsUser(
      nis: nis,
      theme: newTheme ?? theme,
      notification: newNotification ?? notification,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'NIS': nis,
      'theme': theme,
      'notification': notification,
    };
  }

  factory SettingsUser.fromMap(Map<String, dynamic> map) {
    return SettingsUser(
      nis: map['NIS'] as String,
      theme: map['theme'] as String,
      notification: map['notification'] as String,
    );
  }

  @override
  String toJson() => json.encode(toMap());

  factory SettingsUser.fromJson(String source) =>
      SettingsUser.fromMap(json.decode(source) as Map<String, dynamic>);
}
