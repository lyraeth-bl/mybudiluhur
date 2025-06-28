import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mybudiluhur/features/forum/data/api_forum_app_repository.dart';
import 'package:mybudiluhur/features/forum/domain/entities/forum_app.dart';
import 'package:mybudiluhur/features/forum/presentation/cubit/forum_state.dart';

class ForumCubit extends HydratedCubit<ForumState> {
  final ApiForumAppRepository apiForumAppRepository;

  ForumCubit({required this.apiForumAppRepository}) : super(ForumInitial());

  ForumApp? _forumApp;

  Future<void> fetchData(String nis) async {
    emit(ForumLoading());
    try {
      final forumUser = await apiForumAppRepository.fetchForum();
      if (forumUser != null) {
        emit(ForumLoaded(forumUser));
      } else {
        if (state is ForumLoaded) {
          emit(state);
        } else {
          emit(ForumNull());
        }
      }
    } catch (e) {
      if (state is ForumLoaded) {
        emit(state);
      } else {
        emit(ForumError(e.toString()));
      }
    }
  }

  ForumApp? get forumApp => _forumApp;

  Future<void> refreshData(String nis) async {
    emit(ForumLoading());
    try {
      await apiForumAppRepository.refreshData(nis);
    } catch (e) {
      emit(ForumError(e.toString()));
    }
  }

  @override
  fromJson(Map<String, dynamic> json) {
    try {
      final list = (json['forum'] as List<dynamic>?);
      if (list == null) {
        // Belum ada data tersimpan, return initial/empty
        return ForumLoaded([]);
      }
      return ForumLoaded(
        list.map((e) => ForumApp.fromMap(e as Map<String, dynamic>)).toList(),
      );
    } catch (e) {
      // Bisa return initial/error state juga kalau mau
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(state) {
    if (state is ForumLoaded) {
      return {'absensiUser': state.forumApp.map((e) => e.toMap()).toList()};
    }
    return {};
  }
}
