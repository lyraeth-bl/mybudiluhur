import 'package:mybudiluhur/features/settings/domain/entities/settings_user.dart';

abstract class SettingsState {}

class SettingsInitial extends SettingsState {}

class SettingsLoading extends SettingsState {}

class SettingsLoaded extends SettingsState {
  final SettingsUser settingsUser;
  SettingsLoaded(this.settingsUser);
}

class SettingsError extends SettingsState {
  final String message;
  SettingsError(this.message);
}
