import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mybudiluhur/features/absensi_khs/data/api_absensi_user_repository.dart';
import 'package:mybudiluhur/features/absensi_khs/domain/entities/absensi_user.dart';
import 'package:mybudiluhur/features/absensi_khs/presentation/cubit/absensi_state.dart';

class AbsensiCubit extends HydratedCubit<AbsensiState> {
  final ApiAbsensiUserRepository apiAbsensiUserRepository;

  AbsensiCubit({required this.apiAbsensiUserRepository})
    : super(AbsensiInitial());

  AbsensiUser? _absensiUser;

  Future<void> fetchData(String nis) async {
    emit(AbsensiLoading());
    try {
      final absensiUser = await apiAbsensiUserRepository.fetchAbsensi();
      if (absensiUser != null) {
        emit(AbsensiLoaded(absensiUser));
      } else {
        if (state is AbsensiLoaded) {
          emit(state);
        } else {
          emit(AbsensiNull());
        }
      }
    } catch (e) {
      if (state is AbsensiLoaded) {
        emit(state);
      } else {
        emit(AbsensiError(e.toString()));
      }
    }
  }

  AbsensiUser? get absensiUser => _absensiUser;

  Future<void> refreshData(String nis) async {
    emit(AbsensiLoading());
    try {
      await apiAbsensiUserRepository.refreshData(nis);
    } catch (e) {
      emit(AbsensiError(e.toString()));
    }
  }

  @override
  AbsensiState? fromJson(Map<String, dynamic> json) {
    try {
      final list = (json['absensiUser'] as List<dynamic>?);
      if (list == null) {
        // Belum ada data tersimpan, return initial/empty
        return AbsensiLoaded([]);
      }
      return AbsensiLoaded(
        list
            .map((e) => AbsensiUser.fromMap(e as Map<String, dynamic>))
            .toList(),
      );
    } catch (e) {
      // Bisa return initial/error state juga kalau mau
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(AbsensiState state) {
    if (state is AbsensiLoaded) {
      return {'absensiUser': state.absensiUser.map((e) => e.toMap()).toList()};
    }
    return {};
  }
}
