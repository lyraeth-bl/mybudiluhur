import 'package:mybudiluhur/features/settings/domain/entities/settings_user.dart';

abstract class SettingsUserRepository {
  Future<SettingsUser?> fetchSettingUser(String nis);
  Future<void> changeThemeMode();
  Future<void> changeNotification();
}
