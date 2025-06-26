import 'package:get/get.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mybudiluhur/features/home/data/api_home_user_repository.dart';
import 'package:mybudiluhur/features/home/domain/entities/home_user.dart';
import 'package:mybudiluhur/features/home/presentation/cubit/home_state.dart';

class HomeCubit extends HydratedCubit<HomeState> {
  final ApiHomeUserRepository apiHomeUserRepository;
  HomeCubit({required this.apiHomeUserRepository}) : super(HomeInitial());

  HomeUser? _currentHomeUser;

  Future<void> fetchData() async {
    emit(HomeLoading());
    final HomeUser? homeUser = await apiHomeUserRepository.fetchHomeUserData();

    try {
      if (homeUser != null) {
        _currentHomeUser = homeUser;
        emit(HomeLoaded(homeUser));
      } else {
        if (state is HomeLoaded) {
          emit(state);
        } else {
          emit(HomeNull());
        }
      }
    } catch (e) {
      if (state is HomeLoaded) {
        emit(state);
      } else {
        emit(HomeError(e.toString()));
      }
    }
  }

  HomeUser? get currentHomeUser => _currentHomeUser;

  Future<void> refreshData(String nis) async {
    emit(HomeLoading());
    try {
      if (Get.isSnackbarOpen) {
        return;
      }
      await apiHomeUserRepository.refreshData(nis);
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }

  @override
  HomeState fromJson(Map<String, dynamic> json) {
    return HomeLoaded(HomeUser.fromMap(json));
  }

  @override
  Map<String, dynamic> toJson(HomeState state) {
    if (state is HomeLoaded) {
      return state.homeUser.toMap();
    }
    return {};
  }
}
