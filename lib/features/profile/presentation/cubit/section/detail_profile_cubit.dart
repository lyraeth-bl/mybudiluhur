import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mybudiluhur/features/profile/data/local_detail_profile_user_repository.dart';
import 'package:mybudiluhur/features/profile/domain/entities/detail_profile_user.dart';
import 'package:mybudiluhur/features/profile/presentation/cubit/section/detail_profile_state.dart';

class DetailProfileCubit extends HydratedCubit<DetailProfileState> {
  final LocalDetailProfileUserRepository localDetailProfileUserRepository;
  DetailProfileCubit({required this.localDetailProfileUserRepository})
    : super(DetailProfileInitial());

  DetailProfileUser? _detailProfileUser;

  Future<void> fetchData() async {
    emit(DetailProfileLoading());
    final DetailProfileUser? detailProfileUser =
        await localDetailProfileUserRepository.fetchDetailProfileUser();

    if (detailProfileUser != null) {
      _detailProfileUser = detailProfileUser;
      emit(DetailProfileLoaded(detailProfileUser));
    } else {
      emit(DetailProfileError("Error fetch data detailProfile"));
    }
  }

  DetailProfileUser? get detailProfileUser => _detailProfileUser;

  @override
  DetailProfileState? fromJson(Map<String, dynamic> json) {
    if (json['detailProfileUser'] != null) {
      return DetailProfileLoaded(
        DetailProfileUser.fromMap(json['detailProfileUser']),
      );
    }
    return DetailProfileError("Failed to fetch user fromJson");
  }

  @override
  Map<String, dynamic>? toJson(DetailProfileState state) {
    if (state is DetailProfileLoaded) {
      return {'detailProfileUser': state.detailProfileUser.toMap()};
    }
    return null;
  }
}
