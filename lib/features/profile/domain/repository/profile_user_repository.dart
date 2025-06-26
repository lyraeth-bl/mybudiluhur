import 'package:mybudiluhur/features/profile/domain/entities/profile_user.dart';

abstract class ProfileUserRepository {
  Future<ProfileUser?> fetchProfileUser();
  Future<void> editProfileUser(ProfileUser profileUser);
  Future<void> uploadProfileImage(
    ProfileUser profileUser,
    String filePath,
    String fileName,
  );
}
