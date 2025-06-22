import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mybudiluhur/features/ekstrakulikuler/data/api_ekstrakulikuler_user_repository.dart';
import 'package:mybudiluhur/features/ekstrakulikuler/domain/entities/ekstrakulikuler_user.dart';
import 'package:mybudiluhur/features/ekstrakulikuler/presentation/cubit/ekstrakulikuler_state.dart';

class EkstrakulikulerCubit extends HydratedCubit<EkstrakulikulerState> {
  final ApiEkstrakulikulerUserRepository apiEkstrakulikulerUserRepository;

  EkstrakulikulerCubit({required this.apiEkstrakulikulerUserRepository})
    : super(EkstrakulikulerInitial());

  EkstrakulikulerUser? _ekstrakulikulerUser;

  Future<void> fetchData(String nis) async {
    // 1. Cek dulu apakah data udah ke-cache (HydratedCubit auto restore)
    if (state is EkstrakulikulerLoaded) {
      // Kalau sudah loaded dari cache, ga perlu fetch ulang
      print('Using cached Ekstrakulikuler data.');
      return;
    }
    // 2. Kalau belum ada data, baru fetch ke API
    emit(EkstrakulikulerLoading());
    try {
      final data = await apiEkstrakulikulerUserRepository
          .fetchEkstrakulikulerUser(nis);
      if (data != null) {
        emit(EkstrakulikulerLoaded(data));
      } else {
        emit(EkstrakulikulerError("Data Ekstrakulikuler tidak ditemukan"));
      }
    } catch (e) {
      emit(EkstrakulikulerError("Gagal fetch data: $e"));
    }
  }

  EkstrakulikulerUser? get ekstrakulikulerUser => _ekstrakulikulerUser;

  Future<void> refreshData(String nis) async {
    emit(EkstrakulikulerLoading());
    try {
      await apiEkstrakulikulerUserRepository.refreshData(nis);
    } catch (e) {
      emit(EkstrakulikulerError(e.toString()));
    }
  }

  @override
  EkstrakulikulerState? fromJson(Map<String, dynamic> json) {
    try {
      final list = (json['ekstrakulikulerUser'] as List<dynamic>?);
      if (list == null) {
        // Belum ada data tersimpan, return initial/empty
        return EkstrakulikulerLoaded([]);
      }
      return EkstrakulikulerLoaded(
        list
            .map((e) => EkstrakulikulerUser.fromMap(e as Map<String, dynamic>))
            .toList(),
      );
    } catch (e) {
      print("fromJson error: $e");
      // Bisa return initial/error state juga kalau mau
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(EkstrakulikulerState state) {
    if (state is EkstrakulikulerLoaded) {
      return {
        'ekstrakulikulerUser': state.ekstrakulikulerUser
            .map((e) => e.toMap())
            .toList(),
      };
    }
    return {};
  }
}
