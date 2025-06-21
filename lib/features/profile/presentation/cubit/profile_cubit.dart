import 'dart:io';

import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mybudiluhur/features/profile/data/api_profile_user_repository.dart';
import 'package:mybudiluhur/features/profile/domain/entities/profile_user.dart';
import 'package:mybudiluhur/features/profile/presentation/cubit/profile_state.dart';

class ProfileCubit extends HydratedCubit<ProfileState> {
  final ApiProfileUserRepository apiProfileUserRepository;
  ProfileUser? _profileUser;
  File? selectedImageFile;

  ProfileCubit({required this.apiProfileUserRepository})
    : super(ProfileInitial());

  Future<void> fetchProfileUser() async {
    emit(ProfileLoading());
    try {
      final profileUser = await apiProfileUserRepository.fetchProfileUser();
      if (profileUser != null) {
        emit(ProfileLoaded(profileUser));
      } else {
        if (state is ProfileLoaded) {
          emit(state);
        } else {
          emit(ProfileError("Data ProfileUser tidak ditemukan"));
        }
      }
    } catch (e) {
      if (state is ProfileLoaded) {
        emit(state);
      } else {
        emit(ProfileError(e.toString()));
      }
    }
  }

  ProfileUser? get currentProfileUser => _profileUser;

  Future<void> updateProfile({required String nis, String? newPassword}) async {
    emit(ProfileLoading());

    try {
      final currentUser = await apiProfileUserRepository.fetchProfileUser();
      if (currentUser == null) {
        emit(ProfileError("Failed to fetch user for profile update"));
        return;
      }

      if (newPassword != null && newPassword.isNotEmpty) {
        final updatedUser = currentUser.copyWith(newPassword: newPassword);
        await apiProfileUserRepository.editProfileUser(updatedUser);
      }

      if (selectedImageFile != null) {
        final fileName = selectedImageFile!.path.split('/').last;
        await apiProfileUserRepository.uploadProfileImage(
          currentUser,
          selectedImageFile!.path,
          fileName,
        );
      }

      await fetchProfileUser();
    } catch (e) {
      emit(ProfileError("Error updating profile"));
    }
  }

  Future<void> uploadProfileImage({
    required String nis,
    required String filePath,
  }) async {
    emit(ProfileLoading());
    try {
      final currentUser = await apiProfileUserRepository.fetchProfileUser();
      if (currentUser == null) {
        emit(ProfileError("User not found for image upload"));
        return;
      }

      final fileName = filePath.split('/').last;

      await apiProfileUserRepository.uploadProfileImage(
        currentUser,
        filePath,
        fileName,
      );

      await fetchProfileUser();
    } catch (e) {
      emit(ProfileError("Failed to upload image"));
    }
  }

  void setSelectedImage(File file) {
    selectedImageFile = file;
  }

  @override
  ProfileState fromJson(Map<String, dynamic> json) {
    return ProfileLoaded(ProfileUser.fromMap(json));
  }

  @override
  Map<String, dynamic> toJson(ProfileState state) {
    if (state is ProfileLoaded) {
      return state.profileUser.toMap();
    }
    return {};
  }
}
