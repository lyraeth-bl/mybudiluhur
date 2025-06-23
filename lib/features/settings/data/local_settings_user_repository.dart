import 'package:mybudiluhur/core/storage/flutter_secure_storage.dart';
import 'package:mybudiluhur/features/settings/domain/entities/settings_user.dart';
import 'package:mybudiluhur/features/settings/domain/repository/settings_user_repository.dart';

class LocalSettingsUserRepository implements SettingsUserRepository {
  @override
  Future<void> changeNotification() async {
    final notificationUser = await secureStorage.read(key: "notification");
    final newValue = notificationUser == "true" ? "false" : "true";
    await secureStorage.write(key: "notification", value: newValue);
  }

  @override
  Future<void> changeThemeMode() async {
    final themeModeUser = await secureStorage.read(key: "thememode");
    final newValue = themeModeUser == "true" ? "false" : "true";
    await secureStorage.write(key: "thememode", value: newValue);
  }

  @override
  Future<SettingsUser?> fetchSettingUser(String nis) async {
    final themeModeUser = await secureStorage.read(key: 'thememode');
    final notificationUser = await secureStorage.read(key: 'notification');
    return SettingsUser(
      nis: nis,
      theme: themeModeUser ?? 'false',
      notification: notificationUser ?? 'false',
    );
  }
}
