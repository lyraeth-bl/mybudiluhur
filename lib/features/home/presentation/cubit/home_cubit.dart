import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mybudiluhur/features/home/data/api_home_user_repository.dart';
import 'package:mybudiluhur/features/home/domain/entities/home_user.dart';
import 'package:mybudiluhur/features/home/presentation/cubit/home_state.dart';

class HomeCubit extends HydratedCubit<HomeState> {
  final ApiHomeUserRepository apiHomeUserRepository;
  HomeUser? _currentHomeUser;
  HomeCubit({required this.apiHomeUserRepository}) : super(HomeInitial());

  void fetchHomeUser() async {
    emit(HomeLoading());
    final HomeUser? homeUser = await apiHomeUserRepository.fetchHomeUserData();

    if (homeUser != null) {
      _currentHomeUser = homeUser;
      emit(HomeLoaded(homeUser));
    } else {
      emit(HomeError("Failed to fetch data HomeUser"));
    }
  }

  HomeUser? get currentHomeUser => _currentHomeUser;

  @override
  HomeState? fromJson(Map<String, dynamic> json) {
    // Cek kalau ada key 'homeUser' berarti pernah nyimpen HomeLoaded
    if (json['homeUser'] != null) {
      return HomeLoaded(HomeUser.fromMap(json['homeUser']));
    }
    // Bisa tambahkan handling buat error/initial state kalau perlu
    return HomeError("Failed to user fromJson");
  }

  @override
  Map<String, dynamic>? toJson(HomeState state) {
    if (state is HomeLoaded) {
      return {'homeUser': state.homeUser.toMap()};
    }
    // Hanya HomeLoaded yang di-save, state lain di-ignore
    return null;
  }
}
