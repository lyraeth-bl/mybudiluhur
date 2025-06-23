import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mybudiluhur/core/api/firebase/firebase_api.dart';
import 'package:mybudiluhur/core/storage/flutter_secure_storage.dart';
import 'package:mybudiluhur/features/settings/data/local_settings_user_repository.dart';
import 'package:mybudiluhur/features/settings/domain/entities/settings_user.dart';
import 'package:mybudiluhur/features/settings/presentation/cubits/cubit/settings_state.dart';

class SettingsCubit extends HydratedCubit<SettingsState> {
  final LocalSettingsUserRepository localSettingsUserRepository;

  SettingsCubit({required this.localSettingsUserRepository})
    : super(SettingsInitial());

  Future<void> fetchSettings(String nis) async {
    try {
      emit(SettingsLoading());
      final settingsUser = await localSettingsUserRepository.fetchSettingUser(
        nis,
      );
      if (settingsUser != null) {
        emit(SettingsLoaded(settingsUser));
      } else {
        emit(SettingsError("Data SettingsUser tidak ditemukan"));
      }
    } catch (e) {
      emit(SettingsError(e.toString()));
    }
  }

  Future<void> changeNotification() async {
    await FirebaseApi().initNotification();
    final nis = await secureStorage.read(key: "nis");
    await localSettingsUserRepository.changeNotification();
    await fetchSettings(nis!);
  }

  Future<void> changeThemeMode() async {
    final nis = await secureStorage.read(key: "nis");
    await localSettingsUserRepository.changeThemeMode();
    await fetchSettings(nis!);
  }

  @override
  SettingsState? fromJson(Map<String, dynamic> json) {
    try {
      return SettingsLoaded(SettingsUser.fromMap(json));
    } catch (_) {
      return SettingsInitial();
    }
  }

  @override
  Map<String, dynamic>? toJson(SettingsState state) {
    if (state is SettingsLoaded) {
      return state.settingsUser.toMap();
    }
    return null;
  }
}
